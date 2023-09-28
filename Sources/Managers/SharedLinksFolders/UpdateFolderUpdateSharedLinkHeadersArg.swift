import Foundation

public class UpdateFolderUpdateSharedLinkHeadersArg {
    /// Extra headers that will be included in the HTTP request.,
    public let extraHeaders: [String: String?]?

    /// Initializer for a UpdateFolderUpdateSharedLinkHeadersArg.
    ///
    /// - Parameters:
    ///   - extraHeaders: Extra headers that will be included in the HTTP request.
    public init(extraHeaders: [String: String?]? = [:]) {
        self.extraHeaders = extraHeaders
    }

}
