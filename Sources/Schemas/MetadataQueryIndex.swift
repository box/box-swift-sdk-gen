import Foundation

public class MetadataQueryIndex: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case status
        case fields
    }

    /// The ID of the metadata query index.,
    public let id: String?
    /// Value is always `metadata_query_index`,
    public let type: String
    /// The status of the metadata query index,
    public let status: MetadataQueryIndexStatusField
    /// A list of template fields which make up the index.,
    public let fields: [MetadataQueryIndexFieldsField]?

    /// Initializer for a MetadataQueryIndex.
    ///
    /// - Parameters:
    ///   - id: The ID of the metadata query index.
    ///   - type: Value is always `metadata_query_index`
    ///   - status: The status of the metadata query index
    ///   - fields: A list of template fields which make up the index.
    public init(id: String? = nil, type: String, status: MetadataQueryIndexStatusField, fields: [MetadataQueryIndexFieldsField]? = nil) {
        self.id = id
        self.type = type
        self.status = status
        self.fields = fields
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decode(String.self, forKey: .type)
        status = try container.decode(MetadataQueryIndexStatusField.self, forKey: .status)
        fields = try container.decodeIfPresent([MetadataQueryIndexFieldsField].self, forKey: .fields)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(status, forKey: .status)
        try container.encodeIfPresent(fields, forKey: .fields)
    }
}
