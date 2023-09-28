import Foundation

public class TranscriptSkillCardSkillCardTitleField: Codable {
    private enum CodingKeys: String, CodingKey {
        case code
        case message
    }

    /// An optional identifier for the title.,
    public let code: String?
    /// The actual title to show in the UI.,
    public let message: String

    /// Initializer for a TranscriptSkillCardSkillCardTitleField.
    ///
    /// - Parameters:
    ///   - code: An optional identifier for the title.
    ///   - message: The actual title to show in the UI.
    public init(code: String? = nil, message: String) {
        self.code = code
        self.message = message
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code)
        message = try container.decode(String.self, forKey: .message)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encode(message, forKey: .message)
    }
}
