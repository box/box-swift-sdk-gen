import Foundation

public class CreateMetadataTemplateSchemaRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case scope
        case templateKey
        case displayName
        case hidden
        case fields
        case copyInstanceOnItemCopy
    }

    /// The scope of the metadata template to create. Applications can
    /// only create templates for use within the authenticated user's
    /// enterprise.
    /// 
    /// This value needs to be set to `enterprise`, as `global` scopes can
    /// not be created by applications.,
    public let scope: String
    /// A unique identifier for the template. This identifier needs to be
    /// unique across the enterprise for which the metadata template is
    /// being created.
    /// 
    /// When not provided, the API will create a unique `templateKey`
    /// based on the value of the `displayName`.,
    public let templateKey: String?
    /// The display name of the template.,
    public let displayName: String
    /// Defines if this template is visible in the Box web app UI, or if
    /// it is purely intended for usage through the API.,
    public let hidden: Bool?
    /// An ordered list of template fields which are part of the template.
    /// Each field can be a regular text field, date field, number field,
    /// as well as a single or multi-select list.,
    public let fields: [CreateMetadataTemplateSchemaRequestBodyArgFieldsField]?
    /// Whether or not to copy any metadata attached to a file or folder
    /// when it is copied. By default, metadata is not copied along with a
    /// file or folder when it is copied.,
    public let copyInstanceOnItemCopy: Bool?

    /// Initializer for a CreateMetadataTemplateSchemaRequestBodyArg.
    ///
    /// - Parameters:
    ///   - scope: The scope of the metadata template to create. Applications can
    ///     only create templates for use within the authenticated user's
    ///     enterprise.
    ///     
    ///     This value needs to be set to `enterprise`, as `global` scopes can
    ///     not be created by applications.
    ///   - templateKey: A unique identifier for the template. This identifier needs to be
    ///     unique across the enterprise for which the metadata template is
    ///     being created.
    ///     
    ///     When not provided, the API will create a unique `templateKey`
    ///     based on the value of the `displayName`.
    ///   - displayName: The display name of the template.
    ///   - hidden: Defines if this template is visible in the Box web app UI, or if
    ///     it is purely intended for usage through the API.
    ///   - fields: An ordered list of template fields which are part of the template.
    ///     Each field can be a regular text field, date field, number field,
    ///     as well as a single or multi-select list.
    ///   - copyInstanceOnItemCopy: Whether or not to copy any metadata attached to a file or folder
    ///     when it is copied. By default, metadata is not copied along with a
    ///     file or folder when it is copied.
    public init(scope: String, templateKey: String? = nil, displayName: String, hidden: Bool? = nil, fields: [CreateMetadataTemplateSchemaRequestBodyArgFieldsField]? = nil, copyInstanceOnItemCopy: Bool? = nil) {
        self.scope = scope
        self.templateKey = templateKey
        self.displayName = displayName
        self.hidden = hidden
        self.fields = fields
        self.copyInstanceOnItemCopy = copyInstanceOnItemCopy
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        scope = try container.decode(String.self, forKey: .scope)
        templateKey = try container.decodeIfPresent(String.self, forKey: .templateKey)
        displayName = try container.decode(String.self, forKey: .displayName)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
        fields = try container.decodeIfPresent([CreateMetadataTemplateSchemaRequestBodyArgFieldsField].self, forKey: .fields)
        copyInstanceOnItemCopy = try container.decodeIfPresent(Bool.self, forKey: .copyInstanceOnItemCopy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(scope, forKey: .scope)
        try container.encodeIfPresent(templateKey, forKey: .templateKey)
        try container.encode(displayName, forKey: .displayName)
        try container.encodeIfPresent(hidden, forKey: .hidden)
        try container.encodeIfPresent(fields, forKey: .fields)
        try container.encodeIfPresent(copyInstanceOnItemCopy, forKey: .copyInstanceOnItemCopy)
    }
}
