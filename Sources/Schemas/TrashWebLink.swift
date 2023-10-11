import Foundation

/// Represents a trashed web link.
public class TrashWebLink: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
        case sequenceId = "sequence_id"
        case etag
        case name
        case url
        case parent
        case description
        case pathCollection = "path_collection"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case trashedAt = "trashed_at"
        case purgedAt = "purged_at"
        case createdBy = "created_by"
        case modifiedBy = "modified_by"
        case ownedBy = "owned_by"
        case sharedLink = "shared_link"
        case itemStatus = "item_status"
    }

    /// `web_link`
    public let type: TrashWebLinkTypeField?
    /// The unique identifier for this web link
    public let id: String?
    public let sequenceId: String?
    /// The entity tag of this web link. Used with `If-Match`
    /// headers.
    public let etag: String?
    /// The name of the web link
    public let name: String?
    /// The URL this web link points to
    public let url: String?
    public let parent: FolderMini?
    /// The description accompanying the web link. This is
    /// visible within the Box web application.
    public let description: String?
    public let pathCollection: TrashWebLinkPathCollectionField?
    /// When this file was created on Box’s servers.
    public let createdAt: String?
    /// When this file was last updated on the Box
    /// servers.
    public let modifiedAt: String?
    /// When this file was last moved to the trash.
    public let trashedAt: String?
    /// When this file will be permanently deleted.
    public let purgedAt: String?
    public let createdBy: UserMini?
    public let modifiedBy: UserMini?
    public let ownedBy: UserMini?
    /// The shared link for this bookmark. This will
    /// be `null` if a bookmark has been trashed, since the link will no longer
    /// be active.
    public let sharedLink: String?
    /// Whether this item is deleted or not. Values include `active`,
    /// `trashed` if the file has been moved to the trash, and `deleted` if
    /// the file has been permanently deleted
    public let itemStatus: TrashWebLinkItemStatusField?

    /// Initializer for a TrashWebLink.
    ///
    /// - Parameters:
    ///   - type: `web_link`
    ///   - id: The unique identifier for this web link
    ///   - sequenceId: String?
    ///   - etag: The entity tag of this web link. Used with `If-Match`
    ///     headers.
    ///   - name: The name of the web link
    ///   - url: The URL this web link points to
    ///   - parent: FolderMini?
    ///   - description: The description accompanying the web link. This is
    ///     visible within the Box web application.
    ///   - pathCollection: TrashWebLinkPathCollectionField?
    ///   - createdAt: When this file was created on Box’s servers.
    ///   - modifiedAt: When this file was last updated on the Box
    ///     servers.
    ///   - trashedAt: When this file was last moved to the trash.
    ///   - purgedAt: When this file will be permanently deleted.
    ///   - createdBy: UserMini?
    ///   - modifiedBy: UserMini?
    ///   - ownedBy: UserMini?
    ///   - sharedLink: The shared link for this bookmark. This will
    ///     be `null` if a bookmark has been trashed, since the link will no longer
    ///     be active.
    ///   - itemStatus: Whether this item is deleted or not. Values include `active`,
    ///     `trashed` if the file has been moved to the trash, and `deleted` if
    ///     the file has been permanently deleted
    public init(type: TrashWebLinkTypeField? = nil, id: String? = nil, sequenceId: String? = nil, etag: String? = nil, name: String? = nil, url: String? = nil, parent: FolderMini? = nil, description: String? = nil, pathCollection: TrashWebLinkPathCollectionField? = nil, createdAt: String? = nil, modifiedAt: String? = nil, trashedAt: String? = nil, purgedAt: String? = nil, createdBy: UserMini? = nil, modifiedBy: UserMini? = nil, ownedBy: UserMini? = nil, sharedLink: String? = nil, itemStatus: TrashWebLinkItemStatusField? = nil) {
        self.type = type
        self.id = id
        self.sequenceId = sequenceId
        self.etag = etag
        self.name = name
        self.url = url
        self.parent = parent
        self.description = description
        self.pathCollection = pathCollection
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.trashedAt = trashedAt
        self.purgedAt = purgedAt
        self.createdBy = createdBy
        self.modifiedBy = modifiedBy
        self.ownedBy = ownedBy
        self.sharedLink = sharedLink
        self.itemStatus = itemStatus
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(TrashWebLinkTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        sequenceId = try container.decodeIfPresent(String.self, forKey: .sequenceId)
        etag = try container.decodeIfPresent(String.self, forKey: .etag)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        parent = try container.decodeIfPresent(FolderMini.self, forKey: .parent)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        pathCollection = try container.decodeIfPresent(TrashWebLinkPathCollectionField.self, forKey: .pathCollection)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
        trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt)
        purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt)
        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
        modifiedBy = try container.decodeIfPresent(UserMini.self, forKey: .modifiedBy)
        ownedBy = try container.decodeIfPresent(UserMini.self, forKey: .ownedBy)
        sharedLink = try container.decodeIfPresent(String.self, forKey: .sharedLink)
        itemStatus = try container.decodeIfPresent(TrashWebLinkItemStatusField.self, forKey: .itemStatus)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(sequenceId, forKey: .sequenceId)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(pathCollection, forKey: .pathCollection)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
        try container.encodeIfPresent(trashedAt, forKey: .trashedAt)
        try container.encodeIfPresent(purgedAt, forKey: .purgedAt)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(modifiedBy, forKey: .modifiedBy)
        try container.encodeIfPresent(ownedBy, forKey: .ownedBy)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(itemStatus, forKey: .itemStatus)
    }
}
