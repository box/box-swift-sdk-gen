import Foundation

public class SignRequestSignerInput: SignRequestPrefillTag {
    private enum CodingKeys: String, CodingKey {
        case type
        case contentType = "content_type"
        case pageIndex = "page_index"
    }

    /// Type of input,
    public let type: SignRequestSignerInputTypeField?
    /// Content type of input,
    public let contentType: SignRequestSignerInputContentTypeField?
    /// Index of page that the input is on,
    public let pageIndex: Int

    /// Initializer for a SignRequestSignerInput.
    ///
    /// - Parameters:
    ///   - documentTagId: This references the ID of a specific tag contained in a file of the sign request.
    ///   - textValue: Text prefill value
    ///   - checkboxValue: Checkbox prefill value
    ///   - dateValue: Date prefill value
    ///   - type: Type of input
    ///   - contentType: Content type of input
    ///   - pageIndex: Index of page that the input is on
    public init(documentTagId: String? = nil, textValue: String? = nil, checkboxValue: Bool? = nil, dateValue: String? = nil, type: SignRequestSignerInputTypeField? = nil, contentType: SignRequestSignerInputContentTypeField? = nil, pageIndex: Int) {
        self.type = type
        self.contentType = contentType
        self.pageIndex = pageIndex
        super.init(documentTagId: documentTagId, textValue: textValue, checkboxValue: checkboxValue, dateValue: dateValue)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(SignRequestSignerInputTypeField.self, forKey: .type)
        contentType = try container.decodeIfPresent(SignRequestSignerInputContentTypeField.self, forKey: .contentType)
        pageIndex = try container.decode(Int.self, forKey: .pageIndex)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(contentType, forKey: .contentType)
        try container.encode(pageIndex, forKey: .pageIndex)
        try super.encode(to: encoder)
    }
}
