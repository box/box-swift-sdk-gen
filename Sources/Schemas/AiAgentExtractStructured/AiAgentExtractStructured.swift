import Foundation

/// The AI agent to be used for structured extraction.
public class AiAgentExtractStructured: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case longText = "long_text"
        case basicText = "basic_text"
    }

    /// The type of AI agent to be used for extraction.
    public let type: AiAgentExtractStructuredTypeField

    public let longText: AiAgentLongTextTool?

    public let basicText: AiAgentBasicTextTool?

    /// Initializer for a AiAgentExtractStructured.
    ///
    /// - Parameters:
    ///   - type: The type of AI agent to be used for extraction.
    ///   - longText: 
    ///   - basicText: 
    public init(type: AiAgentExtractStructuredTypeField = AiAgentExtractStructuredTypeField.aiAgentExtractStructured, longText: AiAgentLongTextTool? = nil, basicText: AiAgentBasicTextTool? = nil) {
        self.type = type
        self.longText = longText
        self.basicText = basicText
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(AiAgentExtractStructuredTypeField.self, forKey: .type)
        longText = try container.decodeIfPresent(AiAgentLongTextTool.self, forKey: .longText)
        basicText = try container.decodeIfPresent(AiAgentBasicTextTool.self, forKey: .basicText)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(longText, forKey: .longText)
        try container.encodeIfPresent(basicText, forKey: .basicText)
    }

}