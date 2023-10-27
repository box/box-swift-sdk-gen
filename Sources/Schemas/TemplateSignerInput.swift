import Foundation

/// Input created by a Signer on a Template
public class TemplateSignerInput: SignRequestPrefillTag {
    private enum CodingKeys: String, CodingKey {
        case pageIndex = "page_index"
        case type
        case contentType = "content_type"
        case isRequired = "is_required"
        case documentId = "document_id"
        case dropdownChoices = "dropdown_choices"
        case groupId = "group_id"
        case coordinates
        case dimensions
        case label
    }

    /// Index of page that the input is on.
    public let pageIndex: Int64
    /// Type of input
    public let type: TemplateSignerInputTypeField?
    /// Content type of input
    public let contentType: TemplateSignerInputContentTypeField?
    /// Whether or not the input is required.
    public let isRequired: Bool?
    /// Document identifier.
    public let documentId: String?
    /// When the input is of the type `dropdown` this values will be filled with all the dropdown options.
    public let dropdownChoices: [String]?
    /// When the input is of type `radio` they can be grouped to gather with this identifier.
    public let groupId: String?
    /// Where the input is located on a page.
    public let coordinates: TemplateSignerInputCoordinatesField?
    /// The size of the input.
    public let dimensions: TemplateSignerInputDimensionsField?
    /// The label field is used especially for text, attachment, radio, and checkbox type inputs.
    public let label: String?

    /// Initializer for a TemplateSignerInput.
    ///
    /// - Parameters:
    ///   - pageIndex: Index of page that the input is on.
    ///   - documentTagId: This references the ID of a specific tag contained in a file of the sign request.
    ///   - textValue: Text prefill value
    ///   - checkboxValue: Checkbox prefill value
    ///   - dateValue: Date prefill value
    ///   - type: Type of input
    ///   - contentType: Content type of input
    ///   - isRequired: Whether or not the input is required.
    ///   - documentId: Document identifier.
    ///   - dropdownChoices: When the input is of the type `dropdown` this values will be filled with all the dropdown options.
    ///   - groupId: When the input is of type `radio` they can be grouped to gather with this identifier.
    ///   - coordinates: Where the input is located on a page.
    ///   - dimensions: The size of the input.
    ///   - label: The label field is used especially for text, attachment, radio, and checkbox type inputs.
    public init(pageIndex: Int64, documentTagId: String? = nil, textValue: String? = nil, checkboxValue: Bool? = nil, dateValue: String? = nil, type: TemplateSignerInputTypeField? = nil, contentType: TemplateSignerInputContentTypeField? = nil, isRequired: Bool? = nil, documentId: String? = nil, dropdownChoices: [String]? = nil, groupId: String? = nil, coordinates: TemplateSignerInputCoordinatesField? = nil, dimensions: TemplateSignerInputDimensionsField? = nil, label: String? = nil) {
        self.pageIndex = pageIndex
        self.type = type
        self.contentType = contentType
        self.isRequired = isRequired
        self.documentId = documentId
        self.dropdownChoices = dropdownChoices
        self.groupId = groupId
        self.coordinates = coordinates
        self.dimensions = dimensions
        self.label = label
        super.init(documentTagId: documentTagId, textValue: textValue, checkboxValue: checkboxValue, dateValue: dateValue)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pageIndex = try container.decode(Int64.self, forKey: .pageIndex)
        type = try container.decodeIfPresent(TemplateSignerInputTypeField.self, forKey: .type)
        contentType = try container.decodeIfPresent(TemplateSignerInputContentTypeField.self, forKey: .contentType)
        isRequired = try container.decodeIfPresent(Bool.self, forKey: .isRequired)
        documentId = try container.decodeIfPresent(String.self, forKey: .documentId)
        dropdownChoices = try container.decodeIfPresent([String].self, forKey: .dropdownChoices)
        groupId = try container.decodeIfPresent(String.self, forKey: .groupId)
        coordinates = try container.decodeIfPresent(TemplateSignerInputCoordinatesField.self, forKey: .coordinates)
        dimensions = try container.decodeIfPresent(TemplateSignerInputDimensionsField.self, forKey: .dimensions)
        label = try container.decodeIfPresent(String.self, forKey: .label)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(pageIndex, forKey: .pageIndex)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(contentType, forKey: .contentType)
        try container.encodeIfPresent(isRequired, forKey: .isRequired)
        try container.encodeIfPresent(documentId, forKey: .documentId)
        try container.encodeIfPresent(dropdownChoices, forKey: .dropdownChoices)
        try container.encodeIfPresent(groupId, forKey: .groupId)
        try container.encodeIfPresent(coordinates, forKey: .coordinates)
        try container.encodeIfPresent(dimensions, forKey: .dimensions)
        try container.encodeIfPresent(label, forKey: .label)
        try super.encode(to: encoder)
    }
}
