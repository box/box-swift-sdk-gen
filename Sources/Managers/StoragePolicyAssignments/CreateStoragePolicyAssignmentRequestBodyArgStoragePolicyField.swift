import Foundation

public class CreateStoragePolicyAssignmentRequestBodyArgStoragePolicyField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type to assign.
    public let type: CreateStoragePolicyAssignmentRequestBodyArgStoragePolicyFieldTypeField
    /// The ID of the storage policy to assign.
    public let id: String

    /// Initializer for a CreateStoragePolicyAssignmentRequestBodyArgStoragePolicyField.
    ///
    /// - Parameters:
    ///   - type: The type to assign.
    ///   - id: The ID of the storage policy to assign.
    public init(type: CreateStoragePolicyAssignmentRequestBodyArgStoragePolicyFieldTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateStoragePolicyAssignmentRequestBodyArgStoragePolicyFieldTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }
}
