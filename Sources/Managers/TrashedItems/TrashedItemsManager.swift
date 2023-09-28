import Foundation

public class TrashedItemsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFolderTrashItems(queryParams: GetFolderTrashItemsQueryParamsArg = GetFolderTrashItemsQueryParamsArg(), headers: GetFolderTrashItemsHeadersArg = GetFolderTrashItemsHeadersArg()) async throws -> Items {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset), "usemarker": Utils.Strings.toString(value: queryParams.usemarker), "marker": Utils.Strings.toString(value: queryParams.marker), "direction": Utils.Strings.toString(value: queryParams.direction), "sort": Utils.Strings.toString(value: queryParams.sort)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/trash/items")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Items.deserialize(from: response.text)
    }

}
