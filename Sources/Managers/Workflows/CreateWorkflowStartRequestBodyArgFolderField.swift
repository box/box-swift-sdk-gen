import Foundation

public class CreateWorkflowStartRequestBodyArgFolderField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type of the folder object
    public let type: CreateWorkflowStartRequestBodyArgFolderFieldTypeField?
    /// The id of the folder
    public let id: String?

    /// Initializer for a CreateWorkflowStartRequestBodyArgFolderField.
    ///
    /// - Parameters:
    ///   - type: The type of the folder object
    ///   - id: The id of the folder
    public init(type: CreateWorkflowStartRequestBodyArgFolderFieldTypeField? = nil, id: String? = nil) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(CreateWorkflowStartRequestBodyArgFolderFieldTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
    }
}
