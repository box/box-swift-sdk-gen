import Foundation

/// Represents a trashed file.
public class TrashFile: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
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
        case type
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

    public let sequenceId: String

    /// The SHA1 hash of the file. This can be used to compare the contents
    /// of a file on Box with a local file.
    public let sha1: String

    /// The optional description of this file
    public let description: String

    /// The file size in bytes. Be careful parsing this integer as it can
    /// get very large and cause an integer overflow.
    public let size: Int64

    public let pathCollection: TrashFilePathCollectionField

    /// The date and time when the file was created on Box.
    public let createdAt: Date

    /// The date and time when the file was last updated on Box.
    public let modifiedAt: Date

    public let modifiedBy: UserMini

    public let ownedBy: UserMini

    /// Defines if this item has been deleted or not.
    /// 
    /// * `active` when the item has is not in the trash
    /// * `trashed` when the item has been moved to the trash but not deleted
    /// * `deleted` when the item has been permanently deleted.
    public let itemStatus: TrashFileItemStatusField

    /// The HTTP `etag` of this file. This can be used within some API
    /// endpoints in the `If-Match` and `If-None-Match` headers to only
    /// perform changes on the file if (no) changes have happened.
    public let etag: String?

    /// `file`
    public let type: TrashFileTypeField

    /// The name of the file
    public let name: String?

    public let fileVersion: FileVersionMini?

    /// The time at which this file was put in the trash.
    public let trashedAt: Date?

    /// The time at which this file is expected to be purged
    /// from the trash.
    public let purgedAt: Date?

    /// The date and time at which this file was originally
    /// created, which might be before it was uploaded to Box.
    public let contentCreatedAt: Date?

    /// The date and time at which this file was last updated,
    /// which might be before it was uploaded to Box.
    public let contentModifiedAt: Date?

    public let createdBy: UserMini?

    /// The shared link for this file. This will
    /// be `null` if a file has been trashed, since the link will no longer
    /// be active.
    public let sharedLink: String?

    public let parent: FolderMini?

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
    ///   - sequenceId: 
    ///   - sha1: The SHA1 hash of the file. This can be used to compare the contents
    ///     of a file on Box with a local file.
    ///   - description: The optional description of this file
    ///   - size: The file size in bytes. Be careful parsing this integer as it can
    ///     get very large and cause an integer overflow.
    ///   - pathCollection: 
    ///   - createdAt: The date and time when the file was created on Box.
    ///   - modifiedAt: The date and time when the file was last updated on Box.
    ///   - modifiedBy: 
    ///   - ownedBy: 
    ///   - itemStatus: Defines if this item has been deleted or not.
    ///     
    ///     * `active` when the item has is not in the trash
    ///     * `trashed` when the item has been moved to the trash but not deleted
    ///     * `deleted` when the item has been permanently deleted.
    ///   - etag: The HTTP `etag` of this file. This can be used within some API
    ///     endpoints in the `If-Match` and `If-None-Match` headers to only
    ///     perform changes on the file if (no) changes have happened.
    ///   - type: `file`
    ///   - name: The name of the file
    ///   - fileVersion: 
    ///   - trashedAt: The time at which this file was put in the trash.
    ///   - purgedAt: The time at which this file is expected to be purged
    ///     from the trash.
    ///   - contentCreatedAt: The date and time at which this file was originally
    ///     created, which might be before it was uploaded to Box.
    ///   - contentModifiedAt: The date and time at which this file was last updated,
    ///     which might be before it was uploaded to Box.
    ///   - createdBy: 
    ///   - sharedLink: The shared link for this file. This will
    ///     be `null` if a file has been trashed, since the link will no longer
    ///     be active.
    ///   - parent: 
    public init(id: String, sequenceId: String, sha1: String, description: String, size: Int64, pathCollection: TrashFilePathCollectionField, createdAt: Date, modifiedAt: Date, modifiedBy: UserMini, ownedBy: UserMini, itemStatus: TrashFileItemStatusField, etag: String? = nil, type: TrashFileTypeField = TrashFileTypeField.file, name: String? = nil, fileVersion: FileVersionMini? = nil, trashedAt: Date? = nil, purgedAt: Date? = nil, contentCreatedAt: Date? = nil, contentModifiedAt: Date? = nil, createdBy: UserMini? = nil, sharedLink: String? = nil, parent: FolderMini? = nil) {
        self.id = id
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
        self.type = type
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
        sequenceId = try container.decode(String.self, forKey: .sequenceId)
        sha1 = try container.decode(String.self, forKey: .sha1)
        description = try container.decode(String.self, forKey: .description)
        size = try container.decode(Int64.self, forKey: .size)
        pathCollection = try container.decode(TrashFilePathCollectionField.self, forKey: .pathCollection)
        createdAt = try Utils.Dates.dateTimeFromString(dateTime: try container.decode(String.self, forKey: .createdAt))
        modifiedAt = try Utils.Dates.dateTimeFromString(dateTime: try container.decode(String.self, forKey: .modifiedAt))
        modifiedBy = try container.decode(UserMini.self, forKey: .modifiedBy)
        ownedBy = try container.decode(UserMini.self, forKey: .ownedBy)
        itemStatus = try container.decode(TrashFileItemStatusField.self, forKey: .itemStatus)
        etag = try container.decodeIfPresent(String.self, forKey: .etag)
        type = try container.decode(TrashFileTypeField.self, forKey: .type)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        fileVersion = try container.decodeIfPresent(FileVersionMini.self, forKey: .fileVersion)
        if let _trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt) {
            trashedAt = try Utils.Dates.dateTimeFromString(dateTime: _trashedAt)
        } else {
            trashedAt = nil
        }

        if let _purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt) {
            purgedAt = try Utils.Dates.dateTimeFromString(dateTime: _purgedAt)
        } else {
            purgedAt = nil
        }

        if let _contentCreatedAt = try container.decodeIfPresent(String.self, forKey: .contentCreatedAt) {
            contentCreatedAt = try Utils.Dates.dateTimeFromString(dateTime: _contentCreatedAt)
        } else {
            contentCreatedAt = nil
        }

        if let _contentModifiedAt = try container.decodeIfPresent(String.self, forKey: .contentModifiedAt) {
            contentModifiedAt = try Utils.Dates.dateTimeFromString(dateTime: _contentModifiedAt)
        } else {
            contentModifiedAt = nil
        }

        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
        sharedLink = try container.decodeIfPresent(String.self, forKey: .sharedLink)
        parent = try container.decodeIfPresent(FolderMini.self, forKey: .parent)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(sequenceId, forKey: .sequenceId)
        try container.encode(sha1, forKey: .sha1)
        try container.encode(description, forKey: .description)
        try container.encode(size, forKey: .size)
        try container.encode(pathCollection, forKey: .pathCollection)
        try container.encode(Utils.Dates.dateTimeToString(dateTime: createdAt), forKey: .createdAt)
        try container.encode(Utils.Dates.dateTimeToString(dateTime: modifiedAt), forKey: .modifiedAt)
        try container.encode(modifiedBy, forKey: .modifiedBy)
        try container.encode(ownedBy, forKey: .ownedBy)
        try container.encode(itemStatus, forKey: .itemStatus)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(fileVersion, forKey: .fileVersion)
        if let trashedAt = trashedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: trashedAt), forKey: .trashedAt)
        }

        if let purgedAt = purgedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: purgedAt), forKey: .purgedAt)
        }

        if let contentCreatedAt = contentCreatedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: contentCreatedAt), forKey: .contentCreatedAt)
        }

        if let contentModifiedAt = contentModifiedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: contentModifiedAt), forKey: .contentModifiedAt)
        }

        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(parent, forKey: .parent)
    }

}
