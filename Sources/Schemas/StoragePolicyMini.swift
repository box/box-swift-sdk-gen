import Foundation

/// A mini description of a Storage Policy object
public class StoragePolicyMini: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
    }

    /// The unique identifier for this storage policy
    public let id: String?

    /// `storage_policy`
    public let type: StoragePolicyMiniTypeField?

    /// Initializer for a StoragePolicyMini.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this storage policy
    ///   - type: `storage_policy`
    public init(id: String? = nil, type: StoragePolicyMiniTypeField? = nil) {
        self.id = id
        self.type = type
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(StoragePolicyMiniTypeField.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
    }

}
