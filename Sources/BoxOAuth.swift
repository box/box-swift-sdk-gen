import Foundation
#if os(iOS) || os(macOS)
import AuthenticationServices
#endif

/// Configuration for OAuth 2.0 authentication
public class OAuthConfig {

    /// The client ID of the application requesting authentication
    public let clientId: String

    /// The Box client secret of the application requesting authentication
    public let clientSecret: String

    ///Object responsible for storing token.
    public let tokenStorage: TokenStorage

    ///  Initializer
    ///
    /// - Parameters:
    ///   - clientId: The client ID of the application requesting authentication.
    ///   - clientSecret: The Box client secret of the application requesting authentication
    ///   - tokenStorage: Object responsible for storing token. If no custom implementation provided, the token will be stored in memory.
    public init(
        clientId: String,
        clientSecret: String,
        tokenStorage: TokenStorage = InMemoryTokenStorage()
    ) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.tokenStorage = tokenStorage
    }
}

/// The parameters for the authorization URL
public struct AuthorizeUrlParams {
    /// The Client ID of the application that is requesting to authenticate the user.
    public let clientId: String?
    /// The URL to which Box redirects the browser when authentication completes.
    /// The user's actual interaction with your application begins when Box redirects to this URL.
    public let redirectUri: String?
    /// The type of response we'd like to receive. Must be 'code'.
    public let responseType: String?
    /// A custom string of your choice. Box will pass the same string to the redirect URL when authentication is complete.
    public let state: String?
    /// A comma-separated list of application scopes you'd like to authenticate the user for.
    public let scope: String?

    /// Initializer.
    ///
    /// - Parameters:
    ///   - clientId: The client ID of the application requesting authentication.
    ///   - redirectUri: The URL to which Box redirects the browser when authentication completes.
    ///   - responseType: he type of response we'd like to receive. Must be 'code'.
    ///   - state: A custom string of your choice. Box will pass the same string to the redirect URL when authentication is complete.
    ///   - scope: A comma-separated list of application scopes you'd like to authenticate the user for.
    public init(clientId: String? = nil, redirectUri: String? = nil, responseType: String? = nil, state: String? = nil, scope: String? = nil) {
        self.clientId = clientId
        self.redirectUri = redirectUri
        self.responseType = responseType
        self.state = state
        self.scope = scope
    }
}

/// OAuth Authentication
public class BoxOAuth: Authentication {

    /// URL for the OAuth2 authorization page, where users are redirected to enter their credentials
    private static let defaultOAuthAuthorizeUrl = "https://account.box.com/api/oauth2/authorize"

    /// Configuration object of BoxOAuth
    public let config: OAuthConfig

    /// Token storage
    public let tokenStorage: TokenStorage

    /// Initializer
    ///
    /// - Parameters:
    ///   - config: Configuration object of BoxOAuth
    public init(config: OAuthConfig) {
        self.config = config
        self.tokenStorage = config.tokenStorage
    }

    /// Creates OAuth2 authorization URL you can use in browser to authorize.
    ///
    /// - Parameters:
    ///   - options: The parameters for the authorization URL.
    /// - Returns: The String object which represents the URL to be used for authorization in external browser.
    public func getAuthorizeUrl(options: AuthorizeUrlParams? = nil) -> String {
        var params: [String: String] = [
            "client_id": options?.clientId ?? self.config.clientId,
            "response_type": options?.responseType ?? "code"
        ]

        if let redirectUri = options?.redirectUri {
            params["redirect_uri"] = redirectUri
        }

        if let state = options?.state {
            params["state"] = state
        }

        if let scope = options?.scope {
            params["scope"] = scope
        }

        var components = URLComponents(url: URL(string: BoxOAuth.defaultOAuthAuthorizeUrl)!, resolvingAgainstBaseURL: true)!
        components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url!.absoluteString
    }

    /// Acquires token info using an authorization code.
    ///
    /// - Parameters:
    ///   - authorizationCode: The authorization code acquired from the first step of the OAuth 2.0 process.
    ///   - networkSession: The Networking Session object which provides the URLSession
    /// - Returns: The access token.
    /// - Throws: An error if for any reason the token cannot be acquired.
    public func getTokensAuthorizationCodeGrant(authorizationCode: String, networkSession: NetworkSession? = nil) async throws -> AccessToken {
        let body: [String: String] = [
            "grant_type": TokenGrantType.authorizationCode.rawValue,
            "client_id": self.config.clientId,
            "client_secret" :self.config.clientSecret,
            "code": authorizationCode
        ]

        let token = try await sendTokenRequest(body: body, networkSession: networkSession)
        try await self.tokenStorage.store(token: token)
        return token
    }

    /// Returns a current access token when available.
    ///
    /// - Parameters:
    ///   - networkSession: The Networking Session object which provides the URLSession
    /// - Returns: The access
    /// - Throws: An error if for any reason the token cannot be fetched.
    public func retrieveToken(networkSession: NetworkSession? = nil) async throws -> AccessToken {
        let token = try await self.tokenStorage.get()
        if let token {
            return token
        }

        return try await refreshToken(networkSession: networkSession)
    }

    /// Refresh token
    ///
    /// - Parameters:
    ///   - networkSession: The Networking Session object  which  provides the URLSession
    /// - Returns: The refreshed access
    /// - Throws: An error if for any reason the token cannot be refreshed.
    public func refreshToken(networkSession: NetworkSession? = nil) async throws -> AccessToken {
        let token = try await self.tokenStorage.get()

        guard let refreshToken = token?.refreshToken else {
            throw AuthError(message: .refreshTokenNotFound)
        }

        let body: [String: String] = [
            "grant_type": TokenGrantType.refreshToken.rawValue,
            "client_id": self.config.clientId,
            "client_secret" :self.config.clientSecret,
            "refresh_token": refreshToken
        ]

        let newToken = try await sendTokenRequest(body: body, networkSession: networkSession)
        try await self.tokenStorage.store(token: newToken)
        return newToken
    }

    /// Acquires a token based on the passed parameters.
    ///
    /// - Parameters:
    ///   - body: A dictionary of parameters that will be used to create the request body.
    ///   - networkSession: The Networking Session object  which  provides the URLSession
    /// - Returns: The refreshed access
    /// - Throws: An error if for any reason the token cannot be fetched.
    private func sendTokenRequest(body: [String: String], networkSession: NetworkSession? = nil) async throws -> AccessToken {
        let response: FetchResponse = try await NetworkClient.shared.fetch(
            url: "https://api.box.com/oauth2/token",
            options: FetchOptions(
                method: .post,
                body: Utils.Url.urlEncodeFrom(dictionary: body),
                contentType: "application/x-www-form-urlencoded",
                networkSession: networkSession
            )
        )

        return try AccessToken.decode(from: response.content)
    }

#if os(iOS) || os(macOS)
    /// The complete authorization code flow which opens a secure web view,
    /// where users enter their login credentials to obtain an authorization code, which is then exchanged for an access token.
    ///
    /// This requires that the application using the SDK registers itself for a custom URL scheme of the
    /// format `boxsdk-<<CLIENT ID>>://boxsdkoauth2redirect`
    ///
    /// As the result of this method, an access token will be returned and the `AccessTokenRepresentation`
    /// will be stored in the current instance for future use.
    ///
    /// - Parameters:
    ///   - options: The parameters for the authorization URL.
    ///     If `options.redirectUri` is not set, then the field  will be automatically set according to the established format `boxsdk-<<CLIENT ID>>://boxsdkoauth2redirect`,
    ///     where `<<CLIENT_ID>>` will be replaced with the actual `clientId` from the config.
    ///   - context: A context to target where in an application's UI the authorization view should be shown.
    /// - Returns: The access token.
    /// - Throws: An error if for any reason the token cannot be fetched.
    @discardableResult
    public func runLoginFlow(
        options: AuthorizeUrlParams,
        context: ASWebAuthenticationPresentationContextProviding
    ) async throws -> AccessToken {
        let redirectUri = BoxOAuthWebAuthentication.getCallbackUrlScheme(
            redirectUri: options.redirectUri,
            clientId: self.config.clientId
        )
        let authorizeOptions = AuthorizeUrlParams(
            clientId: options.clientId,
            redirectUri: options.redirectUri ?? redirectUri,
            responseType: options.responseType,
            state: options.state,
            scope: options.scope
        )

        let webAuthentication = BoxOAuthWebAuthentication(
            authorizeUrl: getAuthorizeUrl(options: authorizeOptions)
        )

        let code = try await webAuthentication.obtainAuthorizationCode(
            options: authorizeOptions,
            context: context
        )

        return try await getTokensAuthorizationCodeGrant(authorizationCode: code)
    }
#endif
}
