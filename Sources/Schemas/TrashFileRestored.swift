import Foundation

/// Represents a file restored from the trash.
public class TrashFileRestored: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case sequenceId = "sequence_id"
        case sha1
        case description
        case size
        case pathCollection = "path_collection"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case modifiedBy = "modified_by"
        case ownedBy = "owned_by"
        case itemStatus = "item_status"
        case etag
        case name
        case fileVersion = "file_version"
        case trashedAt = "trashed_at"
        case purgedAt = "purged_at"
        case contentCreatedAt = "content_created_at"
        case contentModifiedAt = "content_modified_at"
        case createdBy = "created_by"
        case sharedLink = "shared_link"
        case parent
    }

    /// The unique identifier that represent a file.
    /// 
    /// The ID for any file can be determined
    /// by visiting a file in the web application
    /// and copying the ID from the URL. For example,
    /// for the URL `https://*.app.box.com/files/123`
    /// the `file_id` is `123`.
    public let id: String
    /// `file`
    public let type: TrashFileRestoredTypeField
    public let sequenceId: String
    /// The SHA1 hash of the file. This can be used to compare the contents
    /// of a file on Box with a local file.
    public let sha1: String
    /// The optional description of this file
    public let description: String
    /// The file size in bytes. Be careful parsing this integer as it can
    /// get very large and cause an integer overflow.
    public let size: Int
    public let pathCollection: TrashFileRestoredPathCollectionField
    /// The date and time when the file was created on Box.
    public let createdAt: String
    /// The date and time when the file was last updated on Box.
    public let modifiedAt: String
    public let modifiedBy: UserMini
    public let ownedBy: UserMini
    /// Defines if this item has been deleted or not.
    /// 
    /// * `active` when the item has is not in the trash
    /// * `trashed` when the item has been moved to the trash but not deleted
    /// * `deleted` when the item has been permanently deleted.
    public let itemStatus: TrashFileRestoredItemStatusField
    /// The HTTP `etag` of this file. This can be used within some API
    /// endpoints in the `If-Match` and `If-None-Match` headers to only
    /// perform changes on the file if (no) changes have happened.
    public let etag: String?
    /// The name of the file
    public let name: String?
    public let fileVersion: FileVersionMini?
    /// The time at which this file was put in the
    /// trash - becomes `null` after restore.
    public let trashedAt: String?
    /// The time at which this file is expected to be purged
    /// from the trash  - becomes `null` after restore.
    public let purgedAt: String?
    /// The date and time at which this file was originally
    /// created, which might be before it was uploaded to Box.
    public let contentCreatedAt: String?
    /// The date and time at which this file was last updated,
    /// which might be before it was uploaded to Box.
    public let contentModifiedAt: String?
    public let createdBy: UserMini?
    /// The shared link for this file. This will
    /// be `null` if a file had been trashed, even though the original shared
    /// link does become active again.
    public let sharedLink: String?
    public let parent: FolderMini?

    /// Initializer for a TrashFileRestored.
    ///
    /// - Parameters:
    ///   - id: The unique identifier that represent a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///   - type: `file`
    ///   - sequenceId: String
    ///   - sha1: The SHA1 hash of the file. This can be used to compare the contents
    ///     of a file on Box with a local file.
    ///   - description: The optional description of this file
    ///   - size: The file size in bytes. Be careful parsing this integer as it can
    ///     get very large and cause an integer overflow.
    ///   - pathCollection: TrashFileRestoredPathCollectionField
    ///   - createdAt: The date and time when the file was created on Box.
    ///   - modifiedAt: The date and time when the file was last updated on Box.
    ///   - modifiedBy: UserMini
    ///   - ownedBy: UserMini
    ///   - itemStatus: Defines if this item has been deleted or not.
    ///     
    ///     * `active` when the item has is not in the trash
    ///     * `trashed` when the item has been moved to the trash but not deleted
    ///     * `deleted` when the item has been permanently deleted.
    ///   - etag: The HTTP `etag` of this file. This can be used within some API
    ///     endpoints in the `If-Match` and `If-None-Match` headers to only
    ///     perform changes on the file if (no) changes have happened.
    ///   - name: The name of the file
    ///   - fileVersion: FileVersionMini?
    ///   - trashedAt: The time at which this file was put in the
    ///     trash - becomes `null` after restore.
    ///   - purgedAt: The time at which this file is expected to be purged
    ///     from the trash  - becomes `null` after restore.
    ///   - contentCreatedAt: The date and time at which this file was originally
    ///     created, which might be before it was uploaded to Box.
    ///   - contentModifiedAt: The date and time at which this file was last updated,
    ///     which might be before it was uploaded to Box.
    ///   - createdBy: UserMini?
    ///   - sharedLink: The shared link for this file. This will
    ///     be `null` if a file had been trashed, even though the original shared
    ///     link does become active again.
    ///   - parent: FolderMini?
    public init(id: String, type: TrashFileRestoredTypeField, sequenceId: String, sha1: String, description: String, size: Int, pathCollection: TrashFileRestoredPathCollectionField, createdAt: String, modifiedAt: String, modifiedBy: UserMini, ownedBy: UserMini, itemStatus: TrashFileRestoredItemStatusField, etag: String? = nil, name: String? = nil, fileVersion: FileVersionMini? = nil, trashedAt: String? = nil, purgedAt: String? = nil, contentCreatedAt: String? = nil, contentModifiedAt: String? = nil, createdBy: UserMini? = nil, sharedLink: String? = nil, parent: FolderMini? = nil) {
        self.id = id
        self.type = type
        self.sequenceId = sequenceId
        self.sha1 = sha1
        self.description = description
        self.size = size
        self.pathCollection = pathCollection
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.modifiedBy = modifiedBy
        self.ownedBy = ownedBy
        self.itemStatus = itemStatus
        self.etag = etag
        self.name = name
        self.fileVersion = fileVersion
        self.trashedAt = trashedAt
        self.purgedAt = purgedAt
        self.contentCreatedAt = contentCreatedAt
        self.contentModifiedAt = contentModifiedAt
        self.createdBy = createdBy
        self.sharedLink = sharedLink
        self.parent = parent
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(TrashFileRestoredTypeField.self, forKey: .type)
        sequenceId = try container.decode(String.self, forKey: .sequenceId)
        sha1 = try container.decode(String.self, forKey: .sha1)
        description = try container.decode(String.self, forKey: .description)
        size = try container.decode(Int.self, forKey: .size)
        pathCollection = try container.decode(TrashFileRestoredPathCollectionField.self, forKey: .pathCollection)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        modifiedAt = try container.decode(String.self, forKey: .modifiedAt)
        modifiedBy = try container.decode(UserMini.self, forKey: .modifiedBy)
        ownedBy = try container.decode(UserMini.self, forKey: .ownedBy)
        itemStatus = try container.decode(TrashFileRestoredItemStatusField.self, forKey: .itemStatus)
        etag = try container.decodeIfPresent(String.self, forKey: .etag)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        fileVersion = try container.decodeIfPresent(FileVersionMini.self, forKey: .fileVersion)
        trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt)
        purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt)
        contentCreatedAt = try container.decodeIfPresent(String.self, forKey: .contentCreatedAt)
        contentModifiedAt = try container.decodeIfPresent(String.self, forKey: .contentModifiedAt)
        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
        sharedLink = try container.decodeIfPresent(String.self, forKey: .sharedLink)
        parent = try container.decodeIfPresent(FolderMini.self, forKey: .parent)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(sequenceId, forKey: .sequenceId)
        try container.encode(sha1, forKey: .sha1)
        try container.encode(description, forKey: .description)
        try container.encode(size, forKey: .size)
        try container.encode(pathCollection, forKey: .pathCollection)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(modifiedAt, forKey: .modifiedAt)
        try container.encode(modifiedBy, forKey: .modifiedBy)
        try container.encode(ownedBy, forKey: .ownedBy)
        try container.encode(itemStatus, forKey: .itemStatus)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(fileVersion, forKey: .fileVersion)
        try container.encodeIfPresent(trashedAt, forKey: .trashedAt)
        try container.encodeIfPresent(purgedAt, forKey: .purgedAt)
        try container.encodeIfPresent(contentCreatedAt, forKey: .contentCreatedAt)
        try container.encodeIfPresent(contentModifiedAt, forKey: .contentModifiedAt)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(parent, forKey: .parent)
    }
}
