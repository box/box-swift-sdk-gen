import Foundation

public class MetadataCascadePoliciesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getMetadataCascadePolicies(queryParams: GetMetadataCascadePoliciesQueryParamsArg, headers: GetMetadataCascadePoliciesHeadersArg = GetMetadataCascadePoliciesHeadersArg()) async throws -> MetadataCascadePolicies {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["folder_id": Utils.Strings.toString(value: queryParams.folderId), "owner_enterprise_id": Utils.Strings.toString(value: queryParams.ownerEnterpriseId), "marker": Utils.Strings.toString(value: queryParams.marker), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataCascadePolicies.deserialize(from: response.text)
    }

    public func createMetadataCascadePolicy(requestBody: CreateMetadataCascadePolicyRequestBodyArg, headers: CreateMetadataCascadePolicyHeadersArg = CreateMetadataCascadePolicyHeadersArg()) async throws -> MetadataCascadePolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataCascadePolicy.deserialize(from: response.text)
    }

    public func getMetadataCascadePolicyById(metadataCascadePolicyId: String, headers: GetMetadataCascadePolicyByIdHeadersArg = GetMetadataCascadePolicyByIdHeadersArg()) async throws -> MetadataCascadePolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies/")\(metadataCascadePolicyId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataCascadePolicy.deserialize(from: response.text)
    }

    public func deleteMetadataCascadePolicyById(metadataCascadePolicyId: String, headers: DeleteMetadataCascadePolicyByIdHeadersArg = DeleteMetadataCascadePolicyByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies/")\(metadataCascadePolicyId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func createMetadataCascadePolicyApply(metadataCascadePolicyId: String, requestBody: CreateMetadataCascadePolicyApplyRequestBodyArg, headers: CreateMetadataCascadePolicyApplyHeadersArg = CreateMetadataCascadePolicyApplyHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies/")\(metadataCascadePolicyId)\("/apply")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
