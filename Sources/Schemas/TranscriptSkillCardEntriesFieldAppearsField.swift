import Foundation

public class TranscriptSkillCardEntriesFieldAppearsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case start
    }

    /// The time in seconds when an
    /// entry should start appearing on a timeline.,
    public let start: Int?

    /// Initializer for a TranscriptSkillCardEntriesFieldAppearsField.
    ///
    /// - Parameters:
    ///   - start: The time in seconds when an
    ///     entry should start appearing on a timeline.
    public init(start: Int? = nil) {
        self.start = start
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        start = try container.decodeIfPresent(Int.self, forKey: .start)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(start, forKey: .start)
    }
}
