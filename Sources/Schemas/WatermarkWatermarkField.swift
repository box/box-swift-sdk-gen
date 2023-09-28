import Foundation

public class WatermarkWatermarkField: Codable {
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
    }

    /// When this watermark was created,
    public let createdAt: String?
    /// When this task was modified,
    public let modifiedAt: String?

    /// Initializer for a WatermarkWatermarkField.
    ///
    /// - Parameters:
    ///   - createdAt: When this watermark was created
    ///   - modifiedAt: When this task was modified
    public init(createdAt: String? = nil, modifiedAt: String? = nil) {
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
    }
}
