import Foundation

public class UpdateFileByIdRequestBody: Codable {
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
    /// rename the file.
    public let name: String?

    /// The description for a file. This can be seen in the right-hand sidebar panel
    /// when viewing a file in the Box web app. Additionally, this index is used in
    /// the search index of the file, allowing users to find the file by the content
    /// in the description.
    public let description: String?

    public let parent: UpdateFileByIdRequestBodyParentField?

    public let sharedLink: UpdateFileByIdRequestBodySharedLinkField?

    /// Defines a lock on an item. This prevents the item from being
    /// moved, renamed, or otherwise changed by anyone other than the user
    /// who created the lock.
    /// 
    /// Set this to `null` to remove the lock.
    public let lock: UpdateFileByIdRequestBodyLockField?

    /// The retention expiration timestamp for the given file. This
    /// date cannot be shortened once set on a file.
    public let dispositionAt: Date?

    /// Defines who can download a file.
    public let permissions: UpdateFileByIdRequestBodyPermissionsField?

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
    /// [1]: e://get-collections
    public let collections: [UpdateFileByIdRequestBodyCollectionsField]?

    /// The tags for this item. These tags are shown in
    /// the Box web app and mobile apps next to an item.
    /// 
    /// To add or remove a tag, retrieve the item's current tags,
    /// modify them, and then update this field.
    /// 
    /// There is a limit of 100 tags per item, and 10,000
    /// unique tags per enterprise.
    public let tags: [String]?

    /// Initializer for a UpdateFileByIdRequestBody.
    ///
    /// - Parameters:
    ///   - name: An optional different name for the file. This can be used to
    ///     rename the file.
    ///   - description: The description for a file. This can be seen in the right-hand sidebar panel
    ///     when viewing a file in the Box web app. Additionally, this index is used in
    ///     the search index of the file, allowing users to find the file by the content
    ///     in the description.
    ///   - parent: 
    ///   - sharedLink: 
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
    public init(name: String? = nil, description: String? = nil, parent: UpdateFileByIdRequestBodyParentField? = nil, sharedLink: UpdateFileByIdRequestBodySharedLinkField? = nil, lock: UpdateFileByIdRequestBodyLockField? = nil, dispositionAt: Date? = nil, permissions: UpdateFileByIdRequestBodyPermissionsField? = nil, collections: [UpdateFileByIdRequestBodyCollectionsField]? = nil, tags: [String]? = nil) {
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
        parent = try container.decodeIfPresent(UpdateFileByIdRequestBodyParentField.self, forKey: .parent)
        sharedLink = try container.decodeIfPresent(UpdateFileByIdRequestBodySharedLinkField.self, forKey: .sharedLink)
        lock = try container.decodeIfPresent(UpdateFileByIdRequestBodyLockField.self, forKey: .lock)
        if let _dispositionAt = try container.decodeIfPresent(String.self, forKey: .dispositionAt) {
            dispositionAt = try Utils.Dates.dateTimeFromString(dateTime: _dispositionAt)
        } else {
            dispositionAt = nil
        }

        permissions = try container.decodeIfPresent(UpdateFileByIdRequestBodyPermissionsField.self, forKey: .permissions)
        collections = try container.decodeIfPresent([UpdateFileByIdRequestBodyCollectionsField].self, forKey: .collections)
        tags = try container.decodeIfPresent([String].self, forKey: .tags)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(parent, forKey: .parent)
        try container.encodeIfPresent(sharedLink, forKey: .sharedLink)
        try container.encodeIfPresent(lock, forKey: .lock)
        if let dispositionAt = dispositionAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: dispositionAt), forKey: .dispositionAt)
        }

        try container.encodeIfPresent(permissions, forKey: .permissions)
        try container.encodeIfPresent(collections, forKey: .collections)
        try container.encodeIfPresent(tags, forKey: .tags)
    }

}
