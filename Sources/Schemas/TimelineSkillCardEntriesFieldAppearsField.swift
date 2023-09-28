import Foundation

public class TimelineSkillCardEntriesFieldAppearsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case start
        case end
    }

    /// The time in seconds when an
    /// entry should start appearing on a timeline.,
    public let start: Int?
    /// The time in seconds when an
    /// entry should stop appearing on a timeline.,
    public let end: Int?

    /// Initializer for a TimelineSkillCardEntriesFieldAppearsField.
    ///
    /// - Parameters:
    ///   - start: The time in seconds when an
    ///     entry should start appearing on a timeline.
    ///   - end: The time in seconds when an
    ///     entry should stop appearing on a timeline.
    public init(start: Int? = nil, end: Int? = nil) {
        self.start = start
        self.end = end
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        start = try container.decodeIfPresent(Int.self, forKey: .start)
        end = try container.decodeIfPresent(Int.self, forKey: .end)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(start, forKey: .start)
        try container.encodeIfPresent(end, forKey: .end)
    }
}
