import Foundation

/// The AI Agent to be used for extraction.
public class AiStudioAgentExtract: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case accessState = "access_state"
        case description
        case type
        case customInstructions = "custom_instructions"
        case longText = "long_text"
        case basicText = "basic_text"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The state of the AI Agent capability. Possible values are: `enabled` and `disabled`.
    public let accessState: String

    /// The description of the AI Agent.
    public let description: String

    /// The type of AI agent to be used for extraction.
    public let type: AiStudioAgentExtractTypeField

    /// Custom instructions for the agent.
    @CodableTriState public private(set) var customInstructions: String?

    public let longText: AiStudioAgentLongTextTool?

    public let basicText: AiStudioAgentBasicTextTool?

    /// Initializer for a AiStudioAgentExtract.
    ///
    /// - Parameters:
    ///   - accessState: The state of the AI Agent capability. Possible values are: `enabled` and `disabled`.
    ///   - description: The description of the AI Agent.
    ///   - type: The type of AI agent to be used for extraction.
    ///   - customInstructions: Custom instructions for the agent.
    ///   - longText: 
    ///   - basicText: 
    public init(accessState: String, description: String, type: AiStudioAgentExtractTypeField = AiStudioAgentExtractTypeField.aiAgentExtract, customInstructions: TriStateField<String> = nil, longText: AiStudioAgentLongTextTool? = nil, basicText: AiStudioAgentBasicTextTool? = nil) {
        self.accessState = accessState
        self.description = description
        self.type = type
        self._customInstructions = CodableTriState(state: customInstructions)
        self.longText = longText
        self.basicText = basicText
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessState = try container.decode(String.self, forKey: .accessState)
        description = try container.decode(String.self, forKey: .description)
        type = try container.decode(AiStudioAgentExtractTypeField.self, forKey: .type)
        customInstructions = try container.decodeIfPresent(String.self, forKey: .customInstructions)
        longText = try container.decodeIfPresent(AiStudioAgentLongTextTool.self, forKey: .longText)
        basicText = try container.decodeIfPresent(AiStudioAgentBasicTextTool.self, forKey: .basicText)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(accessState, forKey: .accessState)
        try container.encode(description, forKey: .description)
        try container.encode(type, forKey: .type)
        try container.encode(field: _customInstructions.state, forKey: .customInstructions)
        try container.encodeIfPresent(longText, forKey: .longText)
        try container.encodeIfPresent(basicText, forKey: .basicText)
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
