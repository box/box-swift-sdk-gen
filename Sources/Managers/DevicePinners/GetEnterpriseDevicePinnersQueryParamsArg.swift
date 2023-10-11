import Foundation

public class GetEnterpriseDevicePinnersQueryParamsArg {
    /// Defines the position marker at which to begin returning results. This is
    /// used when paginating using marker-based pagination.
    /// 
    /// This requires `usemarker` to be set to `true`.
    public let marker: String?
    /// The maximum number of items to return per page.
    public let limit: Int64?
    /// The direction to sort results in. This can be either in alphabetical ascending
    /// (`ASC`) or descending (`DESC`) order.
    public let direction: GetEnterpriseDevicePinnersQueryParamsArgDirectionField?

    /// Initializer for a GetEnterpriseDevicePinnersQueryParamsArg.
    ///
    /// - Parameters:
    ///   - marker: Defines the position marker at which to begin returning results. This is
    ///     used when paginating using marker-based pagination.
    ///     
    ///     This requires `usemarker` to be set to `true`.
    ///   - limit: The maximum number of items to return per page.
    ///   - direction: The direction to sort results in. This can be either in alphabetical ascending
    ///     (`ASC`) or descending (`DESC`) order.
    public init(marker: String? = nil, limit: Int64? = nil, direction: GetEnterpriseDevicePinnersQueryParamsArgDirectionField? = nil) {
        self.marker = marker
        self.limit = limit
        self.direction = direction
    }

}
