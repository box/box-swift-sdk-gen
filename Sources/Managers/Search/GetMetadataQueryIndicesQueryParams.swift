import Foundation

public class GetMetadataQueryIndicesQueryParams {
    /// The scope of the metadata template
    public let scope: GetMetadataQueryIndicesQueryParamsScopeField

    /// The name of the metadata template
    public let templateKey: String

    /// Initializer for a GetMetadataQueryIndicesQueryParams.
    ///
    /// - Parameters:
    ///   - scope: The scope of the metadata template
    ///   - templateKey: The name of the metadata template
    public init(scope: GetMetadataQueryIndicesQueryParamsScopeField, templateKey: String) {
        self.scope = scope
        self.templateKey = templateKey
    }

}
