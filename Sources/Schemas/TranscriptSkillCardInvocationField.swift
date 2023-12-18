import Foundation

public class TranscriptSkillCardInvocationField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// `skill_invocation`
    public let type: TranscriptSkillCardInvocationTypeField

    /// A custom identifier that represent the instance of
    /// the service that applied this metadata. For example,
    /// if your `image-recognition-service` runs on multiple
    /// nodes, this field can be used to identify the ID of
    /// the node that was used to apply the metadata.
    public let id: String

    /// Initializer for a TranscriptSkillCardInvocationField.
    ///
    /// - Parameters:
    ///   - type: `skill_invocation`
    ///   - id: A custom identifier that represent the instance of
    ///     the service that applied this metadata. For example,
    ///     if your `image-recognition-service` runs on multiple
    ///     nodes, this field can be used to identify the ID of
    ///     the node that was used to apply the metadata.
    public init(type: TranscriptSkillCardInvocationTypeField, id: String) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(TranscriptSkillCardInvocationTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
    }

}
