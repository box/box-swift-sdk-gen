import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case op
        case fieldKey
        case enumOptionKey
    }

    /// The type of change to perform on the classification
    /// object.
    public let op: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArgOpField
    /// Defines classifications 
    /// available in the enterprise.
    public let fieldKey: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArgFieldKeyField
    /// The label of the classification to remove.
    public let enumOptionKey: String

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArg.
    ///
    /// - Parameters:
    ///   - op: The type of change to perform on the classification
    ///     object.
    ///   - fieldKey: Defines classifications 
    ///     available in the enterprise.
    ///   - enumOptionKey: The label of the classification to remove.
    public init(op: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArgOpField, fieldKey: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArgFieldKeyField, enumOptionKey: String) {
        self.op = op
        self.fieldKey = fieldKey
        self.enumOptionKey = enumOptionKey
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        op = try container.decode(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArgOpField.self, forKey: .op)
        fieldKey = try container.decode(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArgFieldKeyField.self, forKey: .fieldKey)
        enumOptionKey = try container.decode(String.self, forKey: .enumOptionKey)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(op, forKey: .op)
        try container.encode(fieldKey, forKey: .fieldKey)
        try container.encode(enumOptionKey, forKey: .enumOptionKey)
    }
}
