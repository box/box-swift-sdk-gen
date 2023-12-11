import Foundation

public class UpdateWebLinkUpdateSharedLinkRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case sharedLink = "shared_link"
    }

    /// The settings for the shared link to update.
    public let sharedLink: UpdateWebLinkUpdateSharedLinkRequestBodyArgSharedLinkField?

    /// Initializer for a UpdateWebLinkUpdateSharedLinkRequestBodyArg.
    ///
    /// - Parameters:
    ///   - sharedLink: The settings for the shared link to update.
    public init(sharedLink: UpdateWebLinkUpdateSharedLinkRequestBodyArgSharedLinkField? = nil) {
        self.sharedLink = sharedLink
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sharedLink = try container.decodeIfPresent(UpdateWebLinkUpdateSharedLinkRequestBodyArgSharedLinkField.self, forKey: .sharedLink)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
    }

}
