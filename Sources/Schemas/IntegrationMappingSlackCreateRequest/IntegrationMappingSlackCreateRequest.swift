import Foundation

/// A request to create a
/// Slack Integration Mapping object
public class IntegrationMappingSlackCreateRequest: Codable {
    private enum CodingKeys: String, CodingKey {
        case boxItem = "box_item"
        case partnerItem = "partner_item"
        case options
    }

    public let boxItem: IntegrationMappingBoxItemSlack

    public let partnerItem: IntegrationMappingPartnerItemSlack

    public let options: IntegrationMappingSlackOptions?

    public init(boxItem: IntegrationMappingBoxItemSlack, partnerItem: IntegrationMappingPartnerItemSlack, options: IntegrationMappingSlackOptions? = nil) {
        self.boxItem = boxItem
        self.partnerItem = partnerItem
        self.options = options
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        boxItem = try container.decode(IntegrationMappingBoxItemSlack.self, forKey: .boxItem)
        partnerItem = try container.decode(IntegrationMappingPartnerItemSlack.self, forKey: .partnerItem)
        options = try container.decodeIfPresent(IntegrationMappingSlackOptions.self, forKey: .options)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(boxItem, forKey: .boxItem)
        try container.encode(partnerItem, forKey: .partnerItem)
        try container.encodeIfPresent(options, forKey: .options)
    }

}
