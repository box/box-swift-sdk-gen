import Foundation

public class UpdateSkillInvocationByIdRequestBodyArgUsageField: Codable {
    private enum CodingKeys: String, CodingKey {
        case unit
        case value
    }

    /// `file`,
    public let unit: String?
    /// `1`,
    public let value: Int?

    /// Initializer for a UpdateSkillInvocationByIdRequestBodyArgUsageField.
    ///
    /// - Parameters:
    ///   - unit: `file`
    ///   - value: `1`
    public init(unit: String? = nil, value: Int? = nil) {
        self.unit = unit
        self.value = value
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        unit = try container.decodeIfPresent(String.self, forKey: .unit)
        value = try container.decodeIfPresent(Int.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(unit, forKey: .unit)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
