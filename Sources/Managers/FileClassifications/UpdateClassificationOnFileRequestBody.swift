import Foundation

public class UpdateClassificationOnFileRequestBody: Codable {
    private enum CodingKeys: String, CodingKey {
        case op
        case path
        case value
    }

    /// `replace`
    public let op: UpdateClassificationOnFileRequestBodyOpField

    /// Defines classifications 
    /// available in the enterprise.
    public let path: UpdateClassificationOnFileRequestBodyPathField

    /// The name of the classification to apply to this file.
    /// 
    /// To list the available classifications in an enterprise,
    /// use the classification API to retrieve the
    /// [classification template](e://get_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema)
    /// which lists all available classification keys.
    public let value: String

    /// Initializer for a UpdateClassificationOnFileRequestBody.
    ///
    /// - Parameters:
    ///   - op: `replace`
    ///   - path: Defines classifications 
    ///     available in the enterprise.
    ///   - value: The name of the classification to apply to this file.
    ///     
    ///     To list the available classifications in an enterprise,
    ///     use the classification API to retrieve the
    ///     [classification template](e://get_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema)
    ///     which lists all available classification keys.
    public init(op: UpdateClassificationOnFileRequestBodyOpField, path: UpdateClassificationOnFileRequestBodyPathField, value: String) {
        self.op = op
        self.path = path
        self.value = value
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        op = try container.decode(UpdateClassificationOnFileRequestBodyOpField.self, forKey: .op)
        path = try container.decode(UpdateClassificationOnFileRequestBodyPathField.self, forKey: .path)
        value = try container.decode(String.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(op, forKey: .op)
        try container.encode(path, forKey: .path)
        try container.encode(value, forKey: .value)
    }

}
