import Foundation

public class CollaboratorVariableVariableValueField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// The object type.
    public let type: CollaboratorVariableVariableValueTypeField

    /// User's ID.
    public let id: String

    /// Initializer for a CollaboratorVariableVariableValueField.
    ///
    /// - Parameters:
    ///   - type: The object type.
    ///   - id: User's ID.
    public init(type: CollaboratorVariableVariableValueTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CollaboratorVariableVariableValueTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }

}
