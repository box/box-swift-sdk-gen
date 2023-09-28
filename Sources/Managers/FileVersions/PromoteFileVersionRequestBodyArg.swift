import Foundation

public class PromoteFileVersionRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }

    /// The file version ID,
    public let id: String?
    /// The type to promote,
    public let type: PromoteFileVersionRequestBodyArgTypeField?

    /// Initializer for a PromoteFileVersionRequestBodyArg.
    ///
    /// - Parameters:
    ///   - id: The file version ID
    ///   - type: The type to promote
    public init(id: String? = nil, type: PromoteFileVersionRequestBodyArgTypeField? = nil) {
        self.id = id
        self.type = type
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(PromoteFileVersionRequestBodyArgTypeField.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
    }
}
