import Foundation

/// Developer Token session management.
public class BoxDeveloperTokenAuth: Authentication {

    /// Access token
    private let token: AccessToken

    ///  Initializer.
    ///
    /// - Parameter token: Developer token used for authentication.
    public init(token: String) {
        self.token = AccessToken(accessToken: token)
    }

    /// Gets access token
    ///
    /// - Parameters:
    ///   - networkSession: The Networking Session object which  provides the URLSession.
    /// - Returns: The access token.
    /// - Throws: An error if for any reason the token cannot be fetched.
    public func retrieveToken(networkSession: NetworkSession? = nil) async throws -> AccessToken {
        return self.token
    }

    /// Refresh token.
    ///
    /// - Parameters:
    ///   - networkSession: The Networking Session object  which  provides the URLSession.
    /// - Returns: The refreshed access token.
    /// - Throws: An error if for any reason the token cannot be refreshed.
    public func refreshToken(networkSession: NetworkSession? = nil) async throws -> AccessToken {
        throw AuthError(message: "Developer token has expired. Please provide a new one.")
    }
}
