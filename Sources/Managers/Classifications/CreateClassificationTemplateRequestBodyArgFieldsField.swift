import Foundation

public class CreateClassificationTemplateRequestBodyArgFieldsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case key
        case displayName
        case options
        case hidden
    }

    /// The type of the field
    /// that is always enum.
    public let type: CreateClassificationTemplateRequestBodyArgFieldsFieldTypeField
    /// Defines classifications 
    /// available in the enterprise.
    public let key: CreateClassificationTemplateRequestBodyArgFieldsFieldKeyField
    /// A display name for the classification.
    public let displayName: CreateClassificationTemplateRequestBodyArgFieldsFieldDisplayNameField
    /// The actual list of classifications that are present on
    /// this template.
    public let options: [CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsField]
    /// Determines if the classification
    /// template is
    /// hidden or available on
    /// web and mobile
    /// devices.
    public let hidden: Bool?

    /// Initializer for a CreateClassificationTemplateRequestBodyArgFieldsField.
    ///
    /// - Parameters:
    ///   - type: The type of the field
    ///     that is always enum.
    ///   - key: Defines classifications 
    ///     available in the enterprise.
    ///   - displayName: A display name for the classification.
    ///   - options: The actual list of classifications that are present on
    ///     this template.
    ///   - hidden: Determines if the classification
    ///     template is
    ///     hidden or available on
    ///     web and mobile
    ///     devices.
    public init(type: CreateClassificationTemplateRequestBodyArgFieldsFieldTypeField, key: CreateClassificationTemplateRequestBodyArgFieldsFieldKeyField, displayName: CreateClassificationTemplateRequestBodyArgFieldsFieldDisplayNameField, options: [CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsField], hidden: Bool? = nil) {
        self.type = type
        self.key = key
        self.displayName = displayName
        self.options = options
        self.hidden = hidden
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateClassificationTemplateRequestBodyArgFieldsFieldTypeField.self, forKey: .type)
        key = try container.decode(CreateClassificationTemplateRequestBodyArgFieldsFieldKeyField.self, forKey: .key)
        displayName = try container.decode(CreateClassificationTemplateRequestBodyArgFieldsFieldDisplayNameField.self, forKey: .displayName)
        options = try container.decode([CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsField].self, forKey: .options)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(key, forKey: .key)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(options, forKey: .options)
        try container.encodeIfPresent(hidden, forKey: .hidden)
    }
}
