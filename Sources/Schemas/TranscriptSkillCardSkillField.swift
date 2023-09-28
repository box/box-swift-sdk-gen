import Foundation

public class TranscriptSkillCardSkillField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// `service`,
    public let type: TranscriptSkillCardSkillFieldTypeField
    /// A custom identifier that represent the service that
    /// applied this metadata.,
    public let id: String

    /// Initializer for a TranscriptSkillCardSkillField.
    ///
    /// - Parameters:
    ///   - type: `service`
    ///   - id: A custom identifier that represent the service that
    ///     applied this metadata.
    public init(type: TranscriptSkillCardSkillFieldTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(TranscriptSkillCardSkillFieldTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }
}
