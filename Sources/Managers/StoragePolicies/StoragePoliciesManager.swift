import Foundation

public class StoragePoliciesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Fetches all the storage policies in the enterprise.
    /// Only a Primary Admin can access this endpoint. The user
    /// needs to generate a token for an account to authenticate this request.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getStoragePolicies method
    ///   - headers: Headers of getStoragePolicies method
    /// - Returns: The `StoragePolicies`.
    /// - Throws: The `GeneralError`.
    public func getStoragePolicies(queryParams: GetStoragePoliciesQueryParamsArg = GetStoragePoliciesQueryParamsArg(), headers: GetStoragePoliciesHeadersArg = GetStoragePoliciesHeadersArg()) async throws -> StoragePolicies {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policies")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicies.deserialize(from: response.text)
    }

    /// Fetches a specific storage policy. Only a Primary Admin can access this endpoint. The user needs to generate a token for an account to authenticate this request.
    ///
    /// - Parameters:
    ///   - storagePolicyId: The ID of the storage policy.
    ///     Example: "34342"
    ///   - headers: Headers of getStoragePolicyById method
    /// - Returns: The `StoragePolicy`.
    /// - Throws: The `GeneralError`.
    public func getStoragePolicyById(storagePolicyId: String, headers: GetStoragePolicyByIdHeadersArg = GetStoragePolicyByIdHeadersArg()) async throws -> StoragePolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policies/")\(storagePolicyId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicy.deserialize(from: response.text)
    }

}
