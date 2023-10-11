import Foundation

public class LegalHoldPoliciesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves a list of legal hold policies that belong to
    /// an enterprise.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getLegalHoldPolicies method
    ///   - headers: Headers of getLegalHoldPolicies method
    /// - Returns: The `LegalHoldPolicies`.
    /// - Throws: The `GeneralError`.
    public func getLegalHoldPolicies(queryParams: GetLegalHoldPoliciesQueryParamsArg = GetLegalHoldPoliciesQueryParamsArg(), headers: GetLegalHoldPoliciesHeadersArg = GetLegalHoldPoliciesHeadersArg()) async throws -> LegalHoldPolicies {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["policy_name": Utils.Strings.toString(value: queryParams.policyName), "fields": Utils.Strings.toString(value: queryParams.fields), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicies.deserialize(from: response.text)
    }

    /// Create a new legal hold policy.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createLegalHoldPolicy method
    ///   - headers: Headers of createLegalHoldPolicy method
    /// - Returns: The `LegalHoldPolicy`.
    /// - Throws: The `GeneralError`.
    public func createLegalHoldPolicy(requestBody: CreateLegalHoldPolicyRequestBodyArg, headers: CreateLegalHoldPolicyHeadersArg = CreateLegalHoldPolicyHeadersArg()) async throws -> LegalHoldPolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicy.deserialize(from: response.text)
    }

    /// Retrieve a legal hold policy.
    ///
    /// - Parameters:
    ///   - legalHoldPolicyId: The ID of the legal hold policy
    ///     Example: "324432"
    ///   - headers: Headers of getLegalHoldPolicyById method
    /// - Returns: The `LegalHoldPolicy`.
    /// - Throws: The `GeneralError`.
    public func getLegalHoldPolicyById(legalHoldPolicyId: String, headers: GetLegalHoldPolicyByIdHeadersArg = GetLegalHoldPolicyByIdHeadersArg()) async throws -> LegalHoldPolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies/")\(legalHoldPolicyId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicy.deserialize(from: response.text)
    }

    /// Update legal hold policy.
    ///
    /// - Parameters:
    ///   - legalHoldPolicyId: The ID of the legal hold policy
    ///     Example: "324432"
    ///   - requestBody: Request body of updateLegalHoldPolicyById method
    ///   - headers: Headers of updateLegalHoldPolicyById method
    /// - Returns: The `LegalHoldPolicy`.
    /// - Throws: The `GeneralError`.
    public func updateLegalHoldPolicyById(legalHoldPolicyId: String, requestBody: UpdateLegalHoldPolicyByIdRequestBodyArg = UpdateLegalHoldPolicyByIdRequestBodyArg(), headers: UpdateLegalHoldPolicyByIdHeadersArg = UpdateLegalHoldPolicyByIdHeadersArg()) async throws -> LegalHoldPolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies/")\(legalHoldPolicyId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicy.deserialize(from: response.text)
    }

    /// Delete an existing legal hold policy.
    /// 
    /// This is an asynchronous process. The policy will not be
    /// fully deleted yet when the response returns.
    ///
    /// - Parameters:
    ///   - legalHoldPolicyId: The ID of the legal hold policy
    ///     Example: "324432"
    ///   - headers: Headers of deleteLegalHoldPolicyById method
    /// - Throws: The `GeneralError`.
    public func deleteLegalHoldPolicyById(legalHoldPolicyId: String, headers: DeleteLegalHoldPolicyByIdHeadersArg = DeleteLegalHoldPolicyByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policies/")\(legalHoldPolicyId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
