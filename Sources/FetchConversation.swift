import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// Represents a data combined with the request and the corresponding response.
class FetchConversation {
    /// Represents response type, either data or downloaded file
    enum ResponseType {
        case data(Data)
        case url(URL)
    }

    /// The URL for the request.
    let url: String
    /// Request options  that provides request-specific information, such as the request type, and body, query parameters.
    let options: FetchOptions
    /// Represents an URL request.
    let urlRequest: URLRequest
    /// Represents a response to an HTTP URL.
    let urlResponse: HTTPURLResponse
    /// Represents response type, either data or downloaded file
    let responseType: ResponseType

    /// Initializer
    ///
    /// - Parameters:
    ///   - url: The URL for the request.
    ///   - options: Request options  that provides request-specific information, such as the request type, and body, query parameters.
    ///   - urlRequest: Represents an URL request.
    ///   - urlResponse: Represents a response to an HTTP URL
    ///   - responseType: Represents response type, either data or downloaded file
    init(url: String, options: FetchOptions, urlRequest: URLRequest, urlResponse: HTTPURLResponse, responseType: ResponseType) {
        self.url = url
        self.options = options
        self.urlRequest = urlRequest
        self.urlResponse = urlResponse
        self.responseType = responseType
    }

    /// Creates the FetchResponse based on the current instance.
    ///
    /// - Returns: An instance of the`FetchResponse`.
    func convertToFetchResponse() -> FetchResponse {
        switch self.responseType {
        case let .data(data):
            return FetchResponse(status: urlResponse.statusCode, text: String(decoding: data, as: UTF8.self), content: data)
        case let .url(url):
            return FetchResponse(status: urlResponse.statusCode, text: "" , content: Data(), downloadDestinationURL: url)
        }
    }
}
