import Foundation

public class GetMetadataTemplatesQueryParamsArg {
    /// The ID of an instance of the metadata template to find.
    public let metadataInstanceId: String

    /// Initializer for a GetMetadataTemplatesQueryParamsArg.
    ///
    /// - Parameters:
    ///   - metadataInstanceId: The ID of an instance of the metadata template to find.
    public init(metadataInstanceId: String) {
        self.metadataInstanceId = metadataInstanceId
    }

}
