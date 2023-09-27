import Foundation

public class CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case key
        case staticConfig
    }

    /// The display name and key this classification. This
    /// will be show in the Box UI.,
    public let key: String?
    /// Additional information about the classification.,
    public let staticConfig: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsFieldStaticConfigField?

    /// Initializer for a CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsField.
    ///
    /// - Parameters:
    ///   - key: The display name and key this classification. This
    ///     will be show in the Box UI.
    ///   - staticConfig: Additional information about the classification.
    public init(key: String? = nil, staticConfig: CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsFieldStaticConfigField? = nil) {
        self.key = key
        self.staticConfig = staticConfig
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        key = try container.decodeIfPresent(String.self, forKey: .key)
        staticConfig = try container.decodeIfPresent(CreateMetadataTemplateSchemaClassificationRequestBodyArgFieldsFieldOptionsFieldStaticConfigField.self, forKey: .staticConfig)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(key, forKey: .key)
        try container.encodeIfPresent(staticConfig, forKey: .staticConfig)
    }
}
