import Foundation

/// The AI agent used to handle queries.
public class AiAgentAsk: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case longText = "long_text"
        case basicText = "basic_text"
        case longTextMulti = "long_text_multi"
        case basicTextMulti = "basic_text_multi"
    }

    /// The type of AI agent used to handle queries.
    /// This parameter is **required**.
    public let type: AiAgentAskTypeField

    public let longText: AiAgentLongTextTool?

    public let basicText: AiAgentBasicTextToolAsk?

    public let longTextMulti: AiAgentLongTextTool?

    public let basicTextMulti: AiAgentBasicTextToolAsk?

    /// Initializer for a AiAgentAsk.
    ///
    /// - Parameters:
    ///   - type: The type of AI agent used to handle queries.
    ///     This parameter is **required**.
    ///   - longText: 
    ///   - basicText: 
    ///   - longTextMulti: 
    ///   - basicTextMulti: 
    public init(type: AiAgentAskTypeField = AiAgentAskTypeField.aiAgentAsk, longText: AiAgentLongTextTool? = nil, basicText: AiAgentBasicTextToolAsk? = nil, longTextMulti: AiAgentLongTextTool? = nil, basicTextMulti: AiAgentBasicTextToolAsk? = nil) {
        self.type = type
        self.longText = longText
        self.basicText = basicText
        self.longTextMulti = longTextMulti
        self.basicTextMulti = basicTextMulti
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(AiAgentAskTypeField.self, forKey: .type)
        longText = try container.decodeIfPresent(AiAgentLongTextTool.self, forKey: .longText)
        basicText = try container.decodeIfPresent(AiAgentBasicTextToolAsk.self, forKey: .basicText)
        longTextMulti = try container.decodeIfPresent(AiAgentLongTextTool.self, forKey: .longTextMulti)
        basicTextMulti = try container.decodeIfPresent(AiAgentBasicTextToolAsk.self, forKey: .basicTextMulti)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(longText, forKey: .longText)
        try container.encodeIfPresent(basicText, forKey: .basicText)
        try container.encodeIfPresent(longTextMulti, forKey: .longTextMulti)
        try container.encodeIfPresent(basicTextMulti, forKey: .basicTextMulti)
    }

}
