import Foundation

public class CollaborationAcceptanceRequirementsStatusField: Codable {
    private enum CodingKeys: String, CodingKey {
        case termsOfServiceRequirement = "terms_of_service_requirement"
        case strongPasswordRequirement = "strong_password_requirement"
        case twoFactorAuthenticationRequirement = "two_factor_authentication_requirement"
    }

    public let termsOfServiceRequirement: CollaborationAcceptanceRequirementsStatusFieldTermsOfServiceRequirementField?
    public let strongPasswordRequirement: CollaborationAcceptanceRequirementsStatusFieldStrongPasswordRequirementField?
    public let twoFactorAuthenticationRequirement: CollaborationAcceptanceRequirementsStatusFieldTwoFactorAuthenticationRequirementField?

    public init(termsOfServiceRequirement: CollaborationAcceptanceRequirementsStatusFieldTermsOfServiceRequirementField? = nil, strongPasswordRequirement: CollaborationAcceptanceRequirementsStatusFieldStrongPasswordRequirementField? = nil, twoFactorAuthenticationRequirement: CollaborationAcceptanceRequirementsStatusFieldTwoFactorAuthenticationRequirementField? = nil) {
        self.termsOfServiceRequirement = termsOfServiceRequirement
        self.strongPasswordRequirement = strongPasswordRequirement
        self.twoFactorAuthenticationRequirement = twoFactorAuthenticationRequirement
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        termsOfServiceRequirement = try container.decodeIfPresent(CollaborationAcceptanceRequirementsStatusFieldTermsOfServiceRequirementField.self, forKey: .termsOfServiceRequirement)
        strongPasswordRequirement = try container.decodeIfPresent(CollaborationAcceptanceRequirementsStatusFieldStrongPasswordRequirementField.self, forKey: .strongPasswordRequirement)
        twoFactorAuthenticationRequirement = try container.decodeIfPresent(CollaborationAcceptanceRequirementsStatusFieldTwoFactorAuthenticationRequirementField.self, forKey: .twoFactorAuthenticationRequirement)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(termsOfServiceRequirement, forKey: .termsOfServiceRequirement)
        try container.encodeIfPresent(strongPasswordRequirement, forKey: .strongPasswordRequirement)
        try container.encodeIfPresent(twoFactorAuthenticationRequirement, forKey: .twoFactorAuthenticationRequirement)
    }
}
