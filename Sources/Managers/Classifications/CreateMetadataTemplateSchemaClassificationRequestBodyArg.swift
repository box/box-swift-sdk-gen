import Foundation

public class CreateMetadataTemplateSchemaClassificationRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case scope
        case displayName
        case templateKey
        case hidden
        case copyInstanceOnItemCopy
        case fields
    }

    /// The scope in which to create the classifications. This should
    /// be `enterprise` or `enterprise_{id}` where `id` is the unique
    /// ID of the enterprise.
    public let scope: CreateMetadataTemplateSchemaClassificationRequestBodyArgScopeField
    /// `Classification`
    public let displayName: CreateMetadataTemplateSchemaClassificationRequestBodyArgDisplayNameField
    /// `securityClassification-6VMVochwUWo`
    public let templateKey: CreateMetadataTemplateSchemaClassificationRequestBodyArgTemplateKeyField?
    /// `false`
    public let hidden: Bool?
    /// `false`
    public let copyInstanceOnItemCopy: Bool?
    /// The classification template holds one field, which holds
    /// all the valid classification values.
    public let fields: [CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField]?

    /// Initializer for a CreateMetadataTemplateSchemaClassificationRequestBodyArg.
    ///
    /// - Parameters:
    ///   - scope: The scope in which to create the classifications. This should
    ///     be `enterprise` or `enterprise_{id}` where `id` is the unique
    ///     ID of the enterprise.
    ///   - displayName: `Classification`
    ///   - templateKey: `securityClassification-6VMVochwUWo`
    ///   - hidden: `false`
    ///   - copyInstanceOnItemCopy: `false`
    ///   - fields: The classification template holds one field, which holds
    ///     all the valid classification values.
    public init(scope: CreateMetadataTemplateSchemaClassificationRequestBodyArgScopeField, displayName: CreateMetadataTemplateSchemaClassificationRequestBodyArgDisplayNameField, templateKey: CreateMetadataTemplateSchemaClassificationRequestBodyArgTemplateKeyField? = nil, hidden: Bool? = nil, copyInstanceOnItemCopy: Bool? = nil, fields: [CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField]? = nil) {
        self.scope = scope
        self.displayName = displayName
        self.templateKey = templateKey
        self.hidden = hidden
        self.copyInstanceOnItemCopy = copyInstanceOnItemCopy
        self.fields = fields
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        scope = try container.decode(CreateMetadataTemplateSchemaClassificationRequestBodyArgScopeField.self, forKey: .scope)
        displayName = try container.decode(CreateMetadataTemplateSchemaClassificationRequestBodyArgDisplayNameField.self, forKey: .displayName)
        templateKey = try container.decodeIfPresent(CreateMetadataTemplateSchemaClassificationRequestBodyArgTemplateKeyField.self, forKey: .templateKey)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
        copyInstanceOnItemCopy = try container.decodeIfPresent(Bool.self, forKey: .copyInstanceOnItemCopy)
        fields = try container.decodeIfPresent([CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsField].self, forKey: .fields)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(scope, forKey: .scope)
        try container.encode(displayName, forKey: .displayName)
        try container.encodeIfPresent(templateKey, forKey: .templateKey)
        try container.encodeIfPresent(hidden, forKey: .hidden)
        try container.encodeIfPresent(copyInstanceOnItemCopy, forKey: .copyInstanceOnItemCopy)
        try container.encodeIfPresent(fields, forKey: .fields)
    }
}
