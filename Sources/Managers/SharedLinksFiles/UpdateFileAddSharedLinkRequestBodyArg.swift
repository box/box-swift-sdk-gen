import Foundation

public class UpdateFileAddSharedLinkRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case sharedLink = "shared_link"
    }

    /// The settings for the shared link to create on the file.
    /// Use an empty object (`{}`) to use the default settings for shared
    /// links.
    public let sharedLink: UpdateFileAddSharedLinkRequestBodyArgSharedLinkField?

    /// Initializer for a UpdateFileAddSharedLinkRequestBodyArg.
    ///
    /// - Parameters:
    ///   - sharedLink: The settings for the shared link to create on the file.
    ///     Use an empty object (`{}`) to use the default settings for shared
    ///     links.
    public init(sharedLink: UpdateFileAddSharedLinkRequestBodyArgSharedLinkField? = nil) {
        self.sharedLink = sharedLink
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sharedLink = try container.decodeIfPresent(UpdateFileAddSharedLinkRequestBodyArgSharedLinkField.self, forKey: .sharedLink)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
    }

}
