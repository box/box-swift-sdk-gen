import Foundation

public class ClassificationTemplateFieldsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case key
        case displayName
        case hidden
        case options
    }

    /// The unique ID of the field.
    public let id: String?
    /// `enum`
    public let type: ClassificationTemplateFieldsFieldTypeField?
    /// `Box__Security__Classification__Key`
    public let key: ClassificationTemplateFieldsFieldKeyField?
    /// `Classification`
    public let displayName: ClassificationTemplateFieldsFieldDisplayNameField?
    /// Classifications are always visible to web and mobile users.
    public let hidden: Bool?
    /// A list of classifications available in this enterprise.
    public let options: [ClassificationTemplateFieldsFieldOptionsField]?

    /// Initializer for a ClassificationTemplateFieldsField.
    ///
    /// - Parameters:
    ///   - id: The unique ID of the field.
    ///   - type: `enum`
    ///   - key: `Box__Security__Classification__Key`
    ///   - displayName: `Classification`
    ///   - hidden: Classifications are always visible to web and mobile users.
    ///   - options: A list of classifications available in this enterprise.
    public init(id: String? = nil, type: ClassificationTemplateFieldsFieldTypeField? = nil, key: ClassificationTemplateFieldsFieldKeyField? = nil, displayName: ClassificationTemplateFieldsFieldDisplayNameField? = nil, hidden: Bool? = nil, options: [ClassificationTemplateFieldsFieldOptionsField]? = nil) {
        self.id = id
        self.type = type
        self.key = key
        self.displayName = displayName
        self.hidden = hidden
        self.options = options
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(ClassificationTemplateFieldsFieldTypeField.self, forKey: .type)
        key = try container.decodeIfPresent(ClassificationTemplateFieldsFieldKeyField.self, forKey: .key)
        displayName = try container.decodeIfPresent(ClassificationTemplateFieldsFieldDisplayNameField.self, forKey: .displayName)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
        options = try container.decodeIfPresent([ClassificationTemplateFieldsFieldOptionsField].self, forKey: .options)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(key, forKey: .key)
        try container.encodeIfPresent(displayName, forKey: .displayName)
        try container.encodeIfPresent(hidden, forKey: .hidden)
        try container.encodeIfPresent(options, forKey: .options)
    }
}
