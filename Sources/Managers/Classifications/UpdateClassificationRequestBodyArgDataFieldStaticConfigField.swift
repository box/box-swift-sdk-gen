import Foundation

public class UpdateClassificationRequestBodyArgDataFieldStaticConfigField: Codable {
    private enum CodingKeys: String, CodingKey {
        case classification
    }

    /// Additional details for the classification.
    public let classification: UpdateClassificationRequestBodyArgDataFieldStaticConfigFieldClassificationField?

    /// Initializer for a UpdateClassificationRequestBodyArgDataFieldStaticConfigField.
    ///
    /// - Parameters:
    ///   - classification: Additional details for the classification.
    public init(classification: UpdateClassificationRequestBodyArgDataFieldStaticConfigFieldClassificationField? = nil) {
        self.classification = classification
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        classification = try container.decodeIfPresent(UpdateClassificationRequestBodyArgDataFieldStaticConfigFieldClassificationField.self, forKey: .classification)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(classification, forKey: .classification)
    }

}
