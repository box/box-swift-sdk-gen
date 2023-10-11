import Foundation

public class SignTemplateAdditionalInfoField: Codable {
    private enum CodingKeys: String, CodingKey {
        case nonEditable = "non_editable"
        case required
    }

    /// Non editable fields.
    public let nonEditable: [SignTemplateAdditionalInfoFieldNonEditableField]?
    /// Required fields.
    public let required: SignTemplateAdditionalInfoFieldRequiredField?

    /// Initializer for a SignTemplateAdditionalInfoField.
    ///
    /// - Parameters:
    ///   - nonEditable: Non editable fields.
    ///   - required: Required fields.
    public init(nonEditable: [SignTemplateAdditionalInfoFieldNonEditableField]? = nil, required: SignTemplateAdditionalInfoFieldRequiredField? = nil) {
        self.nonEditable = nonEditable
        self.required = required
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nonEditable = try container.decodeIfPresent([SignTemplateAdditionalInfoFieldNonEditableField].self, forKey: .nonEditable)
        required = try container.decodeIfPresent(SignTemplateAdditionalInfoFieldRequiredField.self, forKey: .required)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(nonEditable, forKey: .nonEditable)
        try container.encodeIfPresent(required, forKey: .required)
    }
}
