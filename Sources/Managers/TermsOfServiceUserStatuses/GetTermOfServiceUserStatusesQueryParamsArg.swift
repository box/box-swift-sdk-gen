import Foundation

public class GetTermOfServiceUserStatusesQueryParamsArg {
    /// The ID of the terms of service.
    public let tosId: String
    /// Limits results to the given user ID.
    public let userId: String?

    /// Initializer for a GetTermOfServiceUserStatusesQueryParamsArg.
    ///
    /// - Parameters:
    ///   - tosId: The ID of the terms of service.
    ///   - userId: Limits results to the given user ID.
    public init(tosId: String, userId: String? = nil) {
        self.tosId = tosId
        self.userId = userId
    }

}
