import Foundation

public class GetTermOfServicesQueryParamsArg {
    /// Limits the results to the terms of service of the given type.,
    public let tosType: GetTermOfServicesQueryParamsArgTosTypeField?

    /// Initializer for a GetTermOfServicesQueryParamsArg.
    ///
    /// - Parameters:
    ///   - tosType: Limits the results to the terms of service of the given type.
    public init(tosType: GetTermOfServicesQueryParamsArgTosTypeField? = nil) {
        self.tosType = tosType
    }

}
