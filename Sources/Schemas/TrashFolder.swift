import Foundation

/// Represents a trashed folder.
public class TrashFolder: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case size
        case pathCollection = "path_collection"
        case createdBy = "created_by"
        case modifiedBy = "modified_by"
        case ownedBy = "owned_by"
        case itemStatus = "item_status"
        case etag
        case type
        case sequenceId = "sequence_id"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case trashedAt = "trashed_at"
        case purgedAt = "purged_at"
        case contentCreatedAt = "content_created_at"
        case contentModifiedAt = "content_modified_at"
        case sharedLink = "shared_link"
        case folderUploadEmail = "folder_upload_email"
        case parent
    }

    /// The unique identifier that represent a folder.
    /// 
    /// The ID for any folder can be determined
    /// by visiting a folder in the web application
    /// and copying the ID from the URL. For example,
    /// for the URL `https://*.app.box.com/folders/123`
    /// the `folder_id` is `123`.
    public let id: String

    /// The name of the folder.
    public let name: String

    public let description: String

    /// The folder size in bytes.
    /// 
    /// Be careful parsing this integer as its
    /// value can get very large.
    public let size: Int64

    public let pathCollection: TrashFolderPathCollectionField

    public let createdBy: UserMini

    public let modifiedBy: UserMini

    public let ownedBy: UserMini

    /// Defines if this item has been deleted or not.
    /// 
    /// * `active` when the item has is not in the trash
    /// * `trashed` when the item has been moved to the trash but not deleted
    /// * `deleted` when the item has been permanently deleted.
    public let itemStatus: TrashFolderItemStatusField

    /// The HTTP `etag` of this folder. This can be used within some API
    /// endpoints in the `If-Match` and `If-None-Match` headers to only
    /// perform changes on the folder if (no) changes have happened.
    public let etag: String?

    /// `folder`
    public let type: TrashFolderTypeField

    public let sequenceId: String?

    /// The date and time when the folder was created. This value may
    /// be `null` for some folders such as the root folder or the trash
    /// folder.
    public let createdAt: String?

    /// The date and time when the folder was last updated. This value may
    /// be `null` for some folders such as the root folder or the trash
    /// folder.
    public let modifiedAt: String?

    /// The time at which this folder was put in the trash.
    public let trashedAt: String?

    /// The time at which this folder is expected to be purged
    /// from the trash.
    public let purgedAt: String?

    /// The date and time at which this folder was originally
    /// created.
    public let contentCreatedAt: String?

    /// The date and time at which this folder was last updated.
    public let contentModifiedAt: String?

    /// The shared link for this folder. This will
    /// be `null` if a folder has been trashed, since the link will no longer
    /// be active.
    public let sharedLink: String?

    /// The folder upload email for this folder. This will
    /// be `null` if a folder has been trashed, since the upload will no longer
    /// work.
    public let folderUploadEmail: String?

    public let parent: FolderMini?

    /// Initializer for a TrashFolder.
    ///
    /// - Parameters:
    ///   - id: The unique identifier that represent a folder.
    ///     
    ///     The ID for any folder can be determined
    ///     by visiting a folder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/folders/123`
    ///     the `folder_id` is `123`.
    ///   - name: The name of the folder.
    ///   - description: 
    ///   - size: The folder size in bytes.
    ///     
    ///     Be careful parsing this integer as its
    ///     value can get very large.
    ///   - pathCollection: 
    ///   - createdBy: 
    ///   - modifiedBy: 
    ///   - ownedBy: 
    ///   - itemStatus: Defines if this item has been deleted or not.
    ///     
    ///     * `active` when the item has is not in the trash
    ///     * `trashed` when the item has been moved to the trash but not deleted
    ///     * `deleted` when the item has been permanently deleted.
    ///   - etag: The HTTP `etag` of this folder. This can be used within some API
    ///     endpoints in the `If-Match` and `If-None-Match` headers to only
    ///     perform changes on the folder if (no) changes have happened.
    ///   - type: `folder`
    ///   - sequenceId: 
    ///   - createdAt: The date and time when the folder was created. This value may
    ///     be `null` for some folders such as the root folder or the trash
    ///     folder.
    ///   - modifiedAt: The date and time when the folder was last updated. This value may
    ///     be `null` for some folders such as the root folder or the trash
    ///     folder.
    ///   - trashedAt: The time at which this folder was put in the trash.
    ///   - purgedAt: The time at which this folder is expected to be purged
    ///     from the trash.
    ///   - contentCreatedAt: The date and time at which this folder was originally
    ///     created.
    ///   - contentModifiedAt: The date and time at which this folder was last updated.
    ///   - sharedLink: The shared link for this folder. This will
    ///     be `null` if a folder has been trashed, since the link will no longer
    ///     be active.
    ///   - folderUploadEmail: The folder upload email for this folder. This will
    ///     be `null` if a folder has been trashed, since the upload will no longer
    ///     work.
    ///   - parent: 
    public init(id: String, name: String, description: String, size: Int64, pathCollection: TrashFolderPathCollectionField, createdBy: UserMini, modifiedBy: UserMini, ownedBy: UserMini, itemStatus: TrashFolderItemStatusField, etag: String? = nil, type: TrashFolderTypeField = TrashFolderTypeField.folder, sequenceId: String? = nil, createdAt: String? = nil, modifiedAt: String? = nil, trashedAt: String? = nil, purgedAt: String? = nil, contentCreatedAt: String? = nil, contentModifiedAt: String? = nil, sharedLink: String? = nil, folderUploadEmail: String? = nil, parent: FolderMini? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.size = size
        self.pathCollection = pathCollection
        self.createdBy = createdBy
        self.modifiedBy = modifiedBy
        self.ownedBy = ownedBy
        self.itemStatus = itemStatus
        self.etag = etag
        self.type = type
        self.sequenceId = sequenceId
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.trashedAt = trashedAt
        self.purgedAt = purgedAt
        self.contentCreatedAt = contentCreatedAt
        self.contentModifiedAt = contentModifiedAt
        self.sharedLink = sharedLink
        self.folderUploadEmail = folderUploadEmail
        self.parent = parent
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        size = try container.decode(Int64.self, forKey: .size)
        pathCollection = try container.decode(TrashFolderPathCollectionField.self, forKey: .pathCollection)
        createdBy = try container.decode(UserMini.self, forKey: .createdBy)
        modifiedBy = try container.decode(UserMini.self, forKey: .modifiedBy)
        ownedBy = try container.decode(UserMini.self, forKey: .ownedBy)
        itemStatus = try container.decode(TrashFolderItemStatusField.self, forKey: .itemStatus)
        etag = try container.decodeIfPresent(String.self, forKey: .etag)
        type = try container.decode(TrashFolderTypeField.self, forKey: .type)
        sequenceId = try container.decodeIfPresent(String.self, forKey: .sequenceId)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
        trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt)
        purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt)
        contentCreatedAt = try container.decodeIfPresent(String.self, forKey: .contentCreatedAt)
        contentModifiedAt = try container.decodeIfPresent(String.self, forKey: .contentModifiedAt)
        sharedLink = try container.decodeIfPresent(String.self, forKey: .sharedLink)
        folderUploadEmail = try container.decodeIfPresent(String.self, forKey: .folderUploadEmail)
        parent = try container.decodeIfPresent(FolderMini.self, forKey: .parent)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(size, forKey: .size)
        try container.encode(pathCollection, forKey: .pathCollection)
        try container.encode(createdBy, forKey: .createdBy)
        try container.encode(modifiedBy, forKey: .modifiedBy)
        try container.encode(ownedBy, forKey: .ownedBy)
        try container.encode(itemStatus, forKey: .itemStatus)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(sequenceId, forKey: .sequenceId)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
        try container.encodeIfPresent(trashedAt, forKey: .trashedAt)
        try container.encodeIfPresent(purgedAt, forKey: .purgedAt)
        try container.encodeIfPresent(contentCreatedAt, forKey: .contentCreatedAt)
        try container.encodeIfPresent(contentModifiedAt, forKey: .contentModifiedAt)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(folderUploadEmail, forKey: .folderUploadEmail)
        try container.encodeIfPresent(parent, forKey: .parent)
    }

}
