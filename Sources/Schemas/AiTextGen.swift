import Foundation

/// AI Text Gen Request object
public class AiTextGen: Codable {
    private enum CodingKeys: String, CodingKey {
        case prompt
        case items
        case dialogueHistory = "dialogue_history"
    }

    /// The prompt provided by the client to be answered by the LLM.
    public let prompt: String

    /// The items to be processed by the LLM, often files.
    public let items: [AiTextGenItemsField]

    /// The history of prompts and answers previously passed to the LLM. This provides additional context to the LLM in generating the response.
    public let dialogueHistory: [AiTextGenDialogueHistoryField]?

    /// Initializer for a AiTextGen.
    ///
    /// - Parameters:
    ///   - prompt: The prompt provided by the client to be answered by the LLM.
    ///   - items: The items to be processed by the LLM, often files.
    ///   - dialogueHistory: The history of prompts and answers previously passed to the LLM. This provides additional context to the LLM in generating the response.
    public init(prompt: String, items: [AiTextGenItemsField], dialogueHistory: [AiTextGenDialogueHistoryField]? = nil) {
        self.prompt = prompt
        self.items = items
        self.dialogueHistory = dialogueHistory
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        prompt = try container.decode(String.self, forKey: .prompt)
        items = try container.decode([AiTextGenItemsField].self, forKey: .items)
        dialogueHistory = try container.decodeIfPresent([AiTextGenDialogueHistoryField].self, forKey: .dialogueHistory)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(items, forKey: .items)
        try container.encodeIfPresent(dialogueHistory, forKey: .dialogueHistory)
    }

}
