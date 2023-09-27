import Foundation

public class TrashedWebLinksManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func createWebLinkById(webLinkId: String, requestBody: CreateWebLinkByIdRequestBodyArg = CreateWebLinkByIdRequestBodyArg(), queryParams: CreateWebLinkByIdQueryParamsArg = CreateWebLinkByIdQueryParamsArg(), headers: CreateWebLinkByIdHeadersArg = CreateWebLinkByIdHeadersArg()) async throws -> TrashWebLinkRestored {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashWebLinkRestored.deserialize(from: response.text)
    }

    public func getWebLinkTrash(webLinkId: String, queryParams: GetWebLinkTrashQueryParamsArg = GetWebLinkTrashQueryParamsArg(), headers: GetWebLinkTrashHeadersArg = GetWebLinkTrashHeadersArg()) async throws -> TrashWebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("/trash")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashWebLink.deserialize(from: response.text)
    }

    public func deleteWebLinkTrash(webLinkId: String, headers: DeleteWebLinkTrashHeadersArg = DeleteWebLinkTrashHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("/trash")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
