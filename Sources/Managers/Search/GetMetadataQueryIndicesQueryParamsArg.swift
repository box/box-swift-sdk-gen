import Foundation

public class GetMetadataQueryIndicesQueryParamsArg {
    /// The scope of the metadata template,
    public let scope: GetMetadataQueryIndicesQueryParamsArgScopeField
    /// The name of the metadata template,
    public let templateKey: String

    /// Initializer for a GetMetadataQueryIndicesQueryParamsArg.
    ///
    /// - Parameters:
    ///   - scope: The scope of the metadata template
    ///   - templateKey: The name of the metadata template
    public init(scope: GetMetadataQueryIndicesQueryParamsArgScopeField, templateKey: String) {
        self.scope = scope
        self.templateKey = templateKey
    }

}
