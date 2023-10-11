import Foundation

public class CollaborationAcceptanceRequirementsStatusFieldTwoFactorAuthenticationRequirementField: Codable {
    private enum CodingKeys: String, CodingKey {
        case enterpriseHasTwoFactorAuthEnabled = "enterprise_has_two_factor_auth_enabled"
        case userHasTwoFactorAuthenticationEnabled = "user_has_two_factor_authentication_enabled"
    }

    /// Whether or not the enterprise that owns the content requires
    /// two-factor authentication to be enabled in order to
    /// collaborate on the content.
    public let enterpriseHasTwoFactorAuthEnabled: Bool?
    /// Whether or not the user has two-factor authentication
    /// enabled. The field is `null` when two-factor
    /// authentication is not required.
    public let userHasTwoFactorAuthenticationEnabled: Bool?

    /// Initializer for a CollaborationAcceptanceRequirementsStatusFieldTwoFactorAuthenticationRequirementField.
    ///
    /// - Parameters:
    ///   - enterpriseHasTwoFactorAuthEnabled: Whether or not the enterprise that owns the content requires
    ///     two-factor authentication to be enabled in order to
    ///     collaborate on the content.
    ///   - userHasTwoFactorAuthenticationEnabled: Whether or not the user has two-factor authentication
    ///     enabled. The field is `null` when two-factor
    ///     authentication is not required.
    public init(enterpriseHasTwoFactorAuthEnabled: Bool? = nil, userHasTwoFactorAuthenticationEnabled: Bool? = nil) {
        self.enterpriseHasTwoFactorAuthEnabled = enterpriseHasTwoFactorAuthEnabled
        self.userHasTwoFactorAuthenticationEnabled = userHasTwoFactorAuthenticationEnabled
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        enterpriseHasTwoFactorAuthEnabled = try container.decodeIfPresent(Bool.self, forKey: .enterpriseHasTwoFactorAuthEnabled)
        userHasTwoFactorAuthenticationEnabled = try container.decodeIfPresent(Bool.self, forKey: .userHasTwoFactorAuthenticationEnabled)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(enterpriseHasTwoFactorAuthEnabled, forKey: .enterpriseHasTwoFactorAuthEnabled)
        try container.encodeIfPresent(userHasTwoFactorAuthenticationEnabled, forKey: .userHasTwoFactorAuthenticationEnabled)
    }
}
