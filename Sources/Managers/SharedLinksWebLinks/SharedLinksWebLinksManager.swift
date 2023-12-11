import Foundation

public class SharedLinksWebLinksManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Returns the web link represented by a shared link.
    /// 
    /// A shared web link can be represented by a shared link,
    /// which can originate within the current enterprise or within another.
    /// 
    /// This endpoint allows an application to retrieve information about a
    /// shared web link when only given a shared link.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getSharedItemWebLinks method
    ///   - headers: Headers of getSharedItemWebLinks method
    /// - Returns: The `WebLink`.
    /// - Throws: The `GeneralError`.
    public func getSharedItemWebLinks(queryParams: GetSharedItemWebLinksQueryParamsArg = GetSharedItemWebLinksQueryParamsArg(), headers: GetSharedItemWebLinksHeadersArg) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch), "boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shared_items#web_links")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.data)
    }

    /// Gets the information for a shared link on a web link.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - queryParams: Query parameters of getWebLinkGetSharedLink method
    ///   - headers: Headers of getWebLinkGetSharedLink method
    /// - Returns: The `WebLink`.
    /// - Throws: The `GeneralError`.
    public func getWebLinkGetSharedLink(webLinkId: String, queryParams: GetWebLinkGetSharedLinkQueryParamsArg, headers: GetWebLinkGetSharedLinkHeadersArg = GetWebLinkGetSharedLinkHeadersArg()) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("#get_shared_link")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.data)
    }

    /// Adds a shared link to a web link.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateWebLinkAddSharedLink method
    ///   - queryParams: Query parameters of updateWebLinkAddSharedLink method
    ///   - headers: Headers of updateWebLinkAddSharedLink method
    /// - Returns: The `WebLink`.
    /// - Throws: The `GeneralError`.
    public func updateWebLinkAddSharedLink(webLinkId: String, requestBody: UpdateWebLinkAddSharedLinkRequestBodyArg = UpdateWebLinkAddSharedLinkRequestBodyArg(), queryParams: UpdateWebLinkAddSharedLinkQueryParamsArg, headers: UpdateWebLinkAddSharedLinkHeadersArg = UpdateWebLinkAddSharedLinkHeadersArg()) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("#add_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.data)
    }

    /// Updates a shared link on a web link.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateWebLinkUpdateSharedLink method
    ///   - queryParams: Query parameters of updateWebLinkUpdateSharedLink method
    ///   - headers: Headers of updateWebLinkUpdateSharedLink method
    /// - Returns: The `WebLink`.
    /// - Throws: The `GeneralError`.
    public func updateWebLinkUpdateSharedLink(webLinkId: String, requestBody: UpdateWebLinkUpdateSharedLinkRequestBodyArg = UpdateWebLinkUpdateSharedLinkRequestBodyArg(), queryParams: UpdateWebLinkUpdateSharedLinkQueryParamsArg, headers: UpdateWebLinkUpdateSharedLinkHeadersArg = UpdateWebLinkUpdateSharedLinkHeadersArg()) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("#update_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.data)
    }

    /// Removes a shared link from a web link.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateWebLinkRemoveSharedLink method
    ///   - queryParams: Query parameters of updateWebLinkRemoveSharedLink method
    ///   - headers: Headers of updateWebLinkRemoveSharedLink method
    /// - Returns: The `WebLink`.
    /// - Throws: The `GeneralError`.
    public func updateWebLinkRemoveSharedLink(webLinkId: String, requestBody: UpdateWebLinkRemoveSharedLinkRequestBodyArg = UpdateWebLinkRemoveSharedLinkRequestBodyArg(), queryParams: UpdateWebLinkRemoveSharedLinkQueryParamsArg, headers: UpdateWebLinkRemoveSharedLinkHeadersArg = UpdateWebLinkRemoveSharedLinkHeadersArg()) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("#remove_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.data)
    }

}
