import Foundation

/// A full representation of a folder, as can be returned from any
/// folder API endpoints by default
public class FolderFull: Folder {
    private enum CodingKeys: String, CodingKey {
        case syncState = "sync_state"
        case hasCollaborations = "has_collaborations"
        case permissions
        case tags
        case canNonOwnersInvite = "can_non_owners_invite"
        case isExternallyOwned = "is_externally_owned"
        case metadata
        case isCollaborationRestrictedToEnterprise = "is_collaboration_restricted_to_enterprise"
        case allowedSharedLinkAccessLevels = "allowed_shared_link_access_levels"
        case allowedInviteeRoles = "allowed_invitee_roles"
        case watermarkInfo = "watermark_info"
        case isAccessibleViaSharedLink = "is_accessible_via_shared_link"
        case canNonOwnersViewCollaborators = "can_non_owners_view_collaborators"
        case classification
    }

    public let syncState: FolderFullSyncStateField?
    /// Specifies if this folder has any other collaborators.
    public let hasCollaborations: Bool?
    public let permissions: FolderFullPermissionsField?
    public let tags: [String]?
    public let canNonOwnersInvite: Bool?
    /// Specifies if this folder is owned by a user outside of the
    /// authenticated enterprise.
    public let isExternallyOwned: Bool?
    public let metadata: FolderFullMetadataField?
    public let isCollaborationRestrictedToEnterprise: Bool?
    /// A list of access levels that are available
    /// for this folder.
    /// 
    /// For some folders, like the root folder, this will always
    /// be an empty list as sharing is not allowed at that level.
    public let allowedSharedLinkAccessLevels: [FolderFullAllowedSharedLinkAccessLevelsField]?
    /// A list of the types of roles that user can be invited at
    /// when sharing this folder.
    public let allowedInviteeRoles: [FolderFullAllowedInviteeRolesField]?
    public let watermarkInfo: FolderFullWatermarkInfoField?
    /// Specifies if the folder can be accessed
    /// with the direct shared link or a shared link
    /// to a parent folder.
    public let isAccessibleViaSharedLink: Bool?
    /// Specifies if collaborators who are not owners
    /// of this folder are restricted from viewing other
    /// collaborations on this folder.
    /// 
    /// It also restricts non-owners from inviting new
    /// collaborators.
    public let canNonOwnersViewCollaborators: Bool?
    public let classification: FolderFullClassificationField?

    /// Initializer for a FolderFull.
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
    ///   - syncState: FolderFullSyncStateField?
    ///   - hasCollaborations: Specifies if this folder has any other collaborators.
    ///   - permissions: FolderFullPermissionsField?
    ///   - tags: [String]?
    ///   - canNonOwnersInvite: Bool?
    ///   - isExternallyOwned: Specifies if this folder is owned by a user outside of the
    ///     authenticated enterprise.
    ///   - metadata: FolderFullMetadataField?
    ///   - isCollaborationRestrictedToEnterprise: Bool?
    ///   - allowedSharedLinkAccessLevels: A list of access levels that are available
    ///     for this folder.
    ///     
    ///     For some folders, like the root folder, this will always
    ///     be an empty list as sharing is not allowed at that level.
    ///   - allowedInviteeRoles: A list of the types of roles that user can be invited at
    ///     when sharing this folder.
    ///   - watermarkInfo: FolderFullWatermarkInfoField?
    ///   - isAccessibleViaSharedLink: Specifies if the folder can be accessed
    ///     with the direct shared link or a shared link
    ///     to a parent folder.
    ///   - canNonOwnersViewCollaborators: Specifies if collaborators who are not owners
    ///     of this folder are restricted from viewing other
    ///     collaborations on this folder.
    ///     
    ///     It also restricts non-owners from inviting new
    ///     collaborators.
    ///   - classification: FolderFullClassificationField?
    public init(id: String, type: FolderBaseTypeField, etag: String? = nil, sequenceId: String? = nil, name: String? = nil, createdAt: String? = nil, modifiedAt: String? = nil, description: String? = nil, size: Int64? = nil, pathCollection: FolderPathCollectionField? = nil, createdBy: UserMini? = nil, modifiedBy: UserMini? = nil, trashedAt: String? = nil, purgedAt: String? = nil, contentCreatedAt: String? = nil, contentModifiedAt: String? = nil, ownedBy: UserMini? = nil, sharedLink: FolderSharedLinkField? = nil, folderUploadEmail: FolderFolderUploadEmailField? = nil, parent: FolderMini? = nil, itemStatus: FolderItemStatusField? = nil, itemCollection: Items? = nil, syncState: FolderFullSyncStateField? = nil, hasCollaborations: Bool? = nil, permissions: FolderFullPermissionsField? = nil, tags: [String]? = nil, canNonOwnersInvite: Bool? = nil, isExternallyOwned: Bool? = nil, metadata: FolderFullMetadataField? = nil, isCollaborationRestrictedToEnterprise: Bool? = nil, allowedSharedLinkAccessLevels: [FolderFullAllowedSharedLinkAccessLevelsField]? = nil, allowedInviteeRoles: [FolderFullAllowedInviteeRolesField]? = nil, watermarkInfo: FolderFullWatermarkInfoField? = nil, isAccessibleViaSharedLink: Bool? = nil, canNonOwnersViewCollaborators: Bool? = nil, classification: FolderFullClassificationField? = nil) {
        self.syncState = syncState
        self.hasCollaborations = hasCollaborations
        self.permissions = permissions
        self.tags = tags
        self.canNonOwnersInvite = canNonOwnersInvite
        self.isExternallyOwned = isExternallyOwned
        self.metadata = metadata
        self.isCollaborationRestrictedToEnterprise = isCollaborationRestrictedToEnterprise
        self.allowedSharedLinkAccessLevels = allowedSharedLinkAccessLevels
        self.allowedInviteeRoles = allowedInviteeRoles
        self.watermarkInfo = watermarkInfo
        self.isAccessibleViaSharedLink = isAccessibleViaSharedLink
        self.canNonOwnersViewCollaborators = canNonOwnersViewCollaborators
        self.classification = classification
        super.init(id: id, type: type, etag: etag, sequenceId: sequenceId, name: name, createdAt: createdAt, modifiedAt: modifiedAt, description: description, size: size, pathCollection: pathCollection, createdBy: createdBy, modifiedBy: modifiedBy, trashedAt: trashedAt, purgedAt: purgedAt, contentCreatedAt: contentCreatedAt, contentModifiedAt: contentModifiedAt, ownedBy: ownedBy, sharedLink: sharedLink, folderUploadEmail: folderUploadEmail, parent: parent, itemStatus: itemStatus, itemCollection: itemCollection)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        syncState = try container.decodeIfPresent(FolderFullSyncStateField.self, forKey: .syncState)
        hasCollaborations = try container.decodeIfPresent(Bool.self, forKey: .hasCollaborations)
        permissions = try container.decodeIfPresent(FolderFullPermissionsField.self, forKey: .permissions)
        tags = try container.decodeIfPresent([String].self, forKey: .tags)
        canNonOwnersInvite = try container.decodeIfPresent(Bool.self, forKey: .canNonOwnersInvite)
        isExternallyOwned = try container.decodeIfPresent(Bool.self, forKey: .isExternallyOwned)
        metadata = try container.decodeIfPresent(FolderFullMetadataField.self, forKey: .metadata)
        isCollaborationRestrictedToEnterprise = try container.decodeIfPresent(Bool.self, forKey: .isCollaborationRestrictedToEnterprise)
        allowedSharedLinkAccessLevels = try container.decodeIfPresent([FolderFullAllowedSharedLinkAccessLevelsField].self, forKey: .allowedSharedLinkAccessLevels)
        allowedInviteeRoles = try container.decodeIfPresent([FolderFullAllowedInviteeRolesField].self, forKey: .allowedInviteeRoles)
        watermarkInfo = try container.decodeIfPresent(FolderFullWatermarkInfoField.self, forKey: .watermarkInfo)
        isAccessibleViaSharedLink = try container.decodeIfPresent(Bool.self, forKey: .isAccessibleViaSharedLink)
        canNonOwnersViewCollaborators = try container.decodeIfPresent(Bool.self, forKey: .canNonOwnersViewCollaborators)
        classification = try container.decodeIfPresent(FolderFullClassificationField.self, forKey: .classification)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(syncState, forKey: .syncState)
        try container.encodeIfPresent(hasCollaborations, forKey: .hasCollaborations)
        try container.encodeIfPresent(permissions, forKey: .permissions)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(canNonOwnersInvite, forKey: .canNonOwnersInvite)
        try container.encodeIfPresent(isExternallyOwned, forKey: .isExternallyOwned)
        try container.encodeIfPresent(metadata, forKey: .metadata)
        try container.encodeIfPresent(isCollaborationRestrictedToEnterprise, forKey: .isCollaborationRestrictedToEnterprise)
        try container.encodeIfPresent(allowedSharedLinkAccessLevels, forKey: .allowedSharedLinkAccessLevels)
        try container.encodeIfPresent(allowedInviteeRoles, forKey: .allowedInviteeRoles)
        try container.encodeIfPresent(watermarkInfo, forKey: .watermarkInfo)
        try container.encodeIfPresent(isAccessibleViaSharedLink, forKey: .isAccessibleViaSharedLink)
        try container.encodeIfPresent(canNonOwnersViewCollaborators, forKey: .canNonOwnersViewCollaborators)
        try container.encodeIfPresent(classification, forKey: .classification)
        try super.encode(to: encoder)
    }
}
