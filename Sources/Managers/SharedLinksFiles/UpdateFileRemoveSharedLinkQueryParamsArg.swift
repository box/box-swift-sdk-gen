import Foundation

public class UpdateFileRemoveSharedLinkQueryParamsArg {
    /// Explicitly request the `shared_link` fields
    /// to be returned for this item.,
    public let fields: String

    /// Initializer for a UpdateFileRemoveSharedLinkQueryParamsArg.
    ///
    /// - Parameters:
    ///   - fields: Explicitly request the `shared_link` fields
    ///     to be returned for this item.
    public init(fields: String) {
        self.fields = fields
    }

}
