import Foundation

public class MetadataCascadePolicyParentField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
    }

    /// `folder`
    public let type: MetadataCascadePolicyParentFieldTypeField?
    /// The ID of the folder the policy is applied to.
    public let id: String?

    /// Initializer for a MetadataCascadePolicyParentField.
    ///
    /// - Parameters:
    ///   - type: `folder`
    ///   - id: The ID of the folder the policy is applied to.
    public init(type: MetadataCascadePolicyParentFieldTypeField? = nil, id: String? = nil) {
        self.type = type
        self.id = id
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(MetadataCascadePolicyParentFieldTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
    }
}
