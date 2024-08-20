import Foundation

/// A request to create a
/// Slack Integration Mapping object
public class IntegrationMappingSlackCreateRequest: Codable {
    private enum CodingKeys: String, CodingKey {
        case boxItem = "box_item"
        case options
        case partnerItem = "partner_item"
    }

    public let boxItem: IntegrationMappingBoxItemSlack

    public let options: IntegrationMappingSlackOptions?

    public let partnerItem: IntegrationMappingPartnerItemSlack?

    public init(boxItem: IntegrationMappingBoxItemSlack, options: IntegrationMappingSlackOptions? = nil, partnerItem: IntegrationMappingPartnerItemSlack? = nil) {
        self.boxItem = boxItem
        self.options = options
        self.partnerItem = partnerItem
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        boxItem = try container.decode(IntegrationMappingBoxItemSlack.self, forKey: .boxItem)
        options = try container.decodeIfPresent(IntegrationMappingSlackOptions.self, forKey: .options)
        partnerItem = try container.decodeIfPresent(IntegrationMappingPartnerItemSlack.self, forKey: .partnerItem)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(boxItem, forKey: .boxItem)
        try container.encodeIfPresent(options, forKey: .options)
        try container.encodeIfPresent(partnerItem, forKey: .partnerItem)
    }

}
