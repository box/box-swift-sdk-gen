import Foundation

public class SharedLinksAppItemsManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Returns the app item represented by a shared link.
    /// 
    /// The link can originate from the current enterprise or another.
    ///
    /// - Parameters:
    ///   - headers: Headers of getSharedItemAppItems method
    /// - Returns: The `AppItem`.
    /// - Throws: The `GeneralError`.
    public func getSharedItemAppItems(headers: GetSharedItemAppItemsHeaders) async throws -> AppItem {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await self.networkSession.networkClient.fetch(options: FetchOptions(url: "\(self.networkSession.baseUrls.baseUrl)\("/2.0/shared_items#app_items")", method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try AppItem.deserialize(from: response.data)
    }

}
