import Foundation

public class CreateStoragePolicyAssignmentRequestBodyArgAssignedToField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type to assign the policy to.,
    public let type: CreateStoragePolicyAssignmentRequestBodyArgAssignedToFieldTypeField
    /// The ID of the user or enterprise,
    public let id: String

    /// Initializer for a CreateStoragePolicyAssignmentRequestBodyArgAssignedToField.
    ///
    /// - Parameters:
    ///   - type: The type to assign the policy to.
    ///   - id: The ID of the user or enterprise
    public init(type: CreateStoragePolicyAssignmentRequestBodyArgAssignedToFieldTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateStoragePolicyAssignmentRequestBodyArgAssignedToFieldTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }
}
