import Foundation

/// A metadata template that holds the security classifications
/// defined by an enterprise.
public class ClassificationTemplate: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
        case scope
        case templateKey
        case displayName
        case hidden
        case copyInstanceOnItemCopy
        case fields
    }

    /// `metadata_template`
    public let type: ClassificationTemplateTypeField
    /// The ID of the classification template.
    public let id: String?
    /// The scope of the classification template. This is in the format
    /// `enterprise_{id}` where the `id` is the enterprise ID.
    public let scope: String?
    /// `securityClassification-6VMVochwUWo`
    public let templateKey: ClassificationTemplateTemplateKeyField?
    /// The name of this template as shown in web and mobile interfaces.
    public let displayName: ClassificationTemplateDisplayNameField?
    /// This template is always available in web and mobile interfaces.
    public let hidden: Bool?
    /// Classifications are always copied along when the file or folder is
    /// copied.
    public let copyInstanceOnItemCopy: Bool?
    /// A list of fields for this classification template. This includes
    /// only one field, the `Box__Security__Classification__Key`, which defines
    /// the different classifications available in this enterprise.
    public let fields: [ClassificationTemplateFieldsField]?

    /// Initializer for a ClassificationTemplate.
    ///
    /// - Parameters:
    ///   - type: `metadata_template`
    ///   - id: The ID of the classification template.
    ///   - scope: The scope of the classification template. This is in the format
    ///     `enterprise_{id}` where the `id` is the enterprise ID.
    ///   - templateKey: `securityClassification-6VMVochwUWo`
    ///   - displayName: The name of this template as shown in web and mobile interfaces.
    ///   - hidden: This template is always available in web and mobile interfaces.
    ///   - copyInstanceOnItemCopy: Classifications are always copied along when the file or folder is
    ///     copied.
    ///   - fields: A list of fields for this classification template. This includes
    ///     only one field, the `Box__Security__Classification__Key`, which defines
    ///     the different classifications available in this enterprise.
    public init(type: ClassificationTemplateTypeField, id: String? = nil, scope: String? = nil, templateKey: ClassificationTemplateTemplateKeyField? = nil, displayName: ClassificationTemplateDisplayNameField? = nil, hidden: Bool? = nil, copyInstanceOnItemCopy: Bool? = nil, fields: [ClassificationTemplateFieldsField]? = nil) {
        self.type = type
        self.id = id
        self.scope = scope
        self.templateKey = templateKey
        self.displayName = displayName
        self.hidden = hidden
        self.copyInstanceOnItemCopy = copyInstanceOnItemCopy
        self.fields = fields
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(ClassificationTemplateTypeField.self, forKey: .type)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        scope = try container.decodeIfPresent(String.self, forKey: .scope)
        templateKey = try container.decodeIfPresent(ClassificationTemplateTemplateKeyField.self, forKey: .templateKey)
        displayName = try container.decodeIfPresent(ClassificationTemplateDisplayNameField.self, forKey: .displayName)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
        copyInstanceOnItemCopy = try container.decodeIfPresent(Bool.self, forKey: .copyInstanceOnItemCopy)
        fields = try container.decodeIfPresent([ClassificationTemplateFieldsField].self, forKey: .fields)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(scope, forKey: .scope)
        try container.encodeIfPresent(templateKey, forKey: .templateKey)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(hidden, forKey: .hidden)
        try container.encodeIfPresent(copyInstanceOnItemCopy, forKey: .copyInstanceOnItemCopy)
        try container.encodeIfPresent(fields, forKey: .fields)
    }
}
