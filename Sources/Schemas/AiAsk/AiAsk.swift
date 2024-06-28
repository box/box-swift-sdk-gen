import Foundation

/// AI Ask request object
public class AiAsk: Codable {
    private enum CodingKeys: String, CodingKey {
        case prompt
        case items
    }

    /// The prompt provided by the client to be answered by the LLM. The prompt's length is limited to 10000 characters.
    public let prompt: String

    /// The items to be processed by the LLM, often files.
    /// 
    /// **Note**: Box AI handles documents with text representations up to 1MB in size, or a maximum of 25 files, whichever comes first.
    /// If the file size exceeds 1MB, the first 1MB of text representation will be processed.
    /// If you set `mode` parameter to `single_item_qa`, the `items` array can have one element only. 
    public let items: [AiAskItemsField]

    /// Initializer for a AiAsk.
    ///
    /// - Parameters:
    ///   - prompt: The prompt provided by the client to be answered by the LLM. The prompt's length is limited to 10000 characters.
    ///   - items: The items to be processed by the LLM, often files.
    ///     
    ///     **Note**: Box AI handles documents with text representations up to 1MB in size, or a maximum of 25 files, whichever comes first.
    ///     If the file size exceeds 1MB, the first 1MB of text representation will be processed.
    ///     If you set `mode` parameter to `single_item_qa`, the `items` array can have one element only. 
    public init(prompt: String, items: [AiAskItemsField]) {
        self.prompt = prompt
        self.items = items
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        prompt = try container.decode(String.self, forKey: .prompt)
        items = try container.decode([AiAskItemsField].self, forKey: .items)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(items, forKey: .items)
    }

}
