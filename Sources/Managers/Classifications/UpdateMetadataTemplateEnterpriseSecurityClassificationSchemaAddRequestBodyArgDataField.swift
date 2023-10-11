import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataField: Codable {
    private enum CodingKeys: String, CodingKey {
        case key
        case classification
    }

    /// The label of the classification as shown in the web and
    /// mobile interfaces. This is the only field required to
    /// add a classification.
    public let key: String
    /// Additional details for the classification.
    public let classification: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataFieldClassificationField?

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataField.
    ///
    /// - Parameters:
    ///   - key: The label of the classification as shown in the web and
    ///     mobile interfaces. This is the only field required to
    ///     add a classification.
    ///   - classification: Additional details for the classification.
    public init(key: String, classification: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataFieldClassificationField? = nil) {
        self.key = key
        self.classification = classification
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        key = try container.decode(String.self, forKey: .key)
        classification = try container.decodeIfPresent(UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArgDataFieldClassificationField.self, forKey: .classification)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        try container.encodeIfPresent(classification, forKey: .classification)
    }
}
