import Foundation

public class UpdateWebLinkByIdRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case url
        case parent
        case name
        case description
        case sharedLink = "shared_link"
    }

    /// The new URL that the web link links to. Must start with
    /// `"http://"` or `"https://"`.
    public let url: String?

    public let parent: UpdateWebLinkByIdRequestBodyArgParentField?

    /// A new name for the web link. Defaults to the URL if not set.
    public let name: String?

    /// A new description of the web link.
    public let description: String?

    /// The settings for the shared link to update.
    public let sharedLink: UpdateWebLinkByIdRequestBodyArgSharedLinkField?

    /// Initializer for a UpdateWebLinkByIdRequestBodyArg.
    ///
    /// - Parameters:
    ///   - url: The new URL that the web link links to. Must start with
    ///     `"http://"` or `"https://"`.
    ///   - parent: 
    ///   - name: A new name for the web link. Defaults to the URL if not set.
    ///   - description: A new description of the web link.
    ///   - sharedLink: The settings for the shared link to update.
    public init(url: String? = nil, parent: UpdateWebLinkByIdRequestBodyArgParentField? = nil, name: String? = nil, description: String? = nil, sharedLink: UpdateWebLinkByIdRequestBodyArgSharedLinkField? = nil) {
        self.url = url
        self.parent = parent
        self.name = name
        self.description = description
        self.sharedLink = sharedLink
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        parent = try container.decodeIfPresent(UpdateWebLinkByIdRequestBodyArgParentField.self, forKey: .parent)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        sharedLink = try container.decodeIfPresent(UpdateWebLinkByIdRequestBodyArgSharedLinkField.self, forKey: .sharedLink)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
    }

}
