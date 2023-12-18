import Foundation

public class GetTermOfServicesQueryParams {
    /// Limits the results to the terms of service of the given type.
    public let tosType: GetTermOfServicesQueryParamsTosTypeField?

    /// Initializer for a GetTermOfServicesQueryParams.
    ///
    /// - Parameters:
    ///   - tosType: Limits the results to the terms of service of the given type.
    public init(tosType: GetTermOfServicesQueryParamsTosTypeField? = nil) {
        self.tosType = tosType
    }

}
