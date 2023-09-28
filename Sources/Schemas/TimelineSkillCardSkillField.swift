import Foundation

public class TimelineSkillCardSkillField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// `service`,
    public let type: TimelineSkillCardSkillFieldTypeField
    /// A custom identifier that represent the service that
    /// applied this metadata.,
    public let id: String

    /// Initializer for a TimelineSkillCardSkillField.
    ///
    /// - Parameters:
    ///   - type: `service`
    ///   - id: A custom identifier that represent the service that
    ///     applied this metadata.
    public init(type: TimelineSkillCardSkillFieldTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(TimelineSkillCardSkillFieldTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }
}
