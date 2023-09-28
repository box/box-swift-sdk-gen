import Foundation

public class GetIntegrationMappingSlackQueryParamsArg {
    /// Defines the position marker at which to begin returning results. This is
    /// used when paginating using marker-based pagination.
    /// 
    /// This requires `usemarker` to be set to `true`.,
    public let marker: String?
    /// The maximum number of items to return per page.,
    public let limit: Int64?
    /// Mapped item type, for which the mapping should be returned,
    public let partnerItemType: GetIntegrationMappingSlackQueryParamsArgPartnerItemTypeField?
    /// ID of the mapped item, for which the mapping should be returned,
    public let partnerItemId: String?
    /// Box item ID, for which the mappings should be returned,
    public let boxItemId: String?
    /// Box item type, for which the mappings should be returned,
    public let boxItemType: GetIntegrationMappingSlackQueryParamsArgBoxItemTypeField?
    /// Whether the mapping has been manually created,
    public let isManuallyCreated: Bool?

    /// Initializer for a GetIntegrationMappingSlackQueryParamsArg.
    ///
    /// - Parameters:
    ///   - marker: Defines the position marker at which to begin returning results. This is
    ///     used when paginating using marker-based pagination.
    ///     
    ///     This requires `usemarker` to be set to `true`.
    ///   - limit: The maximum number of items to return per page.
    ///   - partnerItemType: Mapped item type, for which the mapping should be returned
    ///   - partnerItemId: ID of the mapped item, for which the mapping should be returned
    ///   - boxItemId: Box item ID, for which the mappings should be returned
    ///   - boxItemType: Box item type, for which the mappings should be returned
    ///   - isManuallyCreated: Whether the mapping has been manually created
    public init(marker: String? = nil, limit: Int64? = nil, partnerItemType: GetIntegrationMappingSlackQueryParamsArgPartnerItemTypeField? = nil, partnerItemId: String? = nil, boxItemId: String? = nil, boxItemType: GetIntegrationMappingSlackQueryParamsArgBoxItemTypeField? = nil, isManuallyCreated: Bool? = nil) {
        self.marker = marker
        self.limit = limit
        self.partnerItemType = partnerItemType
        self.partnerItemId = partnerItemId
        self.boxItemId = boxItemId
        self.boxItemType = boxItemType
        self.isManuallyCreated = isManuallyCreated
    }

}
