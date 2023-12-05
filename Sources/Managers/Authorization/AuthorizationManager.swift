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

    /// Request an Access Token using either a client-side obtained OAuth 2.0
    /// authorization code or a server-side JWT assertion.
    /// 
    /// An Access Token is a string that enables Box to verify that a
    /// request belongs to an authorized session. In the normal order of
    /// operations you will begin by requesting authentication from the
    /// [authorize](#get-authorize) endpoint and Box will send you an
    /// authorization code.
    /// 
    /// You will then send this code to this endpoint to exchange it for
    /// an Access Token. The returned Access Token can then be used to to make
    /// Box API calls.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createOauth2Token method
    ///   - headers: Headers of createOauth2Token method
    /// - Returns: The `AccessToken`.
    /// - Throws: The `GeneralError`.
    public func createOauth2Token(requestBody: PostOAuth2Token, headers: CreateOauth2TokenHeadersArg = CreateOauth2TokenHeadersArg()) async throws -> AccessToken {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/oauth2/token")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/x-www-form-urlencoded", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try AccessToken.deserialize(from: response.data)
    }

    /// Refresh an Access Token using its client ID, secret, and refresh token.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createOauth2TokenRefresh method
    ///   - headers: Headers of createOauth2TokenRefresh method
    /// - Returns: The `AccessToken`.
    /// - Throws: The `GeneralError`.
    public func createOauth2TokenRefresh(requestBody: PostOAuth2TokenRefreshAccessToken, headers: CreateOauth2TokenRefreshHeadersArg = CreateOauth2TokenRefreshHeadersArg()) async throws -> AccessToken {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/oauth2/token#refresh")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/x-www-form-urlencoded", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try AccessToken.deserialize(from: response.data)
    }

    /// Revoke an active Access Token, effectively logging a user out
    /// that has been previously authenticated.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createOauth2Revoke method
    ///   - headers: Headers of createOauth2Revoke method
    /// - Throws: The `GeneralError`.
    public func createOauth2Revoke(requestBody: PostOAuth2Revoke, headers: CreateOauth2RevokeHeadersArg = CreateOauth2RevokeHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/oauth2/revoke")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/x-www-form-urlencoded", responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
