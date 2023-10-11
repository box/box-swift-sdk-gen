import Foundation

public class AuthorizationManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Authorize a user by sending them through the [Box](https://box.com)
    /// website and request their permission to act on their behalf.
    /// 
    /// This is the first step when authenticating a user using
    /// OAuth 2.0. To request a user's authorization to use the Box APIs
    /// on their behalf you will need to send a user to the URL with this
    /// format.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getAuthorize method
    ///   - headers: Headers of getAuthorize method
    /// - Throws: The `GeneralError`.
    public func getAuthorize(queryParams: GetAuthorizeQueryParamsArg, headers: GetAuthorizeHeadersArg = GetAuthorizeHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["response_type": Utils.Strings.toString(value: queryParams.responseType), "client_id": Utils.Strings.toString(value: queryParams.clientId), "redirect_uri": Utils.Strings.toString(value: queryParams.redirectUri), "state": Utils.Strings.toString(value: queryParams.state), "scope": Utils.Strings.toString(value: queryParams.scope)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://account.box.com/api/oauth2/authorize")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
