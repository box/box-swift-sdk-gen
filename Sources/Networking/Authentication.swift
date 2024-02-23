import Foundation

/// Defines methods for managing session token.
public protocol Authentication {

    /// Gets access token
    ///
    /// - Parameters:
    ///   - networkSession: The Networking Session object  which  provides the URLSession
    /// - Returns: The access token
    /// - Throws: An error if for any reason the token cannot be fetched.
    func retrieveToken(networkSession: NetworkSession?) async throws -> AccessToken

    /// Refresh token
    ///
    /// - Parameters:
    ///   - networkSession: The Networking Session object  which  provides the URLSession
    /// - Returns: The refreshed access token
    /// - Throws: An error if for any reason the token cannot be refreshed.
    func refreshToken(networkSession: NetworkSession?) async throws -> AccessToken
}
