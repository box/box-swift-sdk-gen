import Foundation

public class SharedLinksWebLinksManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getSharedItemWebLinks(queryParams: GetSharedItemWebLinksQueryParamsArg = GetSharedItemWebLinksQueryParamsArg(), headers: GetSharedItemWebLinksHeadersArg) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch), "boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shared_items#web_links")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.text)
    }

    public func getWebLinkGetSharedLink(webLinkId: String, queryParams: GetWebLinkGetSharedLinkQueryParamsArg, headers: GetWebLinkGetSharedLinkHeadersArg = GetWebLinkGetSharedLinkHeadersArg()) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("#get_shared_link")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.text)
    }

    public func updateWebLinkAddSharedLink(webLinkId: String, requestBody: UpdateWebLinkAddSharedLinkRequestBodyArg = UpdateWebLinkAddSharedLinkRequestBodyArg(), queryParams: UpdateWebLinkAddSharedLinkQueryParamsArg, headers: UpdateWebLinkAddSharedLinkHeadersArg = UpdateWebLinkAddSharedLinkHeadersArg()) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("#add_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.text)
    }

    public func updateWebLinkUpdateSharedLink(webLinkId: String, requestBody: UpdateWebLinkUpdateSharedLinkRequestBodyArg = UpdateWebLinkUpdateSharedLinkRequestBodyArg(), queryParams: UpdateWebLinkUpdateSharedLinkQueryParamsArg, headers: UpdateWebLinkUpdateSharedLinkHeadersArg = UpdateWebLinkUpdateSharedLinkHeadersArg()) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("#update_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.text)
    }

    public func updateWebLinkRemoveSharedLink(webLinkId: String, requestBody: UpdateWebLinkRemoveSharedLinkRequestBodyArg = UpdateWebLinkRemoveSharedLinkRequestBodyArg(), queryParams: UpdateWebLinkRemoveSharedLinkQueryParamsArg, headers: UpdateWebLinkRemoveSharedLinkHeadersArg = UpdateWebLinkRemoveSharedLinkHeadersArg()) async throws -> WebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("#remove_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.text)
    }

}
