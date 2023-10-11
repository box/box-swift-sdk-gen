import Foundation

public class CreateRetentionPolicyAssignmentRequestBodyArgAssignToField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type of item to assign the policy to.
    public let type: CreateRetentionPolicyAssignmentRequestBodyArgAssignToFieldTypeField
    /// The ID of item to assign the policy to.
    /// Set to `null` or omit when `type` is set to
    /// `enterprise`.
    public let id: String

    /// Initializer for a CreateRetentionPolicyAssignmentRequestBodyArgAssignToField.
    ///
    /// - Parameters:
    ///   - type: The type of item to assign the policy to.
    ///   - id: The ID of item to assign the policy to.
    ///     Set to `null` or omit when `type` is set to
    ///     `enterprise`.
    public init(type: CreateRetentionPolicyAssignmentRequestBodyArgAssignToFieldTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateRetentionPolicyAssignmentRequestBodyArgAssignToFieldTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }
}
