import Foundation

public class CreateTaskAssignmentRequestBodyArgTaskField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }

    /// The ID of the task,
    public let id: String
    /// The type of the item to assign.,
    public let type: CreateTaskAssignmentRequestBodyArgTaskFieldTypeField

    /// Initializer for a CreateTaskAssignmentRequestBodyArgTaskField.
    ///
    /// - Parameters:
    ///   - id: The ID of the task
    ///   - type: The type of the item to assign.
    public init(id: String, type: CreateTaskAssignmentRequestBodyArgTaskFieldTypeField) {
        self.id = id
        self.type = type
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(CreateTaskAssignmentRequestBodyArgTaskFieldTypeField.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
    }
}
