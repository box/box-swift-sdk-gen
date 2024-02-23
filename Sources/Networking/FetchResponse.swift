import Foundation

/// Represents request's response.
public class FetchResponse {
    /// The HTTP status code of a response
    public let status: Int

    /// The response
    public let data: SerializedData

    /// The URL on disk where the file was saved
    public let downloadDestinationURL: URL?

    /// Initializer
    ///
    /// - Parameters:
    ///   - status: The response’s HTTP status code.
    ///   - text: Text representation of the response.
    ///   - content: Binary representation of the reponse.
    ///   - downloadDestinationURL: The URL on disk where the file was saved
    public init(status: Int, data: SerializedData, downloadDestinationURL: URL? = nil) {
        self.status = status
        self.data = data
        self.downloadDestinationURL = downloadDestinationURL
    }
}
