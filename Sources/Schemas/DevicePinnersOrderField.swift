import Foundation

public class DevicePinnersOrderField: Codable {
    private enum CodingKeys: String, CodingKey {
        case by
        case direction
    }

    /// The field that is ordered by,
    public let by: DevicePinnersOrderFieldByField?
    /// The direction to order by, either ascending or descending,
    public let direction: DevicePinnersOrderFieldDirectionField?

    /// Initializer for a DevicePinnersOrderField.
    ///
    /// - Parameters:
    ///   - by: The field that is ordered by
    ///   - direction: The direction to order by, either ascending or descending
    public init(by: DevicePinnersOrderFieldByField? = nil, direction: DevicePinnersOrderFieldDirectionField? = nil) {
        self.by = by
        self.direction = direction
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        by = try container.decodeIfPresent(DevicePinnersOrderFieldByField.self, forKey: .by)
        direction = try container.decodeIfPresent(DevicePinnersOrderFieldDirectionField.self, forKey: .direction)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(by, forKey: .by)
        try container.encodeIfPresent(direction, forKey: .direction)
    }
}
