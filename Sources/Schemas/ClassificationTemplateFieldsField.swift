import Foundation

public class ClassificationTemplateFieldsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case key
        case displayName
        case options
        case hidden
    }

    /// The unique ID of the field.
    public let id: String

    /// The array item type.
    public let type: ClassificationTemplateFieldsTypeField

    /// Defines classifications 
    /// available in the enterprise.
    public let key: ClassificationTemplateFieldsKeyField

    /// `Classification`
    public let displayName: ClassificationTemplateFieldsDisplayNameField

    /// A list of classifications available in this enterprise.
    public let options: [ClassificationTemplateFieldsOptionsField]

    /// Classifications are always visible to web and mobile users.
    public let hidden: Bool?

    /// Initializer for a ClassificationTemplateFieldsField.
    ///
    /// - Parameters:
    ///   - id: The unique ID of the field.
    ///   - type: The array item type.
    ///   - key: Defines classifications 
    ///     available in the enterprise.
    ///   - displayName: `Classification`
    ///   - options: A list of classifications available in this enterprise.
    ///   - hidden: Classifications are always visible to web and mobile users.
    public init(id: String, type: ClassificationTemplateFieldsTypeField, key: ClassificationTemplateFieldsKeyField, displayName: ClassificationTemplateFieldsDisplayNameField, options: [ClassificationTemplateFieldsOptionsField], hidden: Bool? = nil) {
        self.id = id
        self.type = type
        self.key = key
        self.displayName = displayName
        self.options = options
        self.hidden = hidden
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(ClassificationTemplateFieldsTypeField.self, forKey: .type)
        key = try container.decode(ClassificationTemplateFieldsKeyField.self, forKey: .key)
        displayName = try container.decode(ClassificationTemplateFieldsDisplayNameField.self, forKey: .displayName)
        options = try container.decode([ClassificationTemplateFieldsOptionsField].self, forKey: .options)
        hidden = try container.decodeIfPresent(Bool.self, forKey: .hidden)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(key, forKey: .key)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(options, forKey: .options)
        try container.encodeIfPresent(hidden, forKey: .hidden)
    }

}
