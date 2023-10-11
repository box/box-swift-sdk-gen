import Foundation

public class UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateHeadersArg {
    /// Extra headers that will be included in the HTTP request.
    public let extraHeaders: [String: String?]?

    /// Initializer for a UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateHeadersArg.
    ///
    /// - Parameters:
    ///   - extraHeaders: Extra headers that will be included in the HTTP request.
    public init(extraHeaders: [String: String?]? = [:]) {
        self.extraHeaders = extraHeaders
    }

}
