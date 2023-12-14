import Foundation

public class UpdateFileRemoveSharedLinkRequestBody: Codable {
    private enum CodingKeys: String, CodingKey {
        case sharedLink = "shared_link"
    }

    /// By setting this value to `null`, the shared link
    /// is removed from the file.
    public let sharedLink: UpdateFileRemoveSharedLinkRequestBodySharedLinkField?

    /// Initializer for a UpdateFileRemoveSharedLinkRequestBody.
    ///
    /// - Parameters:
    ///   - sharedLink: By setting this value to `null`, the shared link
    ///     is removed from the file.
    public init(sharedLink: UpdateFileRemoveSharedLinkRequestBodySharedLinkField? = nil) {
        self.sharedLink = sharedLink
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sharedLink = try container.decodeIfPresent(UpdateFileRemoveSharedLinkRequestBodySharedLinkField.self, forKey: .sharedLink)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
    }

}
