import Foundation

public class UpdateSharedLinkOnWebLinkRequestBodySharedLinkField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case access
        case password
        case vanityName = "vanity_name"
        case unsharedAt = "unshared_at"
        case permissions
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The level of access for the shared link. This can be
    /// restricted to anyone with the link (`open`), only people
    /// within the company (`company`) and only those who
    /// have been invited to the folder (`collaborators`).
    /// 
    /// If not set, this field defaults to the access level specified
    /// by the enterprise admin. To create a shared link with this
    /// default setting pass the `shared_link` object with
    /// no `access` field, for example `{ "shared_link": {} }`.
    /// 
    /// The `company` access level is only available to paid
    /// accounts.
    public let access: UpdateSharedLinkOnWebLinkRequestBodySharedLinkAccessField?

    /// The password required to access the shared link. Set the
    /// password to `null` to remove it.
    /// Passwords must now be at least eight characters
    /// long and include a number, upper case letter, or
    /// a non-numeric or non-alphabetic character.
    /// A password can only be set when `access` is set to `open`.
    @CodableTriState public private(set) var password: String?

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
    public let unsharedAt: Date?

    public let permissions: UpdateSharedLinkOnWebLinkRequestBodySharedLinkPermissionsField?

    /// Initializer for a UpdateSharedLinkOnWebLinkRequestBodySharedLinkField.
    ///
    /// - Parameters:
    ///   - access: The level of access for the shared link. This can be
    ///     restricted to anyone with the link (`open`), only people
    ///     within the company (`company`) and only those who
    ///     have been invited to the folder (`collaborators`).
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
    public init(access: UpdateSharedLinkOnWebLinkRequestBodySharedLinkAccessField? = nil, password: TriStateField<String> = nil, vanityName: String? = nil, unsharedAt: Date? = nil, permissions: UpdateSharedLinkOnWebLinkRequestBodySharedLinkPermissionsField? = nil) {
        self.access = access
        self._password = CodableTriState(state: password)
        self.vanityName = vanityName
        self.unsharedAt = unsharedAt
        self.permissions = permissions
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        access = try container.decodeIfPresent(UpdateSharedLinkOnWebLinkRequestBodySharedLinkAccessField.self, forKey: .access)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        vanityName = try container.decodeIfPresent(String.self, forKey: .vanityName)
        unsharedAt = try container.decodeDateTimeIfPresent(forKey: .unsharedAt)
        permissions = try container.decodeIfPresent(UpdateSharedLinkOnWebLinkRequestBodySharedLinkPermissionsField.self, forKey: .permissions)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(access, forKey: .access)
        try container.encode(field: _password.state, forKey: .password)
        try container.encodeIfPresent(vanityName, forKey: .vanityName)
        try container.encodeDateTimeIfPresent(field: unsharedAt, forKey: .unsharedAt)
        try container.encodeIfPresent(permissions, forKey: .permissions)
    }

    /// Sets the raw JSON data.
    ///
    /// - Parameters:
    ///   - rawData: A dictionary containing the raw JSON data
    func setRawData(rawData: [String: Any]?) {
        self._rawData = rawData
    }

    /// Gets the raw JSON data
    /// - Returns: The `[String: Any]?`.
    func getRawData() -> [String: Any]? {
        return self._rawData
    }

}
