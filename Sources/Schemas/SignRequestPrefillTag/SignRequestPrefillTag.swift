import Foundation

/// Prefill tags are used to prefill placeholders with signer input data. Only
/// one value field can be included.
public class SignRequestPrefillTag: Codable {
    private enum CodingKeys: String, CodingKey {
        case documentTagId = "document_tag_id"
        case textValue = "text_value"
        case checkboxValue = "checkbox_value"
        case dateValue = "date_value"
    }

    /// This references the ID of a specific tag contained in a file of the signature request.
    public let documentTagId: String?

    /// Text prefill value
    public let textValue: String?

    /// Checkbox prefill value
    public let checkboxValue: Bool?

    /// Date prefill value
    public let dateValue: Date?

    /// Initializer for a SignRequestPrefillTag.
    ///
    /// - Parameters:
    ///   - documentTagId: This references the ID of a specific tag contained in a file of the signature request.
    ///   - textValue: Text prefill value
    ///   - checkboxValue: Checkbox prefill value
    ///   - dateValue: Date prefill value
    public init(documentTagId: String? = nil, textValue: String? = nil, checkboxValue: Bool? = nil, dateValue: Date? = nil) {
        self.documentTagId = documentTagId
        self.textValue = textValue
        self.checkboxValue = checkboxValue
        self.dateValue = dateValue
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        documentTagId = try container.decodeIfPresent(String.self, forKey: .documentTagId)
        textValue = try container.decodeIfPresent(String.self, forKey: .textValue)
        checkboxValue = try container.decodeIfPresent(Bool.self, forKey: .checkboxValue)
        if let _dateValue = try container.decodeIfPresent(String.self, forKey: .dateValue) {
            dateValue = try Utils.Dates.dateFromString(date: _dateValue)
        } else {
            dateValue = nil
        }

    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(documentTagId, forKey: .documentTagId)
        try container.encodeIfPresent(textValue, forKey: .textValue)
        try container.encodeIfPresent(checkboxValue, forKey: .checkboxValue)
        if let dateValue = dateValue {
            try container.encode(Utils.Dates.dateToString(date: dateValue), forKey: .dateValue)
        }

    }

}
