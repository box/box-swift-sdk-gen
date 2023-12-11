import Foundation

/// A standard representation of a file, as returned from any
/// file API endpoints by default
public class File: FileMini {
    private enum CodingKeys: String, CodingKey {
        case description
        case size
        case pathCollection = "path_collection"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case trashedAt = "trashed_at"
        case purgedAt = "purged_at"
        case contentCreatedAt = "content_created_at"
        case contentModifiedAt = "content_modified_at"
        case createdBy = "created_by"
        case modifiedBy = "modified_by"
        case ownedBy = "owned_by"
        case sharedLink = "shared_link"
        case parent
        case itemStatus = "item_status"
    }

    /// The optional description of this file
    public let description: String?

    /// The file size in bytes. Be careful parsing this integer as it can
    /// get very large and cause an integer overflow.
    public let size: Int64?

    public let pathCollection: FilePathCollectionField?

    /// The date and time when the file was created on Box.
    public let createdAt: String?

    /// The date and time when the file was last updated on Box.
    public let modifiedAt: String?

    /// The time at which this file was put in the trash.
    public let trashedAt: String?

    /// The time at which this file is expected to be purged
    /// from the trash.
    public let purgedAt: String?

    /// The date and time at which this file was originally
    /// created, which might be before it was uploaded to Box.
    public let contentCreatedAt: String?

    /// The date and time at which this file was last updated,
    /// which might be before it was uploaded to Box.
    public let contentModifiedAt: String?

    public let createdBy: UserMini?

    public let modifiedBy: UserMini?

    public let ownedBy: UserMini?

    public let sharedLink: FileSharedLinkField?

    public let parent: FolderMini?

    /// Defines if this item has been deleted or not.
    /// 
    /// * `active` when the item has is not in the trash
    /// * `trashed` when the item has been moved to the trash but not deleted
    /// * `deleted` when the item has been permanently deleted.
    public let itemStatus: FileItemStatusField?

    /// Initializer for a File.
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
    ///   - etag: The HTTP `etag` of this file. This can be used within some API
    ///     endpoints in the `If-Match` and `If-None-Match` headers to only
    ///     perform changes on the file if (no) changes have happened.
    ///   - sequenceId: 
    ///   - name: The name of the file
    ///   - sha1: The SHA1 hash of the file. This can be used to compare the contents
    ///     of a file on Box with a local file.
    ///   - fileVersion: 
    ///   - description: The optional description of this file
    ///   - size: The file size in bytes. Be careful parsing this integer as it can
    ///     get very large and cause an integer overflow.
    ///   - pathCollection: 
    ///   - createdAt: The date and time when the file was created on Box.
    ///   - modifiedAt: The date and time when the file was last updated on Box.
    ///   - trashedAt: The time at which this file was put in the trash.
    ///   - purgedAt: The time at which this file is expected to be purged
    ///     from the trash.
    ///   - contentCreatedAt: The date and time at which this file was originally
    ///     created, which might be before it was uploaded to Box.
    ///   - contentModifiedAt: The date and time at which this file was last updated,
    ///     which might be before it was uploaded to Box.
    ///   - createdBy: 
    ///   - modifiedBy: 
    ///   - ownedBy: 
    ///   - sharedLink: 
    ///   - parent: 
    ///   - itemStatus: Defines if this item has been deleted or not.
    ///     
    ///     * `active` when the item has is not in the trash
    ///     * `trashed` when the item has been moved to the trash but not deleted
    ///     * `deleted` when the item has been permanently deleted.
    public init(id: String, type: FileBaseTypeField, etag: String? = nil, sequenceId: String? = nil, name: String? = nil, sha1: String? = nil, fileVersion: FileVersionMini? = nil, description: String? = nil, size: Int64? = nil, pathCollection: FilePathCollectionField? = nil, createdAt: String? = nil, modifiedAt: String? = nil, trashedAt: String? = nil, purgedAt: String? = nil, contentCreatedAt: String? = nil, contentModifiedAt: String? = nil, createdBy: UserMini? = nil, modifiedBy: UserMini? = nil, ownedBy: UserMini? = nil, sharedLink: FileSharedLinkField? = nil, parent: FolderMini? = nil, itemStatus: FileItemStatusField? = nil) {
        self.description = description
        self.size = size
        self.pathCollection = pathCollection
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.trashedAt = trashedAt
        self.purgedAt = purgedAt
        self.contentCreatedAt = contentCreatedAt
        self.contentModifiedAt = contentModifiedAt
        self.createdBy = createdBy
        self.modifiedBy = modifiedBy
        self.ownedBy = ownedBy
        self.sharedLink = sharedLink
        self.parent = parent
        self.itemStatus = itemStatus

        super.init(id: id, type: type, etag: etag, sequenceId: sequenceId, name: name, sha1: sha1, fileVersion: fileVersion)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        size = try container.decodeIfPresent(Int64.self, forKey: .size)
        pathCollection = try container.decodeIfPresent(FilePathCollectionField.self, forKey: .pathCollection)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
        trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt)
        purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt)
        contentCreatedAt = try container.decodeIfPresent(String.self, forKey: .contentCreatedAt)
        contentModifiedAt = try container.decodeIfPresent(String.self, forKey: .contentModifiedAt)
        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
        modifiedBy = try container.decodeIfPresent(UserMini.self, forKey: .modifiedBy)
        ownedBy = try container.decodeIfPresent(UserMini.self, forKey: .ownedBy)
        sharedLink = try container.decodeIfPresent(FileSharedLinkField.self, forKey: .sharedLink)
        parent = try container.decodeIfPresent(FolderMini.self, forKey: .parent)
        itemStatus = try container.decodeIfPresent(FileItemStatusField.self, forKey: .itemStatus)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(pathCollection, forKey: .pathCollection)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
        try container.encodeIfPresent(trashedAt, forKey: .trashedAt)
        try container.encodeIfPresent(purgedAt, forKey: .purgedAt)
        try container.encodeIfPresent(contentCreatedAt, forKey: .contentCreatedAt)
        try container.encodeIfPresent(contentModifiedAt, forKey: .contentModifiedAt)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(modifiedBy, forKey: .modifiedBy)
        try container.encodeIfPresent(ownedBy, forKey: .ownedBy)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(itemStatus, forKey: .itemStatus)
        try super.encode(to: encoder)
    }

}
