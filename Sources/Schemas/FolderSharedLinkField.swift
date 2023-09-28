import Foundation

public class FolderSharedLinkField: Codable {
    private enum CodingKeys: String, CodingKey {
        case url
        case downloadUrl = "download_url"
        case vanityUrl = "vanity_url"
        case vanityName = "vanity_name"
        case access
        case effectiveAccess = "effective_access"
        case effectivePermission = "effective_permission"
        case unsharedAt = "unshared_at"
        case isPasswordEnabled = "is_password_enabled"
        case permissions
        case downloadCount = "download_count"
        case previewCount = "preview_count"
    }

    /// The URL that can be used to access the item on Box.
    /// 
    /// This URL will display the item in Box's preview UI where the file
    /// can be downloaded if allowed.
    /// 
    /// This URL will continue to work even when a custom `vanity_url`
    /// has been set for this shared link.,
    public let url: String
    /// A URL that can be used to download the file. This URL can be used in
    /// a browser to download the file. This URL includes the file
    /// extension so that the file will be saved with the right file type.
    /// 
    /// This property will be `null` for folders.,
    public let downloadUrl: String?
    /// The "Custom URL" that can also be used to preview the item on Box.  Custom
    /// URLs can only be created or modified in the Box Web application.,
    public let vanityUrl: String?
    /// The custom name of a shared link, as used in the `vanity_url` field.,
    public let vanityName: String?
    /// The access level for this shared link.
    /// 
    /// * `open` - provides access to this item to anyone with this link
    /// * `company` - only provides access to this item to people the same company
    /// * `collaborators` - only provides access to this item to people who are
    ///    collaborators on this item
    /// 
    /// If this field is omitted when creating the shared link, the access level
    /// will be set to the default access level specified by the enterprise admin.,
    public let access: FolderSharedLinkFieldAccessField?
    /// The effective access level for the shared link. This can be a more
    /// restrictive access level than the value in the `access` field when the
    /// enterprise settings restrict the allowed access levels.,
    public let effectiveAccess: FolderSharedLinkFieldEffectiveAccessField
    /// The effective permissions for this shared link.
    /// These result in the more restrictive combination of
    /// the share link permissions and the item permissions set
    /// by the administrator, the owner, and any ancestor item
    /// such as a folder.,
    public let effectivePermission: FolderSharedLinkFieldEffectivePermissionField
    /// The date and time when this link will be unshared. This field can only be
    /// set by users with paid accounts.,
    public let unsharedAt: String?
    /// Defines if the shared link requires a password to access the item.,
    public let isPasswordEnabled: Bool
    /// Defines if this link allows a user to preview, edit, and download an item.
    /// These permissions refer to the shared link only and
    /// do not supersede permissions applied to the item itself.,
    public let permissions: FolderSharedLinkFieldPermissionsField?
    /// The number of times this item has been downloaded.,
    public let downloadCount: Int
    /// The number of times this item has been previewed.,
    public let previewCount: Int

    /// Initializer for a FolderSharedLinkField.
    ///
    /// - Parameters:
    ///   - url: The URL that can be used to access the item on Box.
    ///     
    ///     This URL will display the item in Box's preview UI where the file
    ///     can be downloaded if allowed.
    ///     
    ///     This URL will continue to work even when a custom `vanity_url`
    ///     has been set for this shared link.
    ///   - downloadUrl: A URL that can be used to download the file. This URL can be used in
    ///     a browser to download the file. This URL includes the file
    ///     extension so that the file will be saved with the right file type.
    ///     
    ///     This property will be `null` for folders.
    ///   - vanityUrl: The "Custom URL" that can also be used to preview the item on Box.  Custom
    ///     URLs can only be created or modified in the Box Web application.
    ///   - vanityName: The custom name of a shared link, as used in the `vanity_url` field.
    ///   - access: The access level for this shared link.
    ///     
    ///     * `open` - provides access to this item to anyone with this link
    ///     * `company` - only provides access to this item to people the same company
    ///     * `collaborators` - only provides access to this item to people who are
    ///        collaborators on this item
    ///     
    ///     If this field is omitted when creating the shared link, the access level
    ///     will be set to the default access level specified by the enterprise admin.
    ///   - effectiveAccess: The effective access level for the shared link. This can be a more
    ///     restrictive access level than the value in the `access` field when the
    ///     enterprise settings restrict the allowed access levels.
    ///   - effectivePermission: The effective permissions for this shared link.
    ///     These result in the more restrictive combination of
    ///     the share link permissions and the item permissions set
    ///     by the administrator, the owner, and any ancestor item
    ///     such as a folder.
    ///   - unsharedAt: The date and time when this link will be unshared. This field can only be
    ///     set by users with paid accounts.
    ///   - isPasswordEnabled: Defines if the shared link requires a password to access the item.
    ///   - permissions: Defines if this link allows a user to preview, edit, and download an item.
    ///     These permissions refer to the shared link only and
    ///     do not supersede permissions applied to the item itself.
    ///   - downloadCount: The number of times this item has been downloaded.
    ///   - previewCount: The number of times this item has been previewed.
    public init(url: String, downloadUrl: String? = nil, vanityUrl: String? = nil, vanityName: String? = nil, access: FolderSharedLinkFieldAccessField? = nil, effectiveAccess: FolderSharedLinkFieldEffectiveAccessField, effectivePermission: FolderSharedLinkFieldEffectivePermissionField, unsharedAt: String? = nil, isPasswordEnabled: Bool, permissions: FolderSharedLinkFieldPermissionsField? = nil, downloadCount: Int, previewCount: Int) {
        self.url = url
        self.downloadUrl = downloadUrl
        self.vanityUrl = vanityUrl
        self.vanityName = vanityName
        self.access = access
        self.effectiveAccess = effectiveAccess
        self.effectivePermission = effectivePermission
        self.unsharedAt = unsharedAt
        self.isPasswordEnabled = isPasswordEnabled
        self.permissions = permissions
        self.downloadCount = downloadCount
        self.previewCount = previewCount
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decode(String.self, forKey: .url)
        downloadUrl = try container.decodeIfPresent(String.self, forKey: .downloadUrl)
        vanityUrl = try container.decodeIfPresent(String.self, forKey: .vanityUrl)
        vanityName = try container.decodeIfPresent(String.self, forKey: .vanityName)
        access = try container.decodeIfPresent(FolderSharedLinkFieldAccessField.self, forKey: .access)
        effectiveAccess = try container.decode(FolderSharedLinkFieldEffectiveAccessField.self, forKey: .effectiveAccess)
        effectivePermission = try container.decode(FolderSharedLinkFieldEffectivePermissionField.self, forKey: .effectivePermission)
        unsharedAt = try container.decodeIfPresent(String.self, forKey: .unsharedAt)
        isPasswordEnabled = try container.decode(Bool.self, forKey: .isPasswordEnabled)
        permissions = try container.decodeIfPresent(FolderSharedLinkFieldPermissionsField.self, forKey: .permissions)
        downloadCount = try container.decode(Int.self, forKey: .downloadCount)
        previewCount = try container.decode(Int.self, forKey: .previewCount)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encodeIfPresent(downloadUrl, forKey: .downloadUrl)
        try container.encodeIfPresent(vanityUrl, forKey: .vanityUrl)
        try container.encodeIfPresent(vanityName, forKey: .vanityName)
        try container.encodeIfPresent(access, forKey: .access)
        try container.encode(effectiveAccess, forKey: .effectiveAccess)
        try container.encode(effectivePermission, forKey: .effectivePermission)
        try container.encodeIfPresent(unsharedAt, forKey: .unsharedAt)
        try container.encode(isPasswordEnabled, forKey: .isPasswordEnabled)
        try container.encodeIfPresent(permissions, forKey: .permissions)
        try container.encode(downloadCount, forKey: .downloadCount)
        try container.encode(previewCount, forKey: .previewCount)
    }
}
