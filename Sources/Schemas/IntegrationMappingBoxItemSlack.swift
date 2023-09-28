import Foundation

public class IntegrationMappingBoxItemSlack: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// Type of the mapped item referenced in `id`,
    public let type: IntegrationMappingBoxItemSlackTypeField
    /// ID of the mapped item (of type referenced in `type`),
    public let id: String

    /// Initializer for a IntegrationMappingBoxItemSlack.
    ///
    /// - Parameters:
    ///   - type: Type of the mapped item referenced in `id`
    ///   - id: ID of the mapped item (of type referenced in `type`)
    public init(type: IntegrationMappingBoxItemSlackTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(IntegrationMappingBoxItemSlackTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }
}
