import Foundation

public class GetMetadataTemplatesByInstanceIdQueryParamsArg {
    /// The ID of an instance of the metadata template to find.
    public let metadataInstanceId: String

    /// Initializer for a GetMetadataTemplatesByInstanceIdQueryParamsArg.
    ///
    /// - Parameters:
    ///   - metadataInstanceId: The ID of an instance of the metadata template to find.
    public init(metadataInstanceId: String) {
        self.metadataInstanceId = metadataInstanceId
    }

}
