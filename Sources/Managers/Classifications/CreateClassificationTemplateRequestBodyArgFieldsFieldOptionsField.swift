import Foundation

public class CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsField: Codable {
    private enum CodingKeys: String, CodingKey {
        case key
        case staticConfig
    }

    /// The display name and key this classification. This
    /// will be show in the Box UI.
    public let key: String

    /// Additional information about the classification.
    public let staticConfig: CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsFieldStaticConfigField?

    /// Initializer for a CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsField.
    ///
    /// - Parameters:
    ///   - key: The display name and key this classification. This
    ///     will be show in the Box UI.
    ///   - staticConfig: Additional information about the classification.
    public init(key: String, staticConfig: CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsFieldStaticConfigField? = nil) {
        self.key = key
        self.staticConfig = staticConfig
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        key = try container.decode(String.self, forKey: .key)
        staticConfig = try container.decodeIfPresent(CreateClassificationTemplateRequestBodyArgFieldsFieldOptionsFieldStaticConfigField.self, forKey: .staticConfig)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        try container.encodeIfPresent(staticConfig, forKey: .staticConfig)
    }

}
