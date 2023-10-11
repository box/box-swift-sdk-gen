import Foundation

/// A request to refresh an Access Token. Use this API to refresh an expired
/// Access Token using a valid Refresh Token.
public class PostOAuth2TokenRefreshAccessToken: Codable {
    private enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case refreshToken = "refresh_token"
    }

    /// The type of request being made, in this case a refresh request.
    public let grantType: PostOAuth2TokenRefreshAccessTokenGrantTypeField
    /// The client ID of the application requesting to refresh the token.
    public let clientId: String
    /// The client secret of the application requesting to refresh the token.
    public let clientSecret: String
    /// The refresh token to refresh.
    public let refreshToken: String

    /// Initializer for a PostOAuth2TokenRefreshAccessToken.
    ///
    /// - Parameters:
    ///   - grantType: The type of request being made, in this case a refresh request.
    ///   - clientId: The client ID of the application requesting to refresh the token.
    ///   - clientSecret: The client secret of the application requesting to refresh the token.
    ///   - refreshToken: The refresh token to refresh.
    public init(grantType: PostOAuth2TokenRefreshAccessTokenGrantTypeField, clientId: String, clientSecret: String, refreshToken: String) {
        self.grantType = grantType
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.refreshToken = refreshToken
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        grantType = try container.decode(PostOAuth2TokenRefreshAccessTokenGrantTypeField.self, forKey: .grantType)
        clientId = try container.decode(String.self, forKey: .clientId)
        clientSecret = try container.decode(String.self, forKey: .clientSecret)
        refreshToken = try container.decode(String.self, forKey: .refreshToken)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(grantType, forKey: .grantType)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(refreshToken, forKey: .refreshToken)
    }
}
