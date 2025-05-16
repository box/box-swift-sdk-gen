import Foundation

/// The AI agent used to handle queries.
public class AiAgentAsk: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case type
        case longText = "long_text"
        case basicText = "basic_text"
        case longTextMulti = "long_text_multi"
        case basicTextMulti = "basic_text_multi"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The type of AI agent used to handle queries.
    public let type: AiAgentAskTypeField

    public let longText: AiAgentLongTextTool?

    public let basicText: AiAgentBasicTextTool?

    public let longTextMulti: AiAgentLongTextTool?

    public let basicTextMulti: AiAgentBasicTextTool?

    /// Initializer for a AiAgentAsk.
    ///
    /// - Parameters:
    ///   - type: The type of AI agent used to handle queries.
    ///   - longText: 
    ///   - basicText: 
    ///   - longTextMulti: 
    ///   - basicTextMulti: 
    public init(type: AiAgentAskTypeField = AiAgentAskTypeField.aiAgentAsk, longText: AiAgentLongTextTool? = nil, basicText: AiAgentBasicTextTool? = nil, longTextMulti: AiAgentLongTextTool? = nil, basicTextMulti: AiAgentBasicTextTool? = nil) {
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
        basicText = try container.decodeIfPresent(AiAgentBasicTextTool.self, forKey: .basicText)
        longTextMulti = try container.decodeIfPresent(AiAgentLongTextTool.self, forKey: .longTextMulti)
        basicTextMulti = try container.decodeIfPresent(AiAgentBasicTextTool.self, forKey: .basicTextMulti)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(longText, forKey: .longText)
        try container.encodeIfPresent(basicText, forKey: .basicText)
        try container.encodeIfPresent(longTextMulti, forKey: .longTextMulti)
        try container.encodeIfPresent(basicTextMulti, forKey: .basicTextMulti)
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
