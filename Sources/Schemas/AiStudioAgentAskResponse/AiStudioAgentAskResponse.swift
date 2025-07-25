import Foundation

/// The AI agent to be used to ask questions.
public class AiStudioAgentAskResponse: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case accessState = "access_state"
        case description
        case type
        case customInstructions = "custom_instructions"
        case suggestedQuestions = "suggested_questions"
        case longText = "long_text"
        case basicText = "basic_text"
        case basicImage = "basic_image"
        case spreadsheet
        case longTextMulti = "long_text_multi"
        case basicTextMulti = "basic_text_multi"
        case basicImageMulti = "basic_image_multi"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// The state of the AI Agent capability. Possible values are: `enabled` and `disabled`.
    public let accessState: String

    /// The description of the AI agent.
    public let description: String

    /// The type of AI agent used to ask questions.
    public let type: AiStudioAgentAskResponseTypeField

    /// Custom instructions for the AI agent.
    @CodableTriState public private(set) var customInstructions: String?

    /// Suggested questions for the AI agent. If null, suggested question will be generated. If empty, no suggested questions will be displayed.
    public let suggestedQuestions: [String]?

    public let longText: AiStudioAgentLongTextToolResponse?

    public let basicText: AiStudioAgentBasicTextToolResponse?

    public let basicImage: AiStudioAgentBasicTextToolResponse?

    public let spreadsheet: AiStudioAgentSpreadsheetToolResponse?

    public let longTextMulti: AiStudioAgentLongTextToolResponse?

    public let basicTextMulti: AiStudioAgentBasicTextToolResponse?

    public let basicImageMulti: AiStudioAgentBasicTextToolResponse?

    /// Initializer for a AiStudioAgentAskResponse.
    ///
    /// - Parameters:
    ///   - accessState: The state of the AI Agent capability. Possible values are: `enabled` and `disabled`.
    ///   - description: The description of the AI agent.
    ///   - type: The type of AI agent used to ask questions.
    ///   - customInstructions: Custom instructions for the AI agent.
    ///   - suggestedQuestions: Suggested questions for the AI agent. If null, suggested question will be generated. If empty, no suggested questions will be displayed.
    ///   - longText: 
    ///   - basicText: 
    ///   - basicImage: 
    ///   - spreadsheet: 
    ///   - longTextMulti: 
    ///   - basicTextMulti: 
    ///   - basicImageMulti: 
    public init(accessState: String, description: String, type: AiStudioAgentAskResponseTypeField = AiStudioAgentAskResponseTypeField.aiAgentAsk, customInstructions: TriStateField<String> = nil, suggestedQuestions: [String]? = nil, longText: AiStudioAgentLongTextToolResponse? = nil, basicText: AiStudioAgentBasicTextToolResponse? = nil, basicImage: AiStudioAgentBasicTextToolResponse? = nil, spreadsheet: AiStudioAgentSpreadsheetToolResponse? = nil, longTextMulti: AiStudioAgentLongTextToolResponse? = nil, basicTextMulti: AiStudioAgentBasicTextToolResponse? = nil, basicImageMulti: AiStudioAgentBasicTextToolResponse? = nil) {
        self.accessState = accessState
        self.description = description
        self.type = type
        self._customInstructions = CodableTriState(state: customInstructions)
        self.suggestedQuestions = suggestedQuestions
        self.longText = longText
        self.basicText = basicText
        self.basicImage = basicImage
        self.spreadsheet = spreadsheet
        self.longTextMulti = longTextMulti
        self.basicTextMulti = basicTextMulti
        self.basicImageMulti = basicImageMulti
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accessState = try container.decode(String.self, forKey: .accessState)
        description = try container.decode(String.self, forKey: .description)
        type = try container.decode(AiStudioAgentAskResponseTypeField.self, forKey: .type)
        customInstructions = try container.decodeIfPresent(String.self, forKey: .customInstructions)
        suggestedQuestions = try container.decodeIfPresent([String].self, forKey: .suggestedQuestions)
        longText = try container.decodeIfPresent(AiStudioAgentLongTextToolResponse.self, forKey: .longText)
        basicText = try container.decodeIfPresent(AiStudioAgentBasicTextToolResponse.self, forKey: .basicText)
        basicImage = try container.decodeIfPresent(AiStudioAgentBasicTextToolResponse.self, forKey: .basicImage)
        spreadsheet = try container.decodeIfPresent(AiStudioAgentSpreadsheetToolResponse.self, forKey: .spreadsheet)
        longTextMulti = try container.decodeIfPresent(AiStudioAgentLongTextToolResponse.self, forKey: .longTextMulti)
        basicTextMulti = try container.decodeIfPresent(AiStudioAgentBasicTextToolResponse.self, forKey: .basicTextMulti)
        basicImageMulti = try container.decodeIfPresent(AiStudioAgentBasicTextToolResponse.self, forKey: .basicImageMulti)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(accessState, forKey: .accessState)
        try container.encode(description, forKey: .description)
        try container.encode(type, forKey: .type)
        try container.encode(field: _customInstructions.state, forKey: .customInstructions)
        try container.encodeIfPresent(suggestedQuestions, forKey: .suggestedQuestions)
        try container.encodeIfPresent(longText, forKey: .longText)
        try container.encodeIfPresent(basicText, forKey: .basicText)
        try container.encodeIfPresent(basicImage, forKey: .basicImage)
        try container.encodeIfPresent(spreadsheet, forKey: .spreadsheet)
        try container.encodeIfPresent(longTextMulti, forKey: .longTextMulti)
        try container.encodeIfPresent(basicTextMulti, forKey: .basicTextMulti)
        try container.encodeIfPresent(basicImageMulti, forKey: .basicImageMulti)
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
