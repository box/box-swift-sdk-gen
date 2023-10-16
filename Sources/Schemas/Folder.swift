import Foundation

/// A standard representation of a folder, as returned from any
/// folder API endpoints by default
public class Folder: FolderMini {
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case description
        case size
        case pathCollection = "path_collection"
        case createdBy = "created_by"
        case modifiedBy = "modified_by"
        case trashedAt = "trashed_at"
        case purgedAt = "purged_at"
        case contentCreatedAt = "content_created_at"
        case contentModifiedAt = "content_modified_at"
        case ownedBy = "owned_by"
        case sharedLink = "shared_link"
        case folderUploadEmail = "folder_upload_email"
        case parent
        case itemStatus = "item_status"
        case itemCollection = "item_collection"
    }

    /// The date and time when the folder was created. This value may
    /// be `null` for some folders such as the root folder or the trash
    /// folder.
    public let createdAt: String?
    /// The date and time when the folder was last updated. This value may
    /// be `null` for some folders such as the root folder or the trash
    /// folder.
    public let modifiedAt: String?
    public let description: String?
    /// The folder size in bytes.
    /// 
    /// Be careful parsing this integer as its
    /// value can get very large.
    public let size: Int64?
    public let pathCollection: FolderPathCollectionField?
    public let createdBy: UserMini?
    public let modifiedBy: UserMini?
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
    public let ownedBy: UserMini?
    public let sharedLink: FolderSharedLinkField?
    public let folderUploadEmail: FolderFolderUploadEmailField?
    public let parent: FolderMini?
    /// Defines if this item has been deleted or not.
    /// 
    /// * `active` when the item has is not in the trash
    /// * `trashed` when the item has been moved to the trash but not deleted
    /// * `deleted` when the item has been permanently deleted.
    public let itemStatus: FolderItemStatusField?
    public let itemCollection: Items?

    /// Initializer for a Folder.
    ///
    /// - Parameters:
    ///   - id: The unique identifier that represent a folder.
    ///     
    ///     The ID for any folder can be determined
    ///     by visiting a folder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/folders/123`
    ///     the `folder_id` is `123`.
    ///   - type: `folder`
    ///   - etag: The HTTP `etag` of this folder. This can be used within some API
    ///     endpoints in the `If-Match` and `If-None-Match` headers to only
    ///     perform changes on the folder if (no) changes have happened.
    ///   - sequenceId: String?
    ///   - name: The name of the folder.
    ///   - createdAt: The date and time when the folder was created. This value may
    ///     be `null` for some folders such as the root folder or the trash
    ///     folder.
    ///   - modifiedAt: The date and time when the folder was last updated. This value may
    ///     be `null` for some folders such as the root folder or the trash
    ///     folder.
    ///   - description: String?
    ///   - size: The folder size in bytes.
    ///     
    ///     Be careful parsing this integer as its
    ///     value can get very large.
    ///   - pathCollection: FolderPathCollectionField?
    ///   - createdBy: UserMini?
    ///   - modifiedBy: UserMini?
    ///   - trashedAt: The time at which this folder was put in the trash.
    ///   - purgedAt: The time at which this folder is expected to be purged
    ///     from the trash.
    ///   - contentCreatedAt: The date and time at which this folder was originally
    ///     created.
    ///   - contentModifiedAt: The date and time at which this folder was last updated.
    ///   - ownedBy: UserMini?
    ///   - sharedLink: FolderSharedLinkField?
    ///   - folderUploadEmail: FolderFolderUploadEmailField?
    ///   - parent: FolderMini?
    ///   - itemStatus: Defines if this item has been deleted or not.
    ///     
    ///     * `active` when the item has is not in the trash
    ///     * `trashed` when the item has been moved to the trash but not deleted
    ///     * `deleted` when the item has been permanently deleted.
    ///   - itemCollection: Items?
    public init(id: String, type: FolderBaseTypeField, etag: String? = nil, sequenceId: String? = nil, name: String? = nil, createdAt: String? = nil, modifiedAt: String? = nil, description: String? = nil, size: Int64? = nil, pathCollection: FolderPathCollectionField? = nil, createdBy: UserMini? = nil, modifiedBy: UserMini? = nil, trashedAt: String? = nil, purgedAt: String? = nil, contentCreatedAt: String? = nil, contentModifiedAt: String? = nil, ownedBy: UserMini? = nil, sharedLink: FolderSharedLinkField? = nil, folderUploadEmail: FolderFolderUploadEmailField? = nil, parent: FolderMini? = nil, itemStatus: FolderItemStatusField? = nil, itemCollection: Items? = nil) {
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.description = description
        self.size = size
        self.pathCollection = pathCollection
        self.createdBy = createdBy
        self.modifiedBy = modifiedBy
        self.trashedAt = trashedAt
        self.purgedAt = purgedAt
        self.contentCreatedAt = contentCreatedAt
        self.contentModifiedAt = contentModifiedAt
        self.ownedBy = ownedBy
        self.sharedLink = sharedLink
        self.folderUploadEmail = folderUploadEmail
        self.parent = parent
        self.itemStatus = itemStatus
        self.itemCollection = itemCollection
        super.init(id: id, type: type, etag: etag, sequenceId: sequenceId, name: name)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        size = try container.decodeIfPresent(Int64.self, forKey: .size)
        pathCollection = try container.decodeIfPresent(FolderPathCollectionField.self, forKey: .pathCollection)
        createdBy = try container.decodeIfPresent(UserMini.self, forKey: .createdBy)
        modifiedBy = try container.decodeIfPresent(UserMini.self, forKey: .modifiedBy)
        trashedAt = try container.decodeIfPresent(String.self, forKey: .trashedAt)
        purgedAt = try container.decodeIfPresent(String.self, forKey: .purgedAt)
        contentCreatedAt = try container.decodeIfPresent(String.self, forKey: .contentCreatedAt)
        contentModifiedAt = try container.decodeIfPresent(String.self, forKey: .contentModifiedAt)
        ownedBy = try container.decodeIfPresent(UserMini.self, forKey: .ownedBy)
        sharedLink = try container.decodeIfPresent(FolderSharedLinkField.self, forKey: .sharedLink)
        folderUploadEmail = try container.decodeIfPresent(FolderFolderUploadEmailField.self, forKey: .folderUploadEmail)
        parent = try container.decodeIfPresent(FolderMini.self, forKey: .parent)
        itemStatus = try container.decodeIfPresent(FolderItemStatusField.self, forKey: .itemStatus)
        itemCollection = try container.decodeIfPresent(Items.self, forKey: .itemCollection)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(pathCollection, forKey: .pathCollection)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(modifiedBy, forKey: .modifiedBy)
        try container.encodeIfPresent(trashedAt, forKey: .trashedAt)
        try container.encodeIfPresent(purgedAt, forKey: .purgedAt)
        try container.encodeIfPresent(contentCreatedAt, forKey: .contentCreatedAt)
        try container.encodeIfPresent(contentModifiedAt, forKey: .contentModifiedAt)
        try container.encodeIfPresent(ownedBy, forKey: .ownedBy)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(folderUploadEmail, forKey: .folderUploadEmail)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(itemStatus, forKey: .itemStatus)
        try container.encodeIfPresent(itemCollection, forKey: .itemCollection)
        try super.encode(to: encoder)
    }
}
