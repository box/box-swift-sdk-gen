import Foundation

public class CollectionsManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves all collections for a given user.
    /// 
    /// Currently, only the `favorites` collection
    /// is supported.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getCollections method
    ///   - headers: Headers of getCollections method
    /// - Returns: The `Collections`.
    /// - Throws: The `GeneralError`.
    public func getCollections(queryParams: GetCollectionsQueryParams = GetCollectionsQueryParams(), headers: GetCollectionsHeaders = GetCollectionsHeaders()) async throws -> Collections {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "offset": Utils.Strings.toString(value: queryParams.offset), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(options: FetchOptions(url: "\(self.networkSession.baseUrls.baseUrl)\("/2.0/collections")", method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Collections.deserialize(from: response.data)
    }

    /// Retrieves the files and/or folders contained within
    /// this collection.
    ///
    /// - Parameters:
    ///   - collectionId: The ID of the collection.
    ///     Example: "926489"
    ///   - queryParams: Query parameters of getCollectionItems method
    ///   - headers: Headers of getCollectionItems method
    /// - Returns: The `Items`.
    /// - Throws: The `GeneralError`.
    public func getCollectionItems(collectionId: String, queryParams: GetCollectionItemsQueryParams = GetCollectionItemsQueryParams(), headers: GetCollectionItemsHeaders = GetCollectionItemsHeaders()) async throws -> Items {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "offset": Utils.Strings.toString(value: queryParams.offset), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(options: FetchOptions(url: "\(self.networkSession.baseUrls.baseUrl)\("/2.0/collections/")\(collectionId)\("/items")", method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Items.deserialize(from: response.data)
    }

}
