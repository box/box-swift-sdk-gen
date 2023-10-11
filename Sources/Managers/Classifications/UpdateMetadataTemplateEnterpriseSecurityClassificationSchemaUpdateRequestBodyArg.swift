import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case op
        case fieldKey
        case enumOptionKey
        case data
    }

    /// `editEnumOption`
    public let op: String
    /// `Box__Security__Classification__Key`
    public let fieldKey: String
    /// The original label of the classification to change.
    public let enumOptionKey: String
    /// The details of the updated classification.
    public let data: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArgDataField

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArg.
    ///
    /// - Parameters:
    ///   - op: `editEnumOption`
    ///   - fieldKey: `Box__Security__Classification__Key`
    ///   - enumOptionKey: The original label of the classification to change.
    ///   - data: The details of the updated classification.
    public init(op: String, fieldKey: String, enumOptionKey: String, data: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArgDataField) {
        self.op = op
        self.fieldKey = fieldKey
        self.enumOptionKey = enumOptionKey
        self.data = data
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        op = try container.decode(String.self, forKey: .op)
        fieldKey = try container.decode(String.self, forKey: .fieldKey)
        enumOptionKey = try container.decode(String.self, forKey: .enumOptionKey)
        data = try container.decode(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArgDataField.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(op, forKey: .op)
        try container.encode(fieldKey, forKey: .fieldKey)
        try container.encode(enumOptionKey, forKey: .enumOptionKey)
        try container.encode(data, forKey: .data)
    }
}
