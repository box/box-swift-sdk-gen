import Foundation

public class RetentionPoliciesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getRetentionPolicies(queryParams: GetRetentionPoliciesQueryParamsArg = GetRetentionPoliciesQueryParamsArg(), headers: GetRetentionPoliciesHeadersArg = GetRetentionPoliciesHeadersArg()) async throws -> RetentionPolicies {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["policy_name": Utils.Strings.toString(value: queryParams.policyName), "policy_type": Utils.Strings.toString(value: queryParams.policyType), "created_by_user_id": Utils.Strings.toString(value: queryParams.createdByUserId), "fields": Utils.Strings.toString(value: queryParams.fields), "limit": Utils.Strings.toString(value: queryParams.limit), "marker": Utils.Strings.toString(value: queryParams.marker)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policies")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicies.deserialize(from: response.text)
    }

    public func createRetentionPolicy(requestBody: CreateRetentionPolicyRequestBodyArg, headers: CreateRetentionPolicyHeadersArg = CreateRetentionPolicyHeadersArg()) async throws -> RetentionPolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policies")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicy.deserialize(from: response.text)
    }

    public func getRetentionPolicyById(retentionPolicyId: String, queryParams: GetRetentionPolicyByIdQueryParamsArg = GetRetentionPolicyByIdQueryParamsArg(), headers: GetRetentionPolicyByIdHeadersArg = GetRetentionPolicyByIdHeadersArg()) async throws -> RetentionPolicy {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policies/")\(retentionPolicyId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicy.deserialize(from: response.text)
    }

    public func updateRetentionPolicyById(retentionPolicyId: String, requestBody: UpdateRetentionPolicyByIdRequestBodyArg = UpdateRetentionPolicyByIdRequestBodyArg(), headers: UpdateRetentionPolicyByIdHeadersArg = UpdateRetentionPolicyByIdHeadersArg()) async throws -> RetentionPolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policies/")\(retentionPolicyId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RetentionPolicy.deserialize(from: response.text)
    }

    public func deleteRetentionPolicyById(retentionPolicyId: String, headers: DeleteRetentionPolicyByIdHeadersArg = DeleteRetentionPolicyByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/retention_policies/")\(retentionPolicyId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
