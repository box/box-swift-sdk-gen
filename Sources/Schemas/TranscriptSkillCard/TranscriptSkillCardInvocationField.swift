import Foundation

public class TranscriptSkillCardInvocationField: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// A custom identifier that represent the instance of
    /// the service that applied this metadata. For example,
    /// if your `image-recognition-service` runs on multiple
    /// nodes, this field can be used to identify the ID of
    /// the node that was used to apply the metadata.
    public let id: String

    /// The value will always be `skill_invocation`.
    public let type: TranscriptSkillCardInvocationTypeField

    /// Initializer for a TranscriptSkillCardInvocationField.
    ///
    /// - Parameters:
    ///   - id: A custom identifier that represent the instance of
    ///     the service that applied this metadata. For example,
    ///     if your `image-recognition-service` runs on multiple
    ///     nodes, this field can be used to identify the ID of
    ///     the node that was used to apply the metadata.
    ///   - type: The value will always be `skill_invocation`.
    public init(id: String, type: TranscriptSkillCardInvocationTypeField = TranscriptSkillCardInvocationTypeField.skillInvocation) {
        self.id = id
        self.type = type
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(TranscriptSkillCardInvocationTypeField.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
    }

    /// Sets the raw JSON data.
    ///
    /// - Parameters:
    ///   - rawData: A dictionary containing the raw JSON data
    func setRawData(rawData: [String: Any]?) {
        self._rawData = rawData
    }

    /// Gets the raw JSON data
    /// - Returns: The `[String: Any]?`.
    func getRawData() -> [String: Any]? {
        return self._rawData
    }

}
