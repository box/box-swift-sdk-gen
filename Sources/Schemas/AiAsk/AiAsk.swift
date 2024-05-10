import Foundation

/// AI Ask request object
public class AiAsk: Codable {
    private enum CodingKeys: String, CodingKey {
        case mode
        case prompt
        case items
    }

    /// The mode specifies if this request is for a single or multiple items.
    public let mode: AiAskModeField

    /// The prompt provided by the client to be answered by the LLM.
    public let prompt: String

    /// The items to be processed by the LLM, often files.
    public let items: [AiAskItemsField]

    /// Initializer for a AiAsk.
    ///
    /// - Parameters:
    ///   - mode: The mode specifies if this request is for a single or multiple items.
    ///   - prompt: The prompt provided by the client to be answered by the LLM.
    ///   - items: The items to be processed by the LLM, often files.
    public init(mode: AiAskModeField, prompt: String, items: [AiAskItemsField]) {
        self.mode = mode
        self.prompt = prompt
        self.items = items
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mode = try container.decode(AiAskModeField.self, forKey: .mode)
        prompt = try container.decode(String.self, forKey: .prompt)
        items = try container.decode([AiAskItemsField].self, forKey: .items)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(mode, forKey: .mode)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(items, forKey: .items)
    }

}
