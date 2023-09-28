import Foundation

public class RetentionPolicyAssignmentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getRetentionPolicyAssignments(retentionPolicyId: String, queryParams: GetRetentionPolicyAssignmentsQueryParamsArg = GetRetentionPolicyAssignmentsQueryParamsArg(), headers: GetRetentionPolicyAssignmentsHeadersArg = GetRetentionPolicyAssignmentsHeadersArg()) async throws -> RetentionPolicyAssignments {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["type": Utils.Strings.toString(value: queryParams.type), "fields": Utils.Strings.toString(value: queryParams.fields), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policies/")\(retentionPolicyId)\("/assignments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicyAssignments.deserialize(from: response.text)
    }

    public func createRetentionPolicyAssignment(requestBody: CreateRetentionPolicyAssignmentRequestBodyArg, headers: CreateRetentionPolicyAssignmentHeadersArg = CreateRetentionPolicyAssignmentHeadersArg()) async throws -> RetentionPolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicyAssignment.deserialize(from: response.text)
    }

    public func getRetentionPolicyAssignmentById(retentionPolicyAssignmentId: String, queryParams: GetRetentionPolicyAssignmentByIdQueryParamsArg = GetRetentionPolicyAssignmentByIdQueryParamsArg(), headers: GetRetentionPolicyAssignmentByIdHeadersArg = GetRetentionPolicyAssignmentByIdHeadersArg()) async throws -> RetentionPolicyAssignment {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments/")\(retentionPolicyAssignmentId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicyAssignment.deserialize(from: response.text)
    }

    public func deleteRetentionPolicyAssignmentById(retentionPolicyAssignmentId: String, headers: DeleteRetentionPolicyAssignmentByIdHeadersArg = DeleteRetentionPolicyAssignmentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments/")\(retentionPolicyAssignmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getRetentionPolicyAssignmentFileUnderRetention(retentionPolicyAssignmentId: String, queryParams: GetRetentionPolicyAssignmentFileUnderRetentionQueryParamsArg = GetRetentionPolicyAssignmentFileUnderRetentionQueryParamsArg(), headers: GetRetentionPolicyAssignmentFileUnderRetentionHeadersArg = GetRetentionPolicyAssignmentFileUnderRetentionHeadersArg()) async throws -> FilesUnderRetention {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments/")\(retentionPolicyAssignmentId)\("/files_under_retention")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FilesUnderRetention.deserialize(from: response.text)
    }

    public func getRetentionPolicyAssignmentFileVersionUnderRetention(retentionPolicyAssignmentId: String, queryParams: GetRetentionPolicyAssignmentFileVersionUnderRetentionQueryParamsArg = GetRetentionPolicyAssignmentFileVersionUnderRetentionQueryParamsArg(), headers: GetRetentionPolicyAssignmentFileVersionUnderRetentionHeadersArg = GetRetentionPolicyAssignmentFileVersionUnderRetentionHeadersArg()) async throws -> FilesUnderRetention {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policy_assignments/")\(retentionPolicyAssignmentId)\("/file_versions_under_retention")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FilesUnderRetention.deserialize(from: response.text)
    }

}
