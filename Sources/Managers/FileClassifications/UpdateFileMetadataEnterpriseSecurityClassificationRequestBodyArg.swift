import Foundation

public class UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case op
        case path
        case value
    }

    /// `replace`,
    public let op: UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArgOpField?
    /// `/Box__Security__Classification__Key`,
    public let path: UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArgPathField?
    /// The name of the classification to apply to this file.
    /// 
    /// To list the available classifications in an enterprise,
    /// use the classification API to retrieve the
    /// [classification template](e://get_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema)
    /// which lists all available classification keys.,
    public let value: String?

    /// Initializer for a UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArg.
    ///
    /// - Parameters:
    ///   - op: `replace`
    ///   - path: `/Box__Security__Classification__Key`
    ///   - value: The name of the classification to apply to this file.
    ///     
    ///     To list the available classifications in an enterprise,
    ///     use the classification API to retrieve the
    ///     [classification template](e://get_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema)
    ///     which lists all available classification keys.
    public init(op: UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArgOpField? = nil, path: UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArgPathField? = nil, value: String? = nil) {
        self.op = op
        self.path = path
        self.value = value
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        op = try container.decodeIfPresent(UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArgOpField.self, forKey: .op)
        path = try container.decodeIfPresent(UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArgPathField.self, forKey: .path)
        value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(op, forKey: .op)
        try container.encodeIfPresent(path, forKey: .path)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
