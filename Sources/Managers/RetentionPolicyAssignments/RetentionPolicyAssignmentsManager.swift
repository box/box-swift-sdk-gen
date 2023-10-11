import Foundation

public class RetentionPolicyAssignmentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Returns a list of all retention policy assignments associated with a specified
    /// retention policy.
    ///
    /// - Parameters:
    ///   - retentionPolicyId: The ID of the retention policy.
    ///     Example: "982312"
    ///   - queryParams: Query parameters of getRetentionPolicyAssignments method
    ///   - headers: Headers of getRetentionPolicyAssignments method
    /// - Returns: The `RetentionPolicyAssignments`.
    /// - Throws: The `GeneralError`.
    public func getRetentionPolicyAssignments(retentionPolicyId: String, queryParams: GetRetentionPolicyAssignmentsQueryParamsArg = GetRetentionPolicyAssignmentsQueryParamsArg(), headers: GetRetentionPolicyAssignmentsHeadersArg = GetRetentionPolicyAssignmentsHeadersArg()) async throws -> RetentionPolicyAssignments {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["type": Utils.Strings.toString(value: queryParams.type), "fields": Utils.Strings.toString(value: queryParams.fields), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policies/")\(retentionPolicyId)\("/assignments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicyAssignments.deserialize(from: response.text)
    }

    /// Assigns a retention policy to an item.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createRetentionPolicyAssignment method
    ///   - headers: Headers of createRetentionPolicyAssignment method
    /// - Returns: The `RetentionPolicyAssignment`.
    /// - Throws: The `GeneralError`.
    public func createRetentionPolicyAssignment(requestBody: CreateRetentionPolicyAssignmentRequestBodyArg, headers: CreateRetentionPolicyAssignmentHeadersArg = CreateRetentionPolicyAssignmentHeadersArg()) async throws -> RetentionPolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicyAssignment.deserialize(from: response.text)
    }

    /// Retrieves a retention policy assignment
    ///
    /// - Parameters:
    ///   - retentionPolicyAssignmentId: The ID of the retention policy assignment.
    ///     Example: "1233123"
    ///   - queryParams: Query parameters of getRetentionPolicyAssignmentById method
    ///   - headers: Headers of getRetentionPolicyAssignmentById method
    /// - Returns: The `RetentionPolicyAssignment`.
    /// - Throws: The `GeneralError`.
    public func getRetentionPolicyAssignmentById(retentionPolicyAssignmentId: String, queryParams: GetRetentionPolicyAssignmentByIdQueryParamsArg = GetRetentionPolicyAssignmentByIdQueryParamsArg(), headers: GetRetentionPolicyAssignmentByIdHeadersArg = GetRetentionPolicyAssignmentByIdHeadersArg()) async throws -> RetentionPolicyAssignment {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments/")\(retentionPolicyAssignmentId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicyAssignment.deserialize(from: response.text)
    }

    /// Removes a retention policy assignment
    /// applied to content.
    ///
    /// - Parameters:
    ///   - retentionPolicyAssignmentId: The ID of the retention policy assignment.
    ///     Example: "1233123"
    ///   - headers: Headers of deleteRetentionPolicyAssignmentById method
    /// - Throws: The `GeneralError`.
    public func deleteRetentionPolicyAssignmentById(retentionPolicyAssignmentId: String, headers: DeleteRetentionPolicyAssignmentByIdHeadersArg = DeleteRetentionPolicyAssignmentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments/")\(retentionPolicyAssignmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Returns a list of files under retention for a retention policy assignment.
    ///
    /// - Parameters:
    ///   - retentionPolicyAssignmentId: The ID of the retention policy assignment.
    ///     Example: "1233123"
    ///   - queryParams: Query parameters of getRetentionPolicyAssignmentFileUnderRetention method
    ///   - headers: Headers of getRetentionPolicyAssignmentFileUnderRetention method
    /// - Returns: The `FilesUnderRetention`.
    /// - Throws: The `GeneralError`.
    public func getRetentionPolicyAssignmentFileUnderRetention(retentionPolicyAssignmentId: String, queryParams: GetRetentionPolicyAssignmentFileUnderRetentionQueryParamsArg = GetRetentionPolicyAssignmentFileUnderRetentionQueryParamsArg(), headers: GetRetentionPolicyAssignmentFileUnderRetentionHeadersArg = GetRetentionPolicyAssignmentFileUnderRetentionHeadersArg()) async throws -> FilesUnderRetention {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments/")\(retentionPolicyAssignmentId)\("/files_under_retention")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FilesUnderRetention.deserialize(from: response.text)
    }

    /// Returns a list of file versions under retention for a retention policy
    /// assignment.
    ///
    /// - Parameters:
    ///   - retentionPolicyAssignmentId: The ID of the retention policy assignment.
    ///     Example: "1233123"
    ///   - queryParams: Query parameters of getRetentionPolicyAssignmentFileVersionUnderRetention method
    ///   - headers: Headers of getRetentionPolicyAssignmentFileVersionUnderRetention method
    /// - Returns: The `FilesUnderRetention`.
    /// - Throws: The `GeneralError`.
    public func getRetentionPolicyAssignmentFileVersionUnderRetention(retentionPolicyAssignmentId: String, queryParams: GetRetentionPolicyAssignmentFileVersionUnderRetentionQueryParamsArg = GetRetentionPolicyAssignmentFileVersionUnderRetentionQueryParamsArg(), headers: GetRetentionPolicyAssignmentFileVersionUnderRetentionHeadersArg = GetRetentionPolicyAssignmentFileVersionUnderRetentionHeadersArg()) async throws -> FilesUnderRetention {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments/")\(retentionPolicyAssignmentId)\("/file_versions_under_retention")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FilesUnderRetention.deserialize(from: response.text)
    }

}
