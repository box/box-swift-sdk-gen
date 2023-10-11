import Foundation

public class UpdateFolderAddSharedLinkRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case sharedLink = "shared_link"
    }

    /// The settings for the shared link to create on the folder.
    /// 
    /// Use an empty object (`{}`) to use the default settings for shared
    /// links.
    public let sharedLink: UpdateFolderAddSharedLinkRequestBodyArgSharedLinkField?

    /// Initializer for a UpdateFolderAddSharedLinkRequestBodyArg.
    ///
    /// - Parameters:
    ///   - sharedLink: The settings for the shared link to create on the folder.
    ///     
    ///     Use an empty object (`{}`) to use the default settings for shared
    ///     links.
    public init(sharedLink: UpdateFolderAddSharedLinkRequestBodyArgSharedLinkField? = nil) {
        self.sharedLink = sharedLink
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sharedLink = try container.decodeIfPresent(UpdateFolderAddSharedLinkRequestBodyArgSharedLinkField.self, forKey: .sharedLink)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
    }
}
