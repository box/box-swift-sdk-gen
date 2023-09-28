import Foundation

public class UpdateFileByIdRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case parent
        case sharedLink = "shared_link"
        case lock
        case dispositionAt = "disposition_at"
        case permissions
        case collections
        case tags
    }

    /// An optional different name for the file. This can be used to
    /// rename the file.,
    public let name: String?
    /// The description for a file. This can be seen in the right-hand sidebar panel
    /// when viewing a file in the Box web app. Additionally, this index is used in
    /// the search index of the file, allowing users to find the file by the content
    /// in the description.,
    public let description: String?
    public let parent: UpdateFileByIdRequestBodyArgParentField?
    public let sharedLink: UpdateFileByIdRequestBodyArgSharedLinkField?
    /// Defines a lock on an item. This prevents the item from being
    /// moved, renamed, or otherwise changed by anyone other than the user
    /// who created the lock.
    /// 
    /// Set this to `null` to remove the lock.,
    public let lock: UpdateFileByIdRequestBodyArgLockField?
    /// The retention expiration timestamp for the given file. This
    /// date cannot be shortened once set on a file.,
    public let dispositionAt: String?
    /// Defines who can download a file.,
    public let permissions: UpdateFileByIdRequestBodyArgPermissionsField?
    /// An array of collections to make this file
    /// a member of. Currently
    /// we only support the `favorites` collection.
    /// 
    /// To get the ID for a collection, use the
    /// [List all collections][1] endpoint.
    /// 
    /// Passing an empty array `[]` or `null` will remove
    /// the file from all collections.
    /// 
    /// [1]: e://get-collections,
    public let collections: [UpdateFileByIdRequestBodyArgCollectionsField]?
    /// The tags for this item. These tags are shown in
    /// the Box web app and mobile apps next to an item.
    /// 
    /// To add or remove a tag, retrieve the item's current tags,
    /// modify them, and then update this field.
    /// 
    /// There is a limit of 100 tags per item, and 10,000
    /// unique tags per enterprise.,
    public let tags: [String]?

    /// Initializer for a UpdateFileByIdRequestBodyArg.
    ///
    /// - Parameters:
    ///   - name: An optional different name for the file. This can be used to
    ///     rename the file.
    ///   - description: The description for a file. This can be seen in the right-hand sidebar panel
    ///     when viewing a file in the Box web app. Additionally, this index is used in
    ///     the search index of the file, allowing users to find the file by the content
    ///     in the description.
    ///   - parent: UpdateFileByIdRequestBodyArgParentField?
    ///   - sharedLink: UpdateFileByIdRequestBodyArgSharedLinkField?
    ///   - lock: Defines a lock on an item. This prevents the item from being
    ///     moved, renamed, or otherwise changed by anyone other than the user
    ///     who created the lock.
    ///     
    ///     Set this to `null` to remove the lock.
    ///   - dispositionAt: The retention expiration timestamp for the given file. This
    ///     date cannot be shortened once set on a file.
    ///   - permissions: Defines who can download a file.
    ///   - collections: An array of collections to make this file
    ///     a member of. Currently
    ///     we only support the `favorites` collection.
    ///     
    ///     To get the ID for a collection, use the
    ///     [List all collections][1] endpoint.
    ///     
    ///     Passing an empty array `[]` or `null` will remove
    ///     the file from all collections.
    ///     
    ///     [1]: e://get-collections
    ///   - tags: The tags for this item. These tags are shown in
    ///     the Box web app and mobile apps next to an item.
    ///     
    ///     To add or remove a tag, retrieve the item's current tags,
    ///     modify them, and then update this field.
    ///     
    ///     There is a limit of 100 tags per item, and 10,000
    ///     unique tags per enterprise.
    public init(name: String? = nil, description: String? = nil, parent: UpdateFileByIdRequestBodyArgParentField? = nil, sharedLink: UpdateFileByIdRequestBodyArgSharedLinkField? = nil, lock: UpdateFileByIdRequestBodyArgLockField? = nil, dispositionAt: String? = nil, permissions: UpdateFileByIdRequestBodyArgPermissionsField? = nil, collections: [UpdateFileByIdRequestBodyArgCollectionsField]? = nil, tags: [String]? = nil) {
        self.name = name
        self.description = description
        self.parent = parent
        self.sharedLink = sharedLink
        self.lock = lock
        self.dispositionAt = dispositionAt
        self.permissions = permissions
        self.collections = collections
        self.tags = tags
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        parent = try container.decodeIfPresent(UpdateFileByIdRequestBodyArgParentField.self, forKey: .parent)
        sharedLink = try container.decodeIfPresent(UpdateFileByIdRequestBodyArgSharedLinkField.self, forKey: .sharedLink)
        lock = try container.decodeIfPresent(UpdateFileByIdRequestBodyArgLockField.self, forKey: .lock)
        dispositionAt = try container.decodeIfPresent(String.self, forKey: .dispositionAt)
        permissions = try container.decodeIfPresent(UpdateFileByIdRequestBodyArgPermissionsField.self, forKey: .permissions)
        collections = try container.decodeIfPresent([UpdateFileByIdRequestBodyArgCollectionsField].self, forKey: .collections)
        tags = try container.decodeIfPresent([String].self, forKey: .tags)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(lock, forKey: .lock)
        try container.encodeIfPresent(dispositionAt, forKey: .dispositionAt)
        try container.encodeIfPresent(permissions, forKey: .permissions)
        try container.encodeIfPresent(collections, forKey: .collections)
        try container.encodeIfPresent(tags, forKey: .tags)
    }
}
