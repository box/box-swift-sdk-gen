import Foundation

public class LegalHoldPoliciesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getLegalHoldPolicies(queryParams: GetLegalHoldPoliciesQueryParamsArg = GetLegalHoldPoliciesQueryParamsArg(), headers: GetLegalHoldPoliciesHeadersArg = GetLegalHoldPoliciesHeadersArg()) async throws -> LegalHoldPolicies {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["policy_name": Utils.Strings.toString(value: queryParams.policyName), "fields": Utils.Strings.toString(value: queryParams.fields), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicies.deserialize(from: response.text)
    }

    public func createLegalHoldPolicy(requestBody: CreateLegalHoldPolicyRequestBodyArg, headers: CreateLegalHoldPolicyHeadersArg = CreateLegalHoldPolicyHeadersArg()) async throws -> LegalHoldPolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicy.deserialize(from: response.text)
    }

    public func getLegalHoldPolicyById(legalHoldPolicyId: String, headers: GetLegalHoldPolicyByIdHeadersArg = GetLegalHoldPolicyByIdHeadersArg()) async throws -> LegalHoldPolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies/")\(legalHoldPolicyId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicy.deserialize(from: response.text)
    }

    public func updateLegalHoldPolicyById(legalHoldPolicyId: String, requestBody: UpdateLegalHoldPolicyByIdRequestBodyArg = UpdateLegalHoldPolicyByIdRequestBodyArg(), headers: UpdateLegalHoldPolicyByIdHeadersArg = UpdateLegalHoldPolicyByIdHeadersArg()) async throws -> LegalHoldPolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies/")\(legalHoldPolicyId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicy.deserialize(from: response.text)
    }

    public func deleteLegalHoldPolicyById(legalHoldPolicyId: String, headers: DeleteLegalHoldPolicyByIdHeadersArg = DeleteLegalHoldPolicyByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies/")\(legalHoldPolicyId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
