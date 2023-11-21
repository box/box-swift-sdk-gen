import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case op
        case fieldKey
        case data
    }

    /// The type of change to perform on the classification
    /// object.
    public let op: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgOpField
    /// Defines classifications 
    /// available in the enterprise.
    public let fieldKey: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgFieldKeyField
    /// The details of the classification to add.
    public let data: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataField

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArg.
    ///
    /// - Parameters:
    ///   - op: The type of change to perform on the classification
    ///     object.
    ///   - fieldKey: Defines classifications 
    ///     available in the enterprise.
    ///   - data: The details of the classification to add.
    public init(op: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgOpField, fieldKey: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgFieldKeyField, data: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataField) {
        self.op = op
        self.fieldKey = fieldKey
        self.data = data
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        op = try container.decode(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgOpField.self, forKey: .op)
        fieldKey = try container.decode(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgFieldKeyField.self, forKey: .fieldKey)
        data = try container.decode(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataField.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(op, forKey: .op)
        try container.encode(fieldKey, forKey: .fieldKey)
        try container.encode(data, forKey: .data)
    }
}
