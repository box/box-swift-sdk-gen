import Foundation

public class CreateLegalHoldPolicyAssignmentRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case policyId = "policy_id"
        case assignTo = "assign_to"
    }

    /// The ID of the policy to assign.
    public let policyId: String
    /// The item to assign the policy to
    public let assignTo: CreateLegalHoldPolicyAssignmentRequestBodyArgAssignToField

    /// Initializer for a CreateLegalHoldPolicyAssignmentRequestBodyArg.
    ///
    /// - Parameters:
    ///   - policyId: The ID of the policy to assign.
    ///   - assignTo: The item to assign the policy to
    public init(policyId: String, assignTo: CreateLegalHoldPolicyAssignmentRequestBodyArgAssignToField) {
        self.policyId = policyId
        self.assignTo = assignTo
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        policyId = try container.decode(String.self, forKey: .policyId)
        assignTo = try container.decode(CreateLegalHoldPolicyAssignmentRequestBodyArgAssignToField.self, forKey: .assignTo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(policyId, forKey: .policyId)
        try container.encode(assignTo, forKey: .assignTo)
    }
}
