import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArgDataField: Codable {
    private enum CodingKeys: String, CodingKey {
        case key
        case classification
    }

    /// A new label for the classification, as it will be
    /// shown in the web and mobile interfaces.
    public let key: String
    /// Additional details for the classification.
    public let classification: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArgDataFieldClassificationField?

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArgDataField.
    ///
    /// - Parameters:
    ///   - key: A new label for the classification, as it will be
    ///     shown in the web and mobile interfaces.
    ///   - classification: Additional details for the classification.
    public init(key: String, classification: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArgDataFieldClassificationField? = nil) {
        self.key = key
        self.classification = classification
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        key = try container.decode(String.self, forKey: .key)
        classification = try container.decodeIfPresent(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArgDataFieldClassificationField.self, forKey: .classification)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        try container.encodeIfPresent(classification, forKey: .classification)
    }
}
