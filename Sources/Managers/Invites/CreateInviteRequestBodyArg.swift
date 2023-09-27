import Foundation

public class CreateInviteRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case enterprise
        case actionableBy = "actionable_by"
    }

    /// The enterprise to invite the user to,
    public let enterprise: CreateInviteRequestBodyArgEnterpriseField
    /// The user to invite,
    public let actionableBy: CreateInviteRequestBodyArgActionableByField

    /// Initializer for a CreateInviteRequestBodyArg.
    ///
    /// - Parameters:
    ///   - enterprise: The enterprise to invite the user to
    ///   - actionableBy: The user to invite
    public init(enterprise: CreateInviteRequestBodyArgEnterpriseField, actionableBy: CreateInviteRequestBodyArgActionableByField) {
        self.enterprise = enterprise
        self.actionableBy = actionableBy
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        enterprise = try container.decode(CreateInviteRequestBodyArgEnterpriseField.self, forKey: .enterprise)
        actionableBy = try container.decode(CreateInviteRequestBodyArgActionableByField.self, forKey: .actionableBy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(enterprise, forKey: .enterprise)
        try container.encode(actionableBy, forKey: .actionableBy)
    }
}
