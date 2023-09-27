import Foundation

public class AuthorizationManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getAuthorize(queryParams: GetAuthorizeQueryParamsArg, headers: GetAuthorizeHeadersArg = GetAuthorizeHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["response_type": Utils.Strings.toString(value: queryParams.responseType), "client_id": Utils.Strings.toString(value: queryParams.clientId), "redirect_uri": Utils.Strings.toString(value: queryParams.redirectUri), "state": Utils.Strings.toString(value: queryParams.state), "scope": Utils.Strings.toString(value: queryParams.scope)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://account.box.com/api/oauth2/authorize")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
