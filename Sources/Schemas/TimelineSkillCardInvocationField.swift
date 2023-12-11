import Foundation

public class TimelineSkillCardInvocationField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// `skill_invocation`
    public let type: TimelineSkillCardInvocationFieldTypeField

    /// A custom identifier that represent the instance of
    /// the service that applied this metadata. For example,
    /// if your `image-recognition-service` runs on multiple
    /// nodes, this field can be used to identify the ID of
    /// the node that was used to apply the metadata.
    public let id: String

    /// Initializer for a TimelineSkillCardInvocationField.
    ///
    /// - Parameters:
    ///   - type: `skill_invocation`
    ///   - id: A custom identifier that represent the instance of
    ///     the service that applied this metadata. For example,
    ///     if your `image-recognition-service` runs on multiple
    ///     nodes, this field can be used to identify the ID of
    ///     the node that was used to apply the metadata.
    public init(type: TimelineSkillCardInvocationFieldTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(TimelineSkillCardInvocationFieldTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }

}
