import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case op
        case fieldKey
        case data
    }

    /// `addEnumOption`,
    public let op: String
    /// `Box__Security__Classification__Key`,
    public let fieldKey: String
    /// The details of the classification to add.,
    public let data: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataField

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArg.
    ///
    /// - Parameters:
    ///   - op: `addEnumOption`
    ///   - fieldKey: `Box__Security__Classification__Key`
    ///   - data: The details of the classification to add.
    public init(op: String, fieldKey: String, data: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataField) {
        self.op = op
        self.fieldKey = fieldKey
        self.data = data
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        op = try container.decode(String.self, forKey: .op)
        fieldKey = try container.decode(String.self, forKey: .fieldKey)
        data = try container.decode(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataField.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(op, forKey: .op)
        try container.encode(fieldKey, forKey: .fieldKey)
        try container.encode(data, forKey: .data)
    }
}
