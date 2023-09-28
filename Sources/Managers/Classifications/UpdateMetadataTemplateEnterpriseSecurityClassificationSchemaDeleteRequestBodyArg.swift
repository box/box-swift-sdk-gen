import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case op
        case fieldKey
        case enumOptionKey
    }

    /// `removeEnumOption`,
    public let op: String
    /// `Box__Security__Classification__Key`,
    public let fieldKey: String
    /// The label of the classification to remove.,
    public let enumOptionKey: String

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArg.
    ///
    /// - Parameters:
    ///   - op: `removeEnumOption`
    ///   - fieldKey: `Box__Security__Classification__Key`
    ///   - enumOptionKey: The label of the classification to remove.
    public init(op: String, fieldKey: String, enumOptionKey: String) {
        self.op = op
        self.fieldKey = fieldKey
        self.enumOptionKey = enumOptionKey
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        op = try container.decode(String.self, forKey: .op)
        fieldKey = try container.decode(String.self, forKey: .fieldKey)
        enumOptionKey = try container.decode(String.self, forKey: .enumOptionKey)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(op, forKey: .op)
        try container.encode(fieldKey, forKey: .fieldKey)
        try container.encode(enumOptionKey, forKey: .enumOptionKey)
    }
}
