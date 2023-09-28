import Foundation

public class IntegrationMappingPartnerItemSlack: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case id
        case slackWorkspaceId = "slack_workspace_id"
        case slackOrgId = "slack_org_id"
    }

    /// Type of the mapped item referenced in `id`,
    public let type: IntegrationMappingPartnerItemSlackTypeField
    /// ID of the mapped item (of type referenced in `type`),
    public let id: String
    /// ID of the Slack workspace with which the item is associated. Use this parameter if Box for Slack is installed at a workspace level. Do not use `slack_org_id` at the same time.,
    public let slackWorkspaceId: String?
    /// ID of the Slack org with which the item is associated. Use this parameter if Box for Slack is installed at the org level. Do not use `slack_workspace_id` at the same time.,
    public let slackOrgId: String?

    /// Initializer for a IntegrationMappingPartnerItemSlack.
    ///
    /// - Parameters:
    ///   - type: Type of the mapped item referenced in `id`
    ///   - id: ID of the mapped item (of type referenced in `type`)
    ///   - slackWorkspaceId: ID of the Slack workspace with which the item is associated. Use this parameter if Box for Slack is installed at a workspace level. Do not use `slack_org_id` at the same time.
    ///   - slackOrgId: ID of the Slack org with which the item is associated. Use this parameter if Box for Slack is installed at the org level. Do not use `slack_workspace_id` at the same time.
    public init(type: IntegrationMappingPartnerItemSlackTypeField, id: String, slackWorkspaceId: String? = nil, slackOrgId: String? = nil) {
        self.type = type
        self.id = id
        self.slackWorkspaceId = slackWorkspaceId
        self.slackOrgId = slackOrgId
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(IntegrationMappingPartnerItemSlackTypeField.self, forKey: .type)
        id = try container.decode(String.self, forKey: .id)
        slackWorkspaceId = try container.decodeIfPresent(String.self, forKey: .slackWorkspaceId)
        slackOrgId = try container.decodeIfPresent(String.self, forKey: .slackOrgId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(slackWorkspaceId, forKey: .slackWorkspaceId)
        try container.encodeIfPresent(slackOrgId, forKey: .slackOrgId)
    }
}
