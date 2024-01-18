import Foundation

public class AddShareLinkToFileRequestBodySharedLinkField: Codable {
    private enum CodingKeys: String, CodingKey {
        case access
        case password
        case vanityName = "vanity_name"
        case unsharedAt = "unshared_at"
        case permissions
    }

    /// The level of access for the shared link. This can be
    /// restricted to anyone with the link (`open`), only people
    /// within the company (`company`) and only those who
    /// have been invited to the file (`collaborators`).
    /// 
    /// If not set, this field defaults to the access level specified
    /// by the enterprise admin. To create a shared link with this
    /// default setting pass the `shared_link` object with
    /// no `access` field, for example `{ "shared_link": {} }`.
    /// 
    /// The `company` access level is only available to paid
    /// accounts.
    public let access: AddShareLinkToFileRequestBodySharedLinkAccessField?

    /// The password required to access the shared link. Set the
    /// password to `null` to remove it.
    /// Passwords must now be at least eight characters
    /// long and include a number, upper case letter, or
    /// a non-numeric or non-alphabetic character.
    /// A password can only be set when `access` is set to `open`.
    public let password: String?

    /// Defines a custom vanity name to use in the shared link URL,
    /// for example `https://app.box.com/v/my-shared-link`.
    /// 
    /// Custom URLs should not be used when sharing sensitive content
    /// as vanity URLs are a lot easier to guess than regular shared
    /// links.
    public let vanityName: String?

    /// The timestamp at which this shared link will
    /// expire. This field can only be set by
    /// users with paid accounts. The value must be greater than the
    /// current date and time.
    public let unsharedAt: String?

    public let permissions: AddShareLinkToFileRequestBodySharedLinkPermissionsField?

    /// Initializer for a AddShareLinkToFileRequestBodySharedLinkField.
    ///
    /// - Parameters:
    ///   - access: The level of access for the shared link. This can be
    ///     restricted to anyone with the link (`open`), only people
    ///     within the company (`company`) and only those who
    ///     have been invited to the file (`collaborators`).
    ///     
    ///     If not set, this field defaults to the access level specified
    ///     by the enterprise admin. To create a shared link with this
    ///     default setting pass the `shared_link` object with
    ///     no `access` field, for example `{ "shared_link": {} }`.
    ///     
    ///     The `company` access level is only available to paid
    ///     accounts.
    ///   - password: The password required to access the shared link. Set the
    ///     password to `null` to remove it.
    ///     Passwords must now be at least eight characters
    ///     long and include a number, upper case letter, or
    ///     a non-numeric or non-alphabetic character.
    ///     A password can only be set when `access` is set to `open`.
    ///   - vanityName: Defines a custom vanity name to use in the shared link URL,
    ///     for example `https://app.box.com/v/my-shared-link`.
    ///     
    ///     Custom URLs should not be used when sharing sensitive content
    ///     as vanity URLs are a lot easier to guess than regular shared
    ///     links.
    ///   - unsharedAt: The timestamp at which this shared link will
    ///     expire. This field can only be set by
    ///     users with paid accounts. The value must be greater than the
    ///     current date and time.
    ///   - permissions: 
    public init(access: AddShareLinkToFileRequestBodySharedLinkAccessField? = nil, password: String? = nil, vanityName: String? = nil, unsharedAt: String? = nil, permissions: AddShareLinkToFileRequestBodySharedLinkPermissionsField? = nil) {
        self.access = access
        self.password = password
        self.vanityName = vanityName
        self.unsharedAt = unsharedAt
        self.permissions = permissions
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        access = try container.decodeIfPresent(AddShareLinkToFileRequestBodySharedLinkAccessField.self, forKey: .access)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        vanityName = try container.decodeIfPresent(String.self, forKey: .vanityName)
        unsharedAt = try container.decodeIfPresent(String.self, forKey: .unsharedAt)
        permissions = try container.decodeIfPresent(AddShareLinkToFileRequestBodySharedLinkPermissionsField.self, forKey: .permissions)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(access, forKey: .access)
        try container.encodeIfPresent(password, forKey: .password)
        try container.encodeIfPresent(vanityName, forKey: .vanityName)
        try container.encodeIfPresent(unsharedAt, forKey: .unsharedAt)
        try container.encodeIfPresent(permissions, forKey: .permissions)
    }

}