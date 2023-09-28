import Foundation

public class WebLinksManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func createWebLink(requestBody: CreateWebLinkRequestBodyArg, headers: CreateWebLinkHeadersArg = CreateWebLinkHeadersArg()) async throws -> WebLink {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.text)
    }

    public func getWebLinkById(webLinkId: String, headers: GetWebLinkByIdHeadersArg = GetWebLinkByIdHeadersArg()) async throws -> WebLink {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.text)
    }

    public func updateWebLinkById(webLinkId: String, requestBody: UpdateWebLinkByIdRequestBodyArg = UpdateWebLinkByIdRequestBodyArg(), headers: UpdateWebLinkByIdHeadersArg = UpdateWebLinkByIdHeadersArg()) async throws -> WebLink {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.text)
    }

    public func deleteWebLinkById(webLinkId: String, headers: DeleteWebLinkByIdHeadersArg = DeleteWebLinkByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
