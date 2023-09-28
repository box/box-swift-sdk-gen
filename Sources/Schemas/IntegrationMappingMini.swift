import Foundation

public class IntegrationMappingMini: IntegrationMappingBase {
    private enum CodingKeys: String, CodingKey {
        case partnerItemId = "partner_item_id"
        case partnerItemType = "partner_item_type"
        case boxItemId = "box_item_id"
        case boxItemType = "box_item_type"
    }

    /// ID of the mapped partner item,
    public let partnerItemId: String?
    /// Domain-specific type of the mapped partner item,
    public let partnerItemType: IntegrationMappingMiniPartnerItemTypeField?
    /// ID of the Box item mapped to the object referenced in `partner_item_id`,
    public let boxItemId: String?
    /// Type of the Box object referenced in `box_item_id`,
    public let boxItemType: IntegrationMappingMiniBoxItemTypeField?

    /// Initializer for a IntegrationMappingMini.
    ///
    /// - Parameters:
    ///   - id: A unique identifier of a folder mapping
    ///     (part of a composite key together
    ///     with `integration_type`)
    ///   - integrationType: Identifies the Box partner app,
    ///     with which the mapping is associated.
    ///     Currently only supports Slack.
    ///     (part of the composite key together with `id`)
    ///   - partnerItemId: ID of the mapped partner item
    ///   - partnerItemType: Domain-specific type of the mapped partner item
    ///   - boxItemId: ID of the Box item mapped to the object referenced in `partner_item_id`
    ///   - boxItemType: Type of the Box object referenced in `box_item_id`
    public init(id: String? = nil, integrationType: IntegrationMappingBaseIntegrationTypeField? = nil, partnerItemId: String? = nil, partnerItemType: IntegrationMappingMiniPartnerItemTypeField? = nil, boxItemId: String? = nil, boxItemType: IntegrationMappingMiniBoxItemTypeField? = nil) {
        self.partnerItemId = partnerItemId
        self.partnerItemType = partnerItemType
        self.boxItemId = boxItemId
        self.boxItemType = boxItemType
        super.init(id: id, integrationType: integrationType)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        partnerItemId = try container.decodeIfPresent(String.self, forKey: .partnerItemId)
        partnerItemType = try container.decodeIfPresent(IntegrationMappingMiniPartnerItemTypeField.self, forKey: .partnerItemType)
        boxItemId = try container.decodeIfPresent(String.self, forKey: .boxItemId)
        boxItemType = try container.decodeIfPresent(IntegrationMappingMiniBoxItemTypeField.self, forKey: .boxItemType)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(partnerItemId, forKey: .partnerItemId)
        try container.encodeIfPresent(partnerItemType, forKey: .partnerItemType)
        try container.encodeIfPresent(boxItemId, forKey: .boxItemId)
        try container.encodeIfPresent(boxItemType, forKey: .boxItemType)
        try super.encode(to: encoder)
    }
}
