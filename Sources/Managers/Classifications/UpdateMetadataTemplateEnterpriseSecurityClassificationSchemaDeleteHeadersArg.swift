import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteHeadersArg {
    /// Extra headers that will be included in the HTTP request.
    public let extraHeaders: [String: String?]?

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteHeadersArg.
    ///
    /// - Parameters:
    ///   - extraHeaders: Extra headers that will be included in the HTTP request.
    public init(extraHeaders: [String: String?]? = [:]) {
        self.extraHeaders = extraHeaders
    }

}
