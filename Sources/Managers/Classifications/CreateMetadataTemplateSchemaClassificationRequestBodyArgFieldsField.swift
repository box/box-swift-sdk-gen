import Foundation

public class CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case key
        case displayName
        case options
        case hidden
    }

    /// The type of the field
    /// that is always enum.
    public let type: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldTypeField
    /// Defines classifications 
    /// available in the enterprise.
    public let key: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldKeyField
    /// A display name for the classification.
    public let displayName: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldDisplayNameField
    /// The actual list of classifications that are present on
    /// this template.
    public let options: [CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsField]
    /// Determines if the classification
    /// template is
    /// hidden or available on
    /// web and mobile
    /// devices.
    public let hidden: Bool?

    /// Initializer for a CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField.
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
    public init(type: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldTypeField, key: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldKeyField, displayName: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldDisplayNameField, options: [CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsField], hidden: Bool? = nil) {
        self.type = type
        self.key = key
        self.displayName = displayName
        self.options = options
        self.hidden = hidden
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldTypeField.self, forKey: .type)
        key = try container.decode(CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldKeyField.self, forKey: .key)
        displayName = try container.decode(CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldDisplayNameField.self, forKey: .displayName)
        options = try container.decode([CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsField].self, forKey: .options)
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
