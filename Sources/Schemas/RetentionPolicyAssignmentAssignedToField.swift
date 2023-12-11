import Foundation

public class RetentionPolicyAssignmentAssignedToField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }

    /// The ID of the folder, enterprise, or metadata template
    /// the policy is assigned to.
    /// Set to null or omit when type is set to enterprise.
    public let id: String?

    /// The type of resource the policy is assigned to.
    public let type: RetentionPolicyAssignmentAssignedToFieldTypeField?

    /// Initializer for a RetentionPolicyAssignmentAssignedToField.
    ///
    /// - Parameters:
    ///   - id: The ID of the folder, enterprise, or metadata template
    ///     the policy is assigned to.
    ///     Set to null or omit when type is set to enterprise.
    ///   - type: The type of resource the policy is assigned to.
    public init(id: String? = nil, type: RetentionPolicyAssignmentAssignedToFieldTypeField? = nil) {
        self.id = id
        self.type = type
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(RetentionPolicyAssignmentAssignedToFieldTypeField.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
    }

}
