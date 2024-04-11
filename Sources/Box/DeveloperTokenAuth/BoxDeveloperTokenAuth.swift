import Foundation

public class BoxDeveloperTokenAuth: Authentication {
    public let token: String

    public init(token: String) {
        self.token = token
    }

    /// Retrieves stored developer token
    ///
    /// - Parameters:
    ///   - networkSession: An object to keep network session state
    /// - Returns: The `AccessToken`.
    /// - Throws: The `GeneralError`.
    public func retrieveToken(networkSession: NetworkSession? = nil) async throws -> AccessToken {
        return AccessToken(accessToken: self.token)
    }

    /// Developer token cannot be refreshed
    ///
    /// - Parameters:
    ///   - networkSession: An object to keep network session state
    /// - Returns: The `AccessToken`.
    /// - Throws: The `GeneralError`.
    public func refreshToken(networkSession: NetworkSession? = nil) async throws -> AccessToken {
        throw BoxSDKError(message: "Developer token has expired. Please provide a new one.")
    }

    public func retrieveAuthorizationHeader(networkSession: NetworkSession? = nil) async throws -> String {
        let token: AccessToken = try await self.retrieveToken(networkSession: networkSession)
        return "\("Bearer ")\(token.accessToken!)"
    }

}
