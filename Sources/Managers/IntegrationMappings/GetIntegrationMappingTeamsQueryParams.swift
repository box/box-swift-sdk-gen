import Foundation

public class GetIntegrationMappingTeamsQueryParams {
    /// Mapped item type, for which the mapping should be returned
    public let partnerItemType: GetIntegrationMappingTeamsQueryParamsPartnerItemTypeField?

    /// ID of the mapped item, for which the mapping should be returned
    public let partnerItemId: String?

    /// Box item ID, for which the mappings should be returned
    public let boxItemId: String?

    /// Box item type, for which the mappings should be returned
    public let boxItemType: GetIntegrationMappingTeamsQueryParamsBoxItemTypeField?

    /// Initializer for a GetIntegrationMappingTeamsQueryParams.
    ///
    /// - Parameters:
    ///   - partnerItemType: Mapped item type, for which the mapping should be returned
    ///   - partnerItemId: ID of the mapped item, for which the mapping should be returned
    ///   - boxItemId: Box item ID, for which the mappings should be returned
    ///   - boxItemType: Box item type, for which the mappings should be returned
    public init(partnerItemType: GetIntegrationMappingTeamsQueryParamsPartnerItemTypeField? = nil, partnerItemId: String? = nil, boxItemId: String? = nil, boxItemType: GetIntegrationMappingTeamsQueryParamsBoxItemTypeField? = nil) {
        self.partnerItemType = partnerItemType
        self.partnerItemId = partnerItemId
        self.boxItemId = boxItemId
        self.boxItemType = boxItemType
    }

}
