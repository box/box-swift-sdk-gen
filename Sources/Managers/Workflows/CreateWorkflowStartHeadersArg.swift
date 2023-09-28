import Foundation

public class CreateWorkflowStartHeadersArg {
    /// Extra headers that will be included in the HTTP request.,
    public let extraHeaders: [String: String?]?

    /// Initializer for a CreateWorkflowStartHeadersArg.
    ///
    /// - Parameters:
    ///   - extraHeaders: Extra headers that will be included in the HTTP request.
    public init(extraHeaders: [String: String?]? = [:]) {
        self.extraHeaders = extraHeaders
    }

}
