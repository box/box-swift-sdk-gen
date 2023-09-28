import Foundation

public class CollaborationAcceptanceRequirementsStatusFieldStrongPasswordRequirementField: Codable {
    private enum CodingKeys: String, CodingKey {
        case enterpriseHasStrongPasswordRequiredForExternalUsers = "enterprise_has_strong_password_required_for_external_users"
        case userHasStrongPassword = "user_has_strong_password"
    }

    /// Whether or not the enterprise that owns the content requires
    /// a strong password to collaborate on the content.,
    public let enterpriseHasStrongPasswordRequiredForExternalUsers: Bool?
    /// Whether or not the user has a strong password set for their
    /// account. The field is `null` when a strong password is not
    /// required.,
    public let userHasStrongPassword: Bool?

    /// Initializer for a CollaborationAcceptanceRequirementsStatusFieldStrongPasswordRequirementField.
    ///
    /// - Parameters:
    ///   - enterpriseHasStrongPasswordRequiredForExternalUsers: Whether or not the enterprise that owns the content requires
    ///     a strong password to collaborate on the content.
    ///   - userHasStrongPassword: Whether or not the user has a strong password set for their
    ///     account. The field is `null` when a strong password is not
    ///     required.
    public init(enterpriseHasStrongPasswordRequiredForExternalUsers: Bool? = nil, userHasStrongPassword: Bool? = nil) {
        self.enterpriseHasStrongPasswordRequiredForExternalUsers = enterpriseHasStrongPasswordRequiredForExternalUsers
        self.userHasStrongPassword = userHasStrongPassword
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        enterpriseHasStrongPasswordRequiredForExternalUsers = try container.decodeIfPresent(Bool.self, forKey: .enterpriseHasStrongPasswordRequiredForExternalUsers)
        userHasStrongPassword = try container.decodeIfPresent(Bool.self, forKey: .userHasStrongPassword)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(enterpriseHasStrongPasswordRequiredForExternalUsers, forKey: .enterpriseHasStrongPasswordRequiredForExternalUsers)
        try container.encodeIfPresent(userHasStrongPassword, forKey: .userHasStrongPassword)
    }
}
