import Foundation

public class WorkflowsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Returns list of workflows that act on a given `folder ID`, and
    /// have a flow with a trigger type of `WORKFLOW_MANUAL_START`.
    /// 
    /// You application must be authorized to use the `Manage Box Relay` application
    /// scope within the developer console in to use this endpoint.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getWorkflows method
    ///   - headers: Headers of getWorkflows method
    /// - Returns: The `Workflows`.
    /// - Throws: The `GeneralError`.
    public func getWorkflows(queryParams: GetWorkflowsQueryParamsArg, headers: GetWorkflowsHeadersArg = GetWorkflowsHeadersArg()) async throws -> Workflows {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["folder_id": Utils.Strings.toString(value: queryParams.folderId), "trigger_type": Utils.Strings.toString(value: queryParams.triggerType), "limit": Utils.Strings.toString(value: queryParams.limit), "marker": Utils.Strings.toString(value: queryParams.marker)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/workflows")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Workflows.deserialize(from: response.text)
    }

    /// Initiates a flow with a trigger type of `WORKFLOW_MANUAL_START`.
    /// 
    /// You application must be authorized to use the `Manage Box Relay` application
    /// scope within the developer console.
    ///
    /// - Parameters:
    ///   - workflowId: The ID of the workflow.
    ///     Example: "12345"
    ///   - requestBody: Request body of createWorkflowStart method
    ///   - headers: Headers of createWorkflowStart method
    /// - Throws: The `GeneralError`.
    public func createWorkflowStart(workflowId: String, requestBody: CreateWorkflowStartRequestBodyArg, headers: CreateWorkflowStartHeadersArg = CreateWorkflowStartHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/workflows/")\(workflowId)\("/start")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
