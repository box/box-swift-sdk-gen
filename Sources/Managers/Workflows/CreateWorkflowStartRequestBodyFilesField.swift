import Foundation

public class CreateWorkflowStartRequestBodyFilesField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type of the file object
    public let type: CreateWorkflowStartRequestBodyFilesTypeField?

    /// The id of the file
    public let id: String?

    /// Initializer for a CreateWorkflowStartRequestBodyFilesField.
    ///
    /// - Parameters:
    ///   - type: The type of the file object
    ///   - id: The id of the file
    public init(type: CreateWorkflowStartRequestBodyFilesTypeField? = nil, id: String? = nil) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(CreateWorkflowStartRequestBodyFilesTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
    }

}
