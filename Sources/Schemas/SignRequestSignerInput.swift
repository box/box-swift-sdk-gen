import Foundation

/// Input created by a Signer on a Sign Request
public class SignRequestSignerInput: SignRequestPrefillTag {
    private enum CodingKeys: String, CodingKey {
        case pageIndex = "page_index"
        case type
        case contentType = "content_type"
    }

    /// Index of page that the input is on
    public let pageIndex: Int64

    /// Type of input
    public let type: SignRequestSignerInputTypeField?

    /// Content type of input
    public let contentType: SignRequestSignerInputContentTypeField?

    /// Initializer for a SignRequestSignerInput.
    ///
    /// - Parameters:
    ///   - pageIndex: Index of page that the input is on
    ///   - documentTagId: This references the ID of a specific tag contained in a file of the sign request.
    ///   - textValue: Text prefill value
    ///   - checkboxValue: Checkbox prefill value
    ///   - dateValue: Date prefill value
    ///   - type: Type of input
    ///   - contentType: Content type of input
    public init(pageIndex: Int64, documentTagId: String? = nil, textValue: String? = nil, checkboxValue: Bool? = nil, dateValue: String? = nil, type: SignRequestSignerInputTypeField? = nil, contentType: SignRequestSignerInputContentTypeField? = nil) {
        self.pageIndex = pageIndex
        self.type = type
        self.contentType = contentType

        super.init(documentTagId: documentTagId, textValue: textValue, checkboxValue: checkboxValue, dateValue: dateValue)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pageIndex = try container.decode(Int64.self, forKey: .pageIndex)
        type = try container.decodeIfPresent(SignRequestSignerInputTypeField.self, forKey: .type)
        contentType = try container.decodeIfPresent(SignRequestSignerInputContentTypeField.self, forKey: .contentType)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(pageIndex, forKey: .pageIndex)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(contentType, forKey: .contentType)
        try super.encode(to: encoder)
    }

}
