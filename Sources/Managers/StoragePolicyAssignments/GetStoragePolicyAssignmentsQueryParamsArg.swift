import Foundation

public class GetStoragePolicyAssignmentsQueryParamsArg {
    /// Defines the position marker at which to begin returning results. This is
    /// used when paginating using marker-based pagination.
    /// 
    /// This requires `usemarker` to be set to `true`.,
    public let marker: String?
    /// The target type to return assignments for,
    public let resolvedForType: GetStoragePolicyAssignmentsQueryParamsArgResolvedForTypeField
    /// The ID of the user or enterprise to return assignments for,
    public let resolvedForId: String

    /// Initializer for a GetStoragePolicyAssignmentsQueryParamsArg.
    ///
    /// - Parameters:
    ///   - marker: Defines the position marker at which to begin returning results. This is
    ///     used when paginating using marker-based pagination.
    ///     
    ///     This requires `usemarker` to be set to `true`.
    ///   - resolvedForType: The target type to return assignments for
    ///   - resolvedForId: The ID of the user or enterprise to return assignments for
    public init(marker: String? = nil, resolvedForType: GetStoragePolicyAssignmentsQueryParamsArgResolvedForTypeField, resolvedForId: String) {
        self.marker = marker
        self.resolvedForType = resolvedForType
        self.resolvedForId = resolvedForId
    }

}
