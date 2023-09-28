import Foundation

public class CreateMetadataTemplateSchemaClassificationRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case scope
        case templateKey
        case displayName
        case hidden
        case copyInstanceOnItemCopy
        case fields
    }

    /// The scope in which to create the classifications. This should
    /// be `enterprise` or `enterprise_{id}` where `id` is the unique
    /// ID of the enterprise.,
    public let scope: CreateMetadataTemplateSchemaClassificationRequestBodyArgScopeField
    /// `securityClassification-6VMVochwUWo`,
    public let templateKey: CreateMetadataTemplateSchemaClassificationRequestBodyArgTemplateKeyField?
    /// `Classification`,
    public let displayName: CreateMetadataTemplateSchemaClassificationRequestBodyArgDisplayNameField
    /// `false`,
    public let hidden: Bool?
    /// `false`,
    public let copyInstanceOnItemCopy: Bool?
    /// The classification template holds one field, which holds
    /// all the valid classification values.,
    public let fields: [CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField]?

    /// Initializer for a CreateMetadataTemplateSchemaClassificationRequestBodyArg.
    ///
    /// - Parameters:
    ///   - scope: The scope in which to create the classifications. This should
    ///     be `enterprise` or `enterprise_{id}` where `id` is the unique
    ///     ID of the enterprise.
    ///   - templateKey: `securityClassification-6VMVochwUWo`
    ///   - displayName: `Classification`
    ///   - hidden: `false`
    ///   - copyInstanceOnItemCopy: `false`
    ///   - fields: The classification template holds one field, which holds
    ///     all the valid classification values.
    public init(scope: CreateMetadataTemplateSchemaClassificationRequestBodyArgScopeField, templateKey: CreateMetadataTemplateSchemaClassificationRequestBodyArgTemplateKeyField? = nil, displayName: CreateMetadataTemplateSchemaClassificationRequestBodyArgDisplayNameField, hidden: Bool? = nil, copyInstanceOnItemCopy: Bool? = nil, fields: [CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField]? = nil) {
        self.scope = scope
        self.templateKey = templateKey
        self.displayName = displayName
        self.hidden = hidden
        self.copyInstanceOnItemCopy = copyInstanceOnItemCopy
        self.fields = fields
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        scope = try container.decode(CreateMetadataTemplateSchemaClassificationRequestBodyArgScopeField.self, forKey: .scope)
        templateKey = try container.decodeIfPresent(CreateMetadataTemplateSchemaClassificationRequestBodyArgTemplateKeyField.self, forKey: .templateKey)
        displayName = try container.decode(CreateMetadataTemplateSchemaClassificationRequestBodyArgDisplayNameField.self, forKey: .displayName)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
        copyInstanceOnItemCopy = try container.decodeIfPresent(Bool.self, forKey: .copyInstanceOnItemCopy)
        fields = try container.decodeIfPresent([CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField].self, forKey: .fields)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(scope, forKey: .scope)
        try container.encodeIfPresent(templateKey, forKey: .templateKey)
        try container.encode(displayName, forKey: .displayName)
        try container.encodeIfPresent(hidden, forKey: .hidden)
        try container.encodeIfPresent(copyInstanceOnItemCopy, forKey: .copyInstanceOnItemCopy)
        try container.encodeIfPresent(fields, forKey: .fields)
    }
}
