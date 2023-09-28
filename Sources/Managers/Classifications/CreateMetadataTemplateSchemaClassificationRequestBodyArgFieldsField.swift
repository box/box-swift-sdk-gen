import Foundation

public class CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case key
        case displayName
        case hidden
        case options
    }

    /// `enum`,
    public let type: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldTypeField?
    /// `Box__Security__Classification__Key`,
    public let key: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldKeyField?
    /// `Classification`,
    public let displayName: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldDisplayNameField?
    /// `false`,
    public let hidden: Bool?
    /// The actual list of classifications that are present on
    /// this template.,
    public let options: [CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsField]?

    /// Initializer for a CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField.
    ///
    /// - Parameters:
    ///   - type: `enum`
    ///   - key: `Box__Security__Classification__Key`
    ///   - displayName: `Classification`
    ///   - hidden: `false`
    ///   - options: The actual list of classifications that are present on
    ///     this template.
    public init(type: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldTypeField? = nil, key: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldKeyField? = nil, displayName: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldDisplayNameField? = nil, hidden: Bool? = nil, options: [CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsField]? = nil) {
        self.type = type
        self.key = key
        self.displayName = displayName
        self.hidden = hidden
        self.options = options
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldTypeField.self, forKey: .type)
        key = try container.decodeIfPresent(CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldKeyField.self, forKey: .key)
        displayName = try container.decodeIfPresent(CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldDisplayNameField.self, forKey: .displayName)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
        options = try container.decodeIfPresent([CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsField].self, forKey: .options)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(key, forKey: .key)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(hidden, forKey: .hidden)
        try container.encodeIfPresent(options, forKey: .options)
    }
}
