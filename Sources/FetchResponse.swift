import Foundation

/// Represents request's response.
public class FetchResponse {
    /// The HTTP status code of a response
    public let status: Int

    /// The response in String format
    public let text: String

    /// The body of the response in a binary format
    public let content: Data

    /// The URL on disk where the file was saved
    public let downloadDestinationURL: URL?

    /// Initializer
    ///
    /// - Parameters:
    ///   - status: The response’s HTTP status code.
    ///   - text: Text representation of the response.
    ///   - content: Binary representation of the reponse.
    ///   - downloadDestinationURL: The URL on disk where the file was saved
    public init(status: Int, text: String, content: Data, downloadDestinationURL: URL? = nil) {
        self.status = status
        self.text = text
        self.content = content
        self.downloadDestinationURL = downloadDestinationURL
    }
}
