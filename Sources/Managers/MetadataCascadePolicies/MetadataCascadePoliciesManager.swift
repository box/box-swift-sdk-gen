import Foundation

public class MetadataCascadePoliciesManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves a list of all the metadata cascade policies
    /// that are applied to a given folder. This can not be used on the root
    /// folder with ID `0`.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getMetadataCascadePolicies method
    ///   - headers: Headers of getMetadataCascadePolicies method
    /// - Returns: The `MetadataCascadePolicies`.
    /// - Throws: The `GeneralError`.
    public func getMetadataCascadePolicies(queryParams: GetMetadataCascadePoliciesQueryParamsArg, headers: GetMetadataCascadePoliciesHeadersArg = GetMetadataCascadePoliciesHeadersArg()) async throws -> MetadataCascadePolicies {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["folder_id": Utils.Strings.toString(value: queryParams.folderId), "owner_enterprise_id": Utils.Strings.toString(value: queryParams.ownerEnterpriseId), "marker": Utils.Strings.toString(value: queryParams.marker), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataCascadePolicies.deserialize(from: response.data)
    }

    /// Creates a new metadata cascade policy that applies a given
    /// metadata template to a given folder and automatically
    /// cascades it down to any files within that folder.
    /// 
    /// In order for the policy to be applied a metadata instance must first
    /// be applied to the folder the policy is to be applied to.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createMetadataCascadePolicy method
    ///   - headers: Headers of createMetadataCascadePolicy method
    /// - Returns: The `MetadataCascadePolicy`.
    /// - Throws: The `GeneralError`.
    public func createMetadataCascadePolicy(requestBody: CreateMetadataCascadePolicyRequestBodyArg, headers: CreateMetadataCascadePolicyHeadersArg = CreateMetadataCascadePolicyHeadersArg()) async throws -> MetadataCascadePolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataCascadePolicy.deserialize(from: response.data)
    }

    /// Retrieve a specific metadata cascade policy assigned to a folder.
    ///
    /// - Parameters:
    ///   - metadataCascadePolicyId: The ID of the metadata cascade policy.
    ///     Example: "6fd4ff89-8fc1-42cf-8b29-1890dedd26d7"
    ///   - headers: Headers of getMetadataCascadePolicyById method
    /// - Returns: The `MetadataCascadePolicy`.
    /// - Throws: The `GeneralError`.
    public func getMetadataCascadePolicyById(metadataCascadePolicyId: String, headers: GetMetadataCascadePolicyByIdHeadersArg = GetMetadataCascadePolicyByIdHeadersArg()) async throws -> MetadataCascadePolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies/")\(metadataCascadePolicyId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataCascadePolicy.deserialize(from: response.data)
    }

    /// Deletes a metadata cascade policy.
    ///
    /// - Parameters:
    ///   - metadataCascadePolicyId: The ID of the metadata cascade policy.
    ///     Example: "6fd4ff89-8fc1-42cf-8b29-1890dedd26d7"
    ///   - headers: Headers of deleteMetadataCascadePolicyById method
    /// - Throws: The `GeneralError`.
    public func deleteMetadataCascadePolicyById(metadataCascadePolicyId: String, headers: DeleteMetadataCascadePolicyByIdHeadersArg = DeleteMetadataCascadePolicyByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies/")\(metadataCascadePolicyId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Force the metadata on a folder with a metadata cascade policy to be applied to
    /// all of its children. This can be used after creating a new cascade policy to
    /// enforce the metadata to be cascaded down to all existing files within that
    /// folder.
    ///
    /// - Parameters:
    ///   - metadataCascadePolicyId: The ID of the cascade policy to force-apply.
    ///     Example: "6fd4ff89-8fc1-42cf-8b29-1890dedd26d7"
    ///   - requestBody: Request body of createMetadataCascadePolicyApply method
    ///   - headers: Headers of createMetadataCascadePolicyApply method
    /// - Throws: The `GeneralError`.
    public func createMetadataCascadePolicyApply(metadataCascadePolicyId: String, requestBody: CreateMetadataCascadePolicyApplyRequestBodyArg, headers: CreateMetadataCascadePolicyApplyHeadersArg = CreateMetadataCascadePolicyApplyHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_cascade_policies/")\(metadataCascadePolicyId)\("/apply")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
