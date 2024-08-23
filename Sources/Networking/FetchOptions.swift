import Foundation

/// Represents HTTP headers for API requests.
public enum HTTPMethod: String, ExpressibleByStringLiteral, CaseIterable {

    public init(stringLiteral value: String) {
        self = Self.allCases.map {$0.rawValue}.contains(value)
        ? Self.init(rawValue: value)!
        : .get
    }

    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case options = "OPTIONS"
}

/// Represents paremeters used for the request.
public class FetchOptions {

    /// The HTTP request URL
    public let url: String

    /// The HTTP request method (e.g. get, post, delete)
    public let method: HTTPMethod

    /// Additional parameters to be passed in the URL that is called.
    public internal(set) var params:  [String: ParameterConvertible?]

    /// Additional information to be passed in the HTTP headers of the request.
    public internal(set) var headers:  [String: ParameterConvertible?]

    /// Body of the request.
    public let data: SerializedData?

    /// A stream containing the file contents.
    public let fileStream: InputStream?

    /// Parts of multipart data.
    public let multipartData: [MultipartItem]?

    /// The URL on disk where the data will be saved
    public let downloadDestinationURL: URL?

    /// Content type header of the request.
    public let contentType: String?

    /// Expected format of the response: 'json', 'binary'
    public let responseFormat: String?

    /// Provides authentication session management.
    public let auth: Authentication?

    /// Provides the URLSession along with the network configuration parameters
    public let networkSession: NetworkSession?

    /// Initializer
    ///
    /// - Parameters:
    ///   - url: The HTTP request URL.
    ///   - method: The HTTP request method (e.g. GET, POST, DELETE).
    ///   - params: Additional parameters to be passed in the URL that is called.
    ///   - headers: Additional information to be passed in the HTTP headers of the request.
    ///   - data: Body of the request.
    ///   - fileStream: A stream containing the file contents.
    ///   - multipartData: Parts of multipart data.
    ///   - downloadDestinationURL: The URL on disk where the data will be saved
    ///   - contentType: Content type of the request.
    ///   - responseFormat: Expected format of the response: 'json', 'binary'
    ///   - auth: The authentication sesson management used in the request.
    ///   - networkSession: The URLSession holder along with the network configuration parameters
    public init(
        url: String,
        method: HTTPMethod = HTTPMethod.get,
        params: [String : ParameterConvertible?] = [:],
        headers: [String : ParameterConvertible?] = [:],
        data: SerializedData? = nil,
        fileStream: InputStream? = nil,
        multipartData: [MultipartItem]? = nil,
        downloadDestinationURL: URL? = nil,
        contentType: String? = nil,
        responseFormat: String? = nil,
        auth: Authentication? = nil,
        networkSession: NetworkSession? = nil
    ) {
        self.url = url
        self.method = method
        self.headers = headers
        self.params = params
        self.data = data
        self.fileStream = fileStream
        self.multipartData = multipartData
        self.downloadDestinationURL = downloadDestinationURL
        self.contentType = contentType
        self.responseFormat = responseFormat
        self.auth = auth
        self.networkSession = networkSession
    }
}
