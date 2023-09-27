import Foundation

public class TrashFile: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case etag
        case type
        case sequenceId = "sequence_id"
        case name
        case sha1
        case fileVersion = "file_version"
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

    /// The unique identifier that represent a file.
    /// 
    /// The ID for any file can be determined
    /// by visiting a file in the web application
    /// and copying the ID from the URL. For example,
    /// for the URL `https://*.app.box.com/files/123`
    /// the `file_id` is `123`.,
    public let id: String
    /// The HTTP `etag` of this file. This can be used within some API
    /// endpoints in the `If-Match` and `If-None-Match` headers to only
    /// perform changes on the file if (no) changes have happened.,
    public let etag: String?
    /// `file`,
    public let type: TrashFileTypeField
    public let sequenceId: String
    /// The name of the file,
    public let name: String?
    /// The SHA1 hash of the file. This can be used to compare the contents
    /// of a file on Box with a local file.,
    public let sha1: String
    public let fileVersion: FileVersionMini?
    /// The optional description of this file,
    public let description: String
    /// The file size in bytes. Be careful parsing this integer as it can
    /// get very large and cause an integer overflow.,
    public let size: Int
    public let pathCollection: TrashFilePathCollectionField
    /// The date and time when the file was created on Box.,
    public let createdAt: String
    /// The date and time when the file was last updated on Box.,
    public let modifiedAt: String
    /// The time at which this file was put in the trash.,
    public let trashedAt: String?
    /// The time at which this file is expected to be purged
    /// from the trash.,
    public let purgedAt: String?
    /// The date and time at which this file was originally
    /// created, which might be before it was uploaded to Box.,
    public let contentCreatedAt: String?
    /// The date and time at which this file was last updated,
    /// which might be before it was uploaded to Box.,
    public let contentModifiedAt: String?
    public let createdBy: UserMini?
    public let modifiedBy: UserMini
    public let ownedBy: UserMini
    /// The shared link for this file. This will
    /// be `null` if a file has been trashed, since the link will no longer
    /// be active.,
    public let sharedLink: String?
    public let parent: FolderMini?
    /// Defines if this item has been deleted or not.
    /// 
    /// * `active` when the item has is not in the trash
    /// * `trashed` when the item has been moved to the trash but not deleted
    /// * `deleted` when the item has been permanently deleted.,
    public let itemStatus: TrashFileItemStatusField

    /// Initializer for a TrashFile.
    ///
    /// - Parameters:
    ///   - id: The unique identifier that represent a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///   - etag: The HTTP `etag` of this file. This can be used within some API
    ///     endpoints in the `If-Match` and `If-None-Match` headers to only
    ///     perform changes on the file if (no) changes have happened.
    ///   - type: `file`
    ///   - sequenceId: String
    ///   - name: The name of the file
    ///   - sha1: The SHA1 hash of the file. This can be used to compare the contents
    ///     of a file on Box with a local file.
    ///   - fileVersion: FileVersionMini?
    ///   - description: The optional description of this file
    ///   - size: The file size in bytes. Be careful parsing this integer as it can
    ///     get very large and cause an integer overflow.
    ///   - pathCollection: TrashFilePathCollectionField
    ///   - createdAt: The date and time when the file was created on Box.
    ///   - modifiedAt: The date and time when the file was last updated on Box.
    ///   - trashedAt: The time at which this file was put in the trash.
    ///   - purgedAt: The time at which this file is expected to be purged
    ///     from the trash.
    ///   - contentCreatedAt: The date and time at which this file was originally
    ///     created, which might be before it was uploaded to Box.
    ///   - contentModifiedAt: The date and time at which this file was last updated,
    ///     which might be before it was uploaded to Box.
    ///   - createdBy: UserMini?
    ///   - modifiedBy: UserMini
    ///   - ownedBy: UserMini
    ///   - sharedLink: The shared link for this file. This will
    ///     be `null` if a file has been trashed, since the link will no longer
    ///     be active.
    ///   - parent: FolderMini?
    ///   - itemStatus: Defines if this item has been deleted or not.
    ///     
    ///     * `active` when the item has is not in the trash
    ///     * `trashed` when the item has been moved to the trash but not deleted
    ///     * `deleted` when the item has been permanently deleted.
    public init(id: String, etag: String? = nil, type: TrashFileTypeField, sequenceId: String, name: String? = nil, sha1: String, fileVersion: FileVersionMini? = nil, description: String, size: Int, pathCollection: TrashFilePathCollectionField, createdAt: String, modifiedAt: String, trashedAt: String? = nil, purgedAt: String? = nil, contentCreatedAt: String? = nil, contentModifiedAt: String? = nil, createdBy: UserMini? = nil, modifiedBy: UserMini, ownedBy: UserMini, sharedLink: String? = nil, parent: FolderMini? = nil, itemStatus: TrashFileItemStatusField) {
        self.id = id
        self.etag = etag
        self.type = type
        self.sequenceId = sequenceId
        self.name = name
        self.sha1 = sha1
        self.fileVersion = fileVersion
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
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        etag = try container.decodeIfPresent(String.self, forKey: .etag)
        type = try container.decode(TrashFileTypeField.self, forKey: .type)
        sequenceId = try container.decode(String.self, forKey: .sequenceId)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        sha1 = try container.decode(String.self, forKey: .sha1)
        fileVersion = try container.decodeIfPresent(FileVersionMini.self, forKey: .fileVersion)
        description = try container.decode(String.self, forKey: .description)
        size = try container.decode(Int.self, forKey: .size)
        pathCollection = try container.decode(TrashFilePathCollectionField.self, forKey: .pathCollection)
        createdAt = try container.decode(String.self, forKey: .createdAt)
        modifiedAt = try container.decode(String.self, forKey: .modifiedAt)
        trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt)
        purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt)
        contentCreatedAt = try container.decodeIfPresent(String.self, forKey: .contentCreatedAt)
        contentModifiedAt = try container.decodeIfPresent(String.self, forKey: .contentModifiedAt)
        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
        modifiedBy = try container.decode(UserMini.self, forKey: .modifiedBy)
        ownedBy = try container.decode(UserMini.self, forKey: .ownedBy)
        sharedLink = try container.decodeIfPresent(String.self, forKey: .sharedLink)
        parent = try container.decodeIfPresent(FolderMini.self, forKey: .parent)
        itemStatus = try container.decode(TrashFileItemStatusField.self, forKey: .itemStatus)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encode(type, forKey: .type)
        try container.encode(sequenceId, forKey: .sequenceId)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encode(sha1, forKey: .sha1)
        try container.encodeIfPresent(fileVersion, forKey: .fileVersion)
        try container.encode(description, forKey: .description)
        try container.encode(size, forKey: .size)
        try container.encode(pathCollection, forKey: .pathCollection)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(modifiedAt, forKey: .modifiedAt)
        try container.encodeIfPresent(trashedAt, forKey: .trashedAt)
        try container.encodeIfPresent(purgedAt, forKey: .purgedAt)
        try container.encodeIfPresent(contentCreatedAt, forKey: .contentCreatedAt)
        try container.encodeIfPresent(contentModifiedAt, forKey: .contentModifiedAt)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encode(modifiedBy, forKey: .modifiedBy)
        try container.encode(ownedBy, forKey: .ownedBy)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encode(itemStatus, forKey: .itemStatus)
    }
}
