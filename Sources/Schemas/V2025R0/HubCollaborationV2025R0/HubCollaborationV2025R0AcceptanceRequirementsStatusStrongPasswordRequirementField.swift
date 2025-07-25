import Foundation

public class HubCollaborationV2025R0AcceptanceRequirementsStatusStrongPasswordRequirementField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case enterpriseHasStrongPasswordRequiredForExternalUsers = "enterprise_has_strong_password_required_for_external_users"
        case userHasStrongPassword = "user_has_strong_password"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// Whether or not the enterprise that owns the content requires
    /// a strong password to collaborate on the content, or enforces
    /// an exposed password detection for the external collaborators.
    public let enterpriseHasStrongPasswordRequiredForExternalUsers: Bool?

    /// Whether or not the user has a strong and not exposed password set
    /// for their account. The field is `null` when a strong password is
    /// not required.
    @CodableTriState public private(set) var userHasStrongPassword: Bool?

    /// Initializer for a HubCollaborationV2025R0AcceptanceRequirementsStatusStrongPasswordRequirementField.
    ///
    /// - Parameters:
    ///   - enterpriseHasStrongPasswordRequiredForExternalUsers: Whether or not the enterprise that owns the content requires
    ///     a strong password to collaborate on the content, or enforces
    ///     an exposed password detection for the external collaborators.
    ///   - userHasStrongPassword: Whether or not the user has a strong and not exposed password set
    ///     for their account. The field is `null` when a strong password is
    ///     not required.
    public init(enterpriseHasStrongPasswordRequiredForExternalUsers: Bool? = nil, userHasStrongPassword: TriStateField<Bool> = nil) {
        self.enterpriseHasStrongPasswordRequiredForExternalUsers = enterpriseHasStrongPasswordRequiredForExternalUsers
        self._userHasStrongPassword = CodableTriState(state: userHasStrongPassword)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        enterpriseHasStrongPasswordRequiredForExternalUsers = try container.decodeIfPresent(Bool.self, forKey: .enterpriseHasStrongPasswordRequiredForExternalUsers)
        userHasStrongPassword = try container.decodeIfPresent(Bool.self, forKey: .userHasStrongPassword)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(enterpriseHasStrongPasswordRequiredForExternalUsers, forKey: .enterpriseHasStrongPasswordRequiredForExternalUsers)
        try container.encode(field: _userHasStrongPassword.state, forKey: .userHasStrongPassword)
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
