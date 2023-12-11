import Foundation

public class AddClassificationRequestBodyArgDataField: Codable {
    private enum CodingKeys: String, CodingKey {
        case key
        case staticConfig
    }

    /// The label of the classification as shown in the web and
    /// mobile interfaces. This is the only field required to
    /// add a classification.
    public let key: String

    /// A static configuration for the classification.
    public let staticConfig: AddClassificationRequestBodyArgDataFieldStaticConfigField?

    /// Initializer for a AddClassificationRequestBodyArgDataField.
    ///
    /// - Parameters:
    ///   - key: The label of the classification as shown in the web and
    ///     mobile interfaces. This is the only field required to
    ///     add a classification.
    ///   - staticConfig: A static configuration for the classification.
    public init(key: String, staticConfig: AddClassificationRequestBodyArgDataFieldStaticConfigField? = nil) {
        self.key = key
        self.staticConfig = staticConfig
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        key = try container.decode(String.self, forKey: .key)
        staticConfig = try container.decodeIfPresent(AddClassificationRequestBodyArgDataFieldStaticConfigField.self, forKey: .staticConfig)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        try container.encodeIfPresent(staticConfig, forKey: .staticConfig)
    }

}
