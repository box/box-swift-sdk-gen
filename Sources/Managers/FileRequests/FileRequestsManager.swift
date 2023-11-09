import Foundation

public class FileRequestsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves the information about a file request.
    ///
    /// - Parameters:
    ///   - fileRequestId: The unique identifier that represent a file request.
    ///     
    ///     The ID for any file request can be determined
    ///     by visiting a file request builder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/filerequest/123`
    ///     the `file_request_id` is `123`.
    ///     Example: "123"
    ///   - headers: Headers of getFileRequestById method
    /// - Returns: The `FileRequest`.
    /// - Throws: The `GeneralError`.
    public func getFileRequestById(fileRequestId: String, headers: GetFileRequestByIdHeadersArg = GetFileRequestByIdHeadersArg()) async throws -> FileRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_requests/")\(fileRequestId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileRequest.deserialize(from: response.data)
    }

    /// Updates a file request. This can be used to activate or
    /// deactivate a file request.
    ///
    /// - Parameters:
    ///   - fileRequestId: The unique identifier that represent a file request.
    ///     
    ///     The ID for any file request can be determined
    ///     by visiting a file request builder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/filerequest/123`
    ///     the `file_request_id` is `123`.
    ///     Example: "123"
    ///   - requestBody: Request body of updateFileRequestById method
    ///   - headers: Headers of updateFileRequestById method
    /// - Returns: The `FileRequest`.
    /// - Throws: The `GeneralError`.
    public func updateFileRequestById(fileRequestId: String, requestBody: FileRequestUpdateRequest, headers: UpdateFileRequestByIdHeadersArg = UpdateFileRequestByIdHeadersArg()) async throws -> FileRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-match": Utils.Strings.toString(value: headers.ifMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_requests/")\(fileRequestId)", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileRequest.deserialize(from: response.data)
    }

    /// Deletes a file request permanently.
    ///
    /// - Parameters:
    ///   - fileRequestId: The unique identifier that represent a file request.
    ///     
    ///     The ID for any file request can be determined
    ///     by visiting a file request builder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/filerequest/123`
    ///     the `file_request_id` is `123`.
    ///     Example: "123"
    ///   - headers: Headers of deleteFileRequestById method
    /// - Throws: The `GeneralError`.
    public func deleteFileRequestById(fileRequestId: String, headers: DeleteFileRequestByIdHeadersArg = DeleteFileRequestByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_requests/")\(fileRequestId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Copies an existing file request that is already present on one folder,
    /// and applies it to another folder.
    ///
    /// - Parameters:
    ///   - fileRequestId: The unique identifier that represent a file request.
    ///     
    ///     The ID for any file request can be determined
    ///     by visiting a file request builder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/filerequest/123`
    ///     the `file_request_id` is `123`.
    ///     Example: "123"
    ///   - requestBody: Request body of createFileRequestCopy method
    ///   - headers: Headers of createFileRequestCopy method
    /// - Returns: The `FileRequest`.
    /// - Throws: The `GeneralError`.
    public func createFileRequestCopy(fileRequestId: String, requestBody: FileRequestCopyRequest, headers: CreateFileRequestCopyHeadersArg = CreateFileRequestCopyHeadersArg()) async throws -> FileRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_requests/")\(fileRequestId)\("/copy")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileRequest.deserialize(from: response.data)
    }

}
