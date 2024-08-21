import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

enum HTTPHeaderKey {
    static let authorization = "Authorization"
    static let contentType = "Content-Type"
    static let retryAfter = "Retry-After"
}

enum HTTPHeaderContentTypeValue {
    static let urlEncoded = "application/x-www-form-urlencoded"
}

/// Networking layer interface
public class NetworkClient {
    public static let shared = NetworkClient()
    
    private let utilityQueue = DispatchQueue.global(qos: .utility)
    
    private init(){}
    
    /// Executes requests
    ///
    /// - Parameters:
    ///   - url: The URL for the request.
    ///   - options: Request options  that provides request-specific information, such as the request type, and body, query parameters.
    /// - Returns: Response of the request in the form of FetchResponse object.
    /// - Throws: An error if the request fails for any reason.
    public func fetch(url: String, options: FetchOptions) async throws -> FetchResponse {
        var options = options
        
        if let fileStream = options.fileStream, !(fileStream is BufferInputStream) {
            let buffered = createBufferInputStream(from: fileStream)
            guard let buffered = buffered else {
                fatalError("Wrong data")
            }
            
            options = options.withFileStream(fileStream: buffered)
        }
        
        
        return try await fetch(
            url: url,
            options: options,
            networkSession: options.networkSession ?? NetworkSession(),
            attempt: 1
        )
        
    }
    
    /// Executes requests
    ///
    /// - Parameters:
    ///   - url: The URL for the request.
    ///   - options: Request options  that provides request-specific information, such as the request type, and body, query parameters.
    ///   - networkSession: The Networking Session object which provides the URLSession object along with a network configuration parameters used in network communication.
    ///   - attempt: The request attempt number.
    /// - Returns: Response of the request in the form of FetchResponse object.
    /// - Throws: An error if the request fails for any reason.
    private func fetch(
        url: String,
        options: FetchOptions,
        networkSession: NetworkSession,
        attempt: Int
    ) async throws -> FetchResponse {
        let urlRequest = try await createRequest(
            url: url,
            options: options,
            networkSession: networkSession
        )
        
        if let downloadDestinationURL = options.downloadDestinationURL {
            let (downloadUrl, urlResponse) = try await sendDownloadRequest(urlRequest, downloadDestinationURL: downloadDestinationURL, networkSession: networkSession)
            let conversation = FetchConversation(url: url, options: options, urlRequest: urlRequest, urlResponse: urlResponse as! HTTPURLResponse, responseType: .url(downloadUrl))
            return try await processResponse(using: conversation, networkSession: networkSession, attempt: attempt)
        } else {
            let (data, urlResponse) =  try await sendDataRequest(urlRequest, networkSession: networkSession)
            let conversation = FetchConversation(url: url, options: options, urlRequest: urlRequest, urlResponse: urlResponse as! HTTPURLResponse, responseType: .data(data))
            return try await processResponse(using: conversation, networkSession: networkSession, attempt: attempt)
        }
    }
    
    /// Executes data request using dataTask and converts it's callback based API into an async API.
    ///
    /// - Parameters:
    ///   - urlRequest: The request object.
    ///   - networkSession: The Networking Session object which provides the URLSession object along with a network configuration parameters used in network communication.
    /// - Returns: Tuple of  of (Data, URLResponse)
    /// - Throws: An error if the request fails for any reason.
    private func sendDataRequest(_ urlRequest: URLRequest, networkSession: NetworkSession) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            networkSession.session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    continuation.resume(with: .failure(BoxNetworkError(message: error.localizedDescription, error: error)))
                    return
                }
                
                guard let response = response else {
                    continuation.resume(
                        with: .failure(BoxNetworkError(message: "No response \(urlRequest.url?.absoluteString ?? "")."))
                    )
                    return
                }
                
                continuation.resume(
                    with: .success((data ?? Data(), response))
                )
            }
            .resume()
        }
    }
    
    /// Executes download request using downloadTask and converts it's callback based API into an async API.
    ///
    /// - Parameters:
    ///   - urlRequest: The request object.
    ///   - networkSession: The Networking Session object which provides the URLSession object along with a network configuration parameters used in network communication.
    /// - Returns: Tuple of  of (URL, URLResponse)
    /// - Throws: An error if the request fails for any reason.
    private func sendDownloadRequest(_ urlRequest: URLRequest, downloadDestinationURL: URL, networkSession: NetworkSession) async throws -> (URL, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            networkSession.session.downloadTask(with: urlRequest) { location, response, error in
                if let error = error {
                    continuation.resume(with: .failure(BoxNetworkError(message: error.localizedDescription, error: error)))
                    return
                }
                
                guard let localURL = location else {
                    continuation.resume(
                        with: .failure(BoxNetworkError(message: "File was not downloaded \(urlRequest.url?.absoluteString ?? "")"))
                    )
                    return
                }
                
                guard let response = response else {
                    continuation.resume(
                        with: .failure(BoxNetworkError(message: "No response \(urlRequest.url?.absoluteString ?? "")."))
                    )
                    return
                }
                
                do {
                    try? FileManager.default.removeItem(at: downloadDestinationURL)
                    try FileManager.default.moveItem(at: localURL, to: downloadDestinationURL)
                }
                catch {
                    continuation.resume(
                        with: .failure(BoxSDKError(message: "Could not move item from temporary download location \(localURL.absoluteString) to download destination \(downloadDestinationURL.absoluteString)."))
                    )
                }
                
                continuation.resume(
                    with: .success((downloadDestinationURL, response))
                )
            }.resume()
        }
    }
    
    /// Creates the request object `URLRequest` based on  parameters passed in `options`.
    ///
    /// - Parameters:
    ///   - url: The URL for the request.
    ///   - options: Request options  that provides request-specific information, such as the request type, and body, query parameters.
    ///   - networkSession: The Networking Session object which provides the URLSession object along with a network configuration parameters used in network communication.
    /// - Returns: The URLRequest object which represents information about the request.
    /// - Throws: An error if the operation fails for any reason.
    private func createRequest(
        url: String,
        options: FetchOptions,
        networkSession: NetworkSession
    ) async throws -> URLRequest {
        var urlRequest = URLRequest(url: createEndpointUrl(url: url, params: options.params))
        urlRequest.httpMethod = options.method.rawValue
        
        try await updateRequestWithHeaders(&urlRequest, options: options, networkSession: networkSession)
        
        if let fileStream = options.fileStream {
            if let bufferedInputStream = fileStream as? BufferInputStream {
                bufferedInputStream.reset()
            }
            
            urlRequest.httpBodyStream = fileStream
        } else if let multipartData = options.multipartData {
            try updateRequestWithMultipartData(&urlRequest, multipartData: multipartData)
        }
        
        if let serializedData = options.data {
            if HTTPHeaderContentTypeValue.urlEncoded == options.contentType {
                urlRequest.httpBody = (try serializedData.toUrlParams()).data(using: .utf8)
            } else {
                urlRequest.httpBody = try serializedData.toJson()
            }
        }
        
        return urlRequest
    }
    
    /// Updates the passed request object `URLRequest` with headers,  based on  parameters passed in `options`.
    ///
    /// - Parameters:
    ///   - urlRequest: The request object.
    ///   - options: Request options  that provides request-specific information, such as the request type, and body, query parameters.
    ///   - networkSession: The Networking Session object which provides the URLSession object along with a network configuration parameters used in network communication.
    /// - Throws: An error if the operation fails for any reason.
    private func updateRequestWithHeaders(_ urlRequest: inout URLRequest, options: FetchOptions, networkSession: NetworkSession) async throws {
        urlRequest.allHTTPHeaderFields = options.headers.compactMapValues { $0?.paramValue }
        
        for (key, value) in networkSession.additionalHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if let contentType = options.contentType {
            urlRequest.setValue(contentType, forHTTPHeaderField: HTTPHeaderKey.contentType)
        }
        
        for (key, value) in BoxConstants.analyticsHeaders {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        try await updateRequestWithAuthorizationHeader(&urlRequest, options: options, networkSession: networkSession)
    }
    
    /// Updates the passed request object `URLRequest` with authorization header,  based on  parameters passed in `options`.
    ///
    /// - Parameters:
    ///   - urlRequest: The request object.
    ///   - options: Request options  that provides request-specific information, such as the request type, and body, query parameters.
    ///   - networkSession: The Networking Session object which provides the URLSession object along with a network configuration parameters used in network communication.
    /// - Throws: An error if the operation fails for any reason.
    private func updateRequestWithAuthorizationHeader(_ urlRequest: inout URLRequest, options: FetchOptions, networkSession: NetworkSession) async throws {
        if let auth = options.auth, let token = (try await auth.retrieveToken(networkSession: networkSession)).accessToken {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: HTTPHeaderKey.authorization)
        }
    }
    
    /// Updates the passed request object `URLRequest` with multipart data,  based on  parameters passed in `multipartData`.
    ///
    /// - Parameters:
    ///   - urlRequest: The request object.
    ///   - multipartData: An array of `MultipartItem` which will be used to create the body of the request.
    private func updateRequestWithMultipartData(_ urlRequest: inout URLRequest, multipartData: [MultipartItem]) throws {
        var parameters: [String: Any] = [:]
        var partName = ""
        var fileName = ""
        var mimeType = ""
        var bodyStream = InputStream(data: Data())
        let boundary = "Boundary-\(UUID().uuidString)"
        for part in multipartData {
            if let body = part.data {
                parameters[part.partName] = Utils.Strings.from(data: try body.toJson())
            } else if let fileStream = part.fileStream {
                let unwrapFileName = part.fileName ?? ""
                let unwrapMimeType = part.contentType ?? ""
                
                partName = part.partName
                fileName = unwrapFileName
                mimeType = unwrapMimeType
                bodyStream = fileStream
            }
        }
        
        let bodyStreams = createMultipartBodyStreams(parameters, partName: partName, fileName: fileName, mimetype: mimeType, bodyStream: bodyStream, boundary: boundary)
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: HTTPHeaderKey.contentType)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBodyStream = ArrayInputStream(inputStreams: bodyStreams)
    }
    
    /// Creates an array of `InputStream`based on passed arguments, which will be used as an bodyStream of the request.
    ///
    /// - Parameters:
    ///   - parameters: The parameters of the multipart request in form of a Dictionary.
    ///   - partName: The name of the file part.
    ///   - fileName: The file name.
    ///   - mimetype: The content type of the file part.
    ///   - bodyStream: The stream containing the file contents.
    ///   - boundary: The boundary value,  used to separate name/value pair.
    /// - Returns: An array of `InputStream`streams.
    private func createMultipartBodyStreams(_ parameters: [String: Any]?, partName: String, fileName: String, mimetype: String, bodyStream: InputStream, boundary: String) -> [InputStream] {
        var preBody = Data()
        if let parameters = parameters {
            for (key, value) in parameters {
                preBody.append("--\(boundary)\r\n".data(using: .utf8)!)
                preBody.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
                preBody.append("\(value)\r\n".data(using: .utf8)!)
            }
        }
        
        preBody.append("--\(boundary)\r\n".data(using: .utf8)!)
        preBody.append("Content-Disposition: form-data; name=\"\(partName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        preBody.append("Content-Type: \(mimetype)\r\n\r\n".data(using: .utf8)!)
        
        var postBody = Data()
        postBody.append("\r\n".data(using: .utf8)!)
        postBody.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        var bodyStreams: [InputStream] = []
        bodyStreams.append(InputStream(data: preBody))
        bodyStreams.append(bodyStream)
        bodyStreams.append(InputStream(data: postBody))
        
        return bodyStreams
    }
    
    /// Creates a `URL`object  based on url and query parameters
    ///
    /// - Parameters:
    ///   - url: The URL for the request.
    ///   - params: Query parameters to be passed in the URL.
    /// - Returns: The URL of the endpoint.
    private func createEndpointUrl(url: String, params: [String: ParameterConvertible?]?) -> URL {
        guard let params = params else {
            return URL(string: url)!
        }
        
        let nonNullQueryParams: [String: String] = params.compactMapValues { $0?.paramValue }
        var components = URLComponents(url: URL(string: url)!, resolvingAgainstBaseURL: true)!
        components.queryItems = nonNullQueryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        return components.url!
    }
    
    /// Processes  response and performs the appropriate action
    ///
    /// - Parameters:
    ///   - using: Represents a data combined with the request and the corresponding response.
    ///   - networkSession: The Networking Session object which provides the URLSession object along with a network configuration parameters used in network communication.
    ///   - attempt: The request attempt number.
    /// - Returns: Response of the request in the form of FetchResponse object.
    /// - Throws: An error if the operation fails for any reason.
    private func processResponse(
        using conversation: FetchConversation,
        networkSession: NetworkSession,
        attempt: Int
    ) async throws -> FetchResponse {
        let statusCode = conversation.urlResponse.statusCode
        let isStatusCodeAcceptedWithRetryAfterHeader = statusCode == 202 && conversation.urlResponse.value(forHTTPHeaderField: HTTPHeaderKey.retryAfter) != nil
        
        // OK
        if statusCode >= 200 && statusCode < 400 && !isStatusCodeAcceptedWithRetryAfterHeader {
            return conversation.convertToFetchResponse()
        }
        
        // available attempts exceeded
        if attempt >= networkSession.networkSettings.maxRetryAttempts {
            throw BoxAPIError(fromConversation: conversation, message: "Request has hit the maximum number of retries.")
        }
        
        // Unauthorized
        if statusCode == 401, let auth = conversation.options.auth  {
            _ = try await auth.refreshToken(networkSession: networkSession)
            return try await fetch(url: conversation.url, options: conversation.options, networkSession: networkSession, attempt: attempt + 1)
        }
        
        // Retryable
        if statusCode == 429 || statusCode >= 500 || isStatusCodeAcceptedWithRetryAfterHeader {
            let retryTimeout = Double(conversation.urlResponse.value(forHTTPHeaderField: HTTPHeaderKey.retryAfter) ?? "")
            ?? networkSession.networkSettings.retryStrategy.getRetryTimeout(attempt: attempt)
            try await wait(seconds: retryTimeout)
            
            return try await fetch(url: conversation.url, options: conversation.options, networkSession: networkSession, attempt: attempt + 1)
        }
        
        throw BoxAPIError(fromConversation: conversation)
    }
    
    /// Suspends the current task for the given duration of seconds.
    ///
    /// - Parameters:
    ///   - seconds: Number of seconds to wait.
    /// - Throws: An error if the operation fails for any reason.
    private func wait(seconds delay: TimeInterval) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            utilityQueue.asyncAfter(
                deadline: .now() + .milliseconds(Int(delay * 1000))
            ) {
                continuation.resume()
            }
        }
    }
    
    
//    func createBufferInputStream(from inputStream: InputStream) -> BufferInputStream? {
//        inputStream.open()
//
//        let bufferSize = 1024
//        var totalLength = 0
//        var buffers = [UnsafeMutablePointer<UInt8>]()
//
//        while inputStream.hasBytesAvailable {
//            let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)
//            let bytesRead = inputStream.read(buffer, maxLength: bufferSize)
//            if bytesRead > 0 {
//                totalLength += bytesRead
//                buffers.append(buffer)
//            } else {
//                buffer.deallocate() // Clean up in case of error
//                if bytesRead < 0 {
//                    print("Error reading from InputStream")
//                    inputStream.close()
//                    return nil
//                }
//            }
//        }
//
//        inputStream.close()
//
//        guard totalLength > 0 else {
//            return nil
//        }
//
//        // Allocate a single contiguous memory block to hold all the data
//        let totalBuffer = UnsafeMutablePointer<UInt8>.allocate(capacity: totalLength)
//        var currentPosition = 0
//
//        for buffer in buffers {
//            let size = min(bufferSize, totalLength - currentPosition)
//            memcpy(totalBuffer + currentPosition, buffer, size)
//            currentPosition += size
//            buffer.deallocate() // Free the individual buffer after copying
//        }
//
//        return BufferInputStream(buffer: totalBuffer, length: totalLength)
//    }
    
    func createBufferInputStream(from inputStream: InputStream) -> BufferInputStream? {
        // Open the input stream
        inputStream.open()
        
        // Create a buffer to hold the data read from the InputStream
        let bufferSize = 1024
        var buffer = [UInt8](repeating: 0, count: bufferSize)
        var data = Data()
        
        // Read data from the InputStream into the buffer
        while inputStream.hasBytesAvailable {
            let bytesRead = inputStream.read(&buffer, maxLength: bufferSize)
            if bytesRead > 0 {
                data.append(buffer, count: bytesRead)
            } else if bytesRead < 0 {
                // Handle error
                print("Error reading from InputStream")
                return nil
            }
        }
        
        // Close the InputStream
        inputStream.close()
        
//        let byteArray = [UInt8](data)
//        // Allocate memory for the buffer pointer and copy data into it
//        let pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: byteArray.count)
//        pointer.initialize(from: byteArray, count: byteArray.count)
        
        
        return BufferInputStream(data: data)
    }
    
}
