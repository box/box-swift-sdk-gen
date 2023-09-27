import Foundation

public class SearchResultWithSharedLink: Codable {
    private enum CodingKeys: String, CodingKey {
        case accessibleViaSharedLink = "accessible_via_shared_link"
        case item
        case type
    }

    /// The optional shared link through which the user has access to this
    /// item. This value is only returned for items for which the user has
    /// recently accessed the file through a shared link. For all other
    /// items this value will return `null`.,
    public let accessibleViaSharedLink: String?
    public let item: FileOrFolderOrWebLink?
    /// The result type. The value is always `search_result`.,
    public let type: String?

    /// Initializer for a SearchResultWithSharedLink.
    ///
    /// - Parameters:
    ///   - accessibleViaSharedLink: The optional shared link through which the user has access to this
    ///     item. This value is only returned for items for which the user has
    ///     recently accessed the file through a shared link. For all other
    ///     items this value will return `null`.
    ///   - item: FileOrFolderOrWebLink?
    ///   - type: The result type. The value is always `search_result`.
    public init(accessibleViaSharedLink: String? = nil, item: FileOrFolderOrWebLink? = nil, type: String? = nil) {
        self.accessibleViaSharedLink = accessibleViaSharedLink
        self.item = item
        self.type = type
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessibleViaSharedLink = try container.decodeIfPresent(String.self, forKey: .accessibleViaSharedLink)
        item = try container.decodeIfPresent(FileOrFolderOrWebLink.self, forKey: .item)
        type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(accessibleViaSharedLink, forKey: .accessibleViaSharedLink)
        try container.encodeIfPresent(item, forKey: .item)
        try container.encodeIfPresent(type, forKey: .type)
    }
}
