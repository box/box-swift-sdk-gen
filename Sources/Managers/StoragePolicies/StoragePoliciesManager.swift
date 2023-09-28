import Foundation

public class StoragePoliciesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getStoragePolicies(queryParams: GetStoragePoliciesQueryParamsArg = GetStoragePoliciesQueryParamsArg(), headers: GetStoragePoliciesHeadersArg = GetStoragePoliciesHeadersArg()) async throws -> StoragePolicies {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policies")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicies.deserialize(from: response.text)
    }

    public func getStoragePolicyById(storagePolicyId: String, headers: GetStoragePolicyByIdHeadersArg = GetStoragePolicyByIdHeadersArg()) async throws -> StoragePolicy {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policies/")\(storagePolicyId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicy.deserialize(from: response.text)
    }

}
