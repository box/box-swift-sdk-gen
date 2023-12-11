import Foundation

/// A base representation of an
/// integration mapping object.
public class IntegrationMappingBase: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case integrationType = "integration_type"
    }

    /// A unique identifier of a folder mapping
    /// (part of a composite key together
    /// with `integration_type`)
    public let id: String?

    /// Identifies the Box partner app,
    /// with which the mapping is associated.
    /// Currently only supports Slack.
    /// (part of the composite key together with `id`)
    public let integrationType: IntegrationMappingBaseIntegrationTypeField?

    /// Initializer for a IntegrationMappingBase.
    ///
    /// - Parameters:
    ///   - id: A unique identifier of a folder mapping
    ///     (part of a composite key together
    ///     with `integration_type`)
    ///   - integrationType: Identifies the Box partner app,
    ///     with which the mapping is associated.
    ///     Currently only supports Slack.
    ///     (part of the composite key together with `id`)
    public init(id: String? = nil, integrationType: IntegrationMappingBaseIntegrationTypeField? = nil) {
        self.id = id
        self.integrationType = integrationType
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        integrationType = try container.decodeIfPresent(IntegrationMappingBaseIntegrationTypeField.self, forKey: .integrationType)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(integrationType, forKey: .integrationType)
    }

}
