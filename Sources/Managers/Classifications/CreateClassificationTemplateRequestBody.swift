import Foundation

public class CreateClassificationTemplateRequestBody: Codable {
    private enum CodingKeys: String, CodingKey {
        case scope
        case templateKey
        case displayName
        case fields
        case hidden
        case copyInstanceOnItemCopy
    }

    /// The scope in which to create the classifications. This should
    /// be `enterprise` or `enterprise_{id}` where `id` is the unique
    /// ID of the enterprise.
    public let scope: CreateClassificationTemplateRequestBodyScopeField

    /// Defines the list of metadata templates.
    public let templateKey: CreateClassificationTemplateRequestBodyTemplateKeyField

    /// The name of the
    /// template as shown in web and mobile interfaces.
    public let displayName: CreateClassificationTemplateRequestBodyDisplayNameField

    /// The classification template requires exactly
    /// one field, which holds
    /// all the valid classification values.
    public let fields: [CreateClassificationTemplateRequestBodyFieldsField]

    /// Determines if the classification template is
    /// hidden or available on web and mobile
    /// devices.
    public let hidden: Bool?

    /// Determines if classifications are
    /// copied along when the file or folder is
    /// copied.
    public let copyInstanceOnItemCopy: Bool?

    /// Initializer for a CreateClassificationTemplateRequestBody.
    ///
    /// - Parameters:
    ///   - scope: The scope in which to create the classifications. This should
    ///     be `enterprise` or `enterprise_{id}` where `id` is the unique
    ///     ID of the enterprise.
    ///   - templateKey: Defines the list of metadata templates.
    ///   - displayName: The name of the
    ///     template as shown in web and mobile interfaces.
    ///   - fields: The classification template requires exactly
    ///     one field, which holds
    ///     all the valid classification values.
    ///   - hidden: Determines if the classification template is
    ///     hidden or available on web and mobile
    ///     devices.
    ///   - copyInstanceOnItemCopy: Determines if classifications are
    ///     copied along when the file or folder is
    ///     copied.
    public init(scope: CreateClassificationTemplateRequestBodyScopeField, templateKey: CreateClassificationTemplateRequestBodyTemplateKeyField, displayName: CreateClassificationTemplateRequestBodyDisplayNameField, fields: [CreateClassificationTemplateRequestBodyFieldsField], hidden: Bool? = nil, copyInstanceOnItemCopy: Bool? = nil) {
        self.scope = scope
        self.templateKey = templateKey
        self.displayName = displayName
        self.fields = fields
        self.hidden = hidden
        self.copyInstanceOnItemCopy = copyInstanceOnItemCopy
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        scope = try container.decode(CreateClassificationTemplateRequestBodyScopeField.self, forKey: .scope)
        templateKey = try container.decode(CreateClassificationTemplateRequestBodyTemplateKeyField.self, forKey: .templateKey)
        displayName = try container.decode(CreateClassificationTemplateRequestBodyDisplayNameField.self, forKey: .displayName)
        fields = try container.decode([CreateClassificationTemplateRequestBodyFieldsField].self, forKey: .fields)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
        copyInstanceOnItemCopy = try container.decodeIfPresent(Bool.self, forKey: .copyInstanceOnItemCopy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(scope, forKey: .scope)
        try container.encode(templateKey, forKey: .templateKey)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(fields, forKey: .fields)
        try container.encodeIfPresent(hidden, forKey: .hidden)
        try container.encodeIfPresent(copyInstanceOnItemCopy, forKey: .copyInstanceOnItemCopy)
    }

}
