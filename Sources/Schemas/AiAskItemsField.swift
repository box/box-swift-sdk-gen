import Foundation

public class AiAskItemsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case content
    }

    /// The id of the item
    public let id: String

    /// The type of the item
    public let type: AiAskItemsTypeField

    /// The content of the item, often the text representation.
    public let content: String?

    /// Initializer for a AiAskItemsField.
    ///
    /// - Parameters:
    ///   - id: The id of the item
    ///   - type: The type of the item
    ///   - content: The content of the item, often the text representation.
    public init(id: String, type: AiAskItemsTypeField = AiAskItemsTypeField.file, content: String? = nil) {
        self.id = id
        self.type = type
        self.content = content
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(AiAskItemsTypeField.self, forKey: .type)
        content = try container.decodeIfPresent(String.self, forKey: .content)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(content, forKey: .content)
    }

}
