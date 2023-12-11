import Foundation

public class CreateCollaborationRequestBodyArgItemField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The type of the item that this collaboration will be
    /// granted access to
    public let type: CreateCollaborationRequestBodyArgItemFieldTypeField?

    /// The ID of the item that will be granted access to
    public let id: String?

    /// Initializer for a CreateCollaborationRequestBodyArgItemField.
    ///
    /// - Parameters:
    ///   - type: The type of the item that this collaboration will be
    ///     granted access to
    ///   - id: The ID of the item that will be granted access to
    public init(type: CreateCollaborationRequestBodyArgItemFieldTypeField? = nil, id: String? = nil) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(CreateCollaborationRequestBodyArgItemFieldTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
    }

}
