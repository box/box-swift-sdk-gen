import Foundation

public class TrashedItemsManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves the files and folders that have been moved
    /// to the trash.
    /// 
    /// Any attribute in the full files or folders objects can be passed
    /// in with the `fields` parameter to retrieve those specific
    /// attributes that are not returned by default.
    /// 
    /// This endpoint defaults to use offset-based pagination, yet also supports
    /// marker-based pagination using the `marker` parameter.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getFolderTrashItems method
    ///   - headers: Headers of getFolderTrashItems method
    /// - Returns: The `Items`.
    /// - Throws: The `GeneralError`.
    public func getFolderTrashItems(queryParams: GetFolderTrashItemsQueryParams = GetFolderTrashItemsQueryParams(), headers: GetFolderTrashItemsHeaders = GetFolderTrashItemsHeaders()) async throws -> Items {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset), "usemarker": Utils.Strings.toString(value: queryParams.usemarker), "marker": Utils.Strings.toString(value: queryParams.marker), "direction": Utils.Strings.toString(value: queryParams.direction), "sort": Utils.Strings.toString(value: queryParams.sort)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/folders/trash/items")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Items.deserialize(from: response.data)
    }

}
