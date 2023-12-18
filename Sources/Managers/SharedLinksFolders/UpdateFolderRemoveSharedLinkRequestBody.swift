import Foundation

public class UpdateFolderRemoveSharedLinkRequestBody: Codable {
    private enum CodingKeys: String, CodingKey {
        case sharedLink = "shared_link"
    }

    /// By setting this value to `null`, the shared link
    /// is removed from the folder.
    public let sharedLink: UpdateFolderRemoveSharedLinkRequestBodySharedLinkField?

    /// Initializer for a UpdateFolderRemoveSharedLinkRequestBody.
    ///
    /// - Parameters:
    ///   - sharedLink: By setting this value to `null`, the shared link
    ///     is removed from the folder.
    public init(sharedLink: UpdateFolderRemoveSharedLinkRequestBodySharedLinkField? = nil) {
        self.sharedLink = sharedLink
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sharedLink = try container.decodeIfPresent(UpdateFolderRemoveSharedLinkRequestBodySharedLinkField.self, forKey: .sharedLink)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
    }

}
