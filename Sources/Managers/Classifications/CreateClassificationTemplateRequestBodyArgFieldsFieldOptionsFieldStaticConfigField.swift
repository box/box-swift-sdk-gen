import Foundation

public class CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsFieldStaticConfigField: Codable {
    private enum CodingKeys: String, CodingKey {
        case classification
    }

    /// Additional information about the classification.
    public let classification: CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsFieldStaticConfigFieldClassificationField?

    /// Initializer for a CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsFieldStaticConfigField.
    ///
    /// - Parameters:
    ///   - classification: Additional information about the classification.
    public init(classification: CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsFieldStaticConfigFieldClassificationField? = nil) {
        self.classification = classification
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        classification = try container.decodeIfPresent(CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsFieldStaticConfigFieldClassificationField.self, forKey: .classification)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(classification, forKey: .classification)
    }
}
