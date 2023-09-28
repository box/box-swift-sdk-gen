import Foundation

public enum PostOAuth2TokenGrantTypeField: String, CodableStringEnum {
    case authorizationCode = "authorization_code"
    case refreshToken = "refresh_token"
    case clientCredentials = "client_credentials"
    case urnIetfParamsOauthGrantTypeJwtBearer = "urn:ietf:params:oauth:grant-type:jwt-bearer"
    case urnIetfParamsOauthGrantTypeTokenExchange = "urn:ietf:params:oauth:grant-type:token-exchange"
}
