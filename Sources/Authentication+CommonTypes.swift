import Foundation

public enum TokenBoxSubjectType: String, CodableStringEnum {
    case enterprise = "enterprise"
    case user = "user"
}

public enum TokenGrantType: String, CodableStringEnum {
    case authorizationCode = "authorization_code"
    case refreshToken = "refresh_token"
    case clientCredentials = "client_credentials"
    case urnIetfParamsOauthGrantTypeJwtBearer = "urn:ietf:params:oauth:grant-type:jwt-bearer"
    case urnIetfParamsOauthGrantTypeTokenExchange = "urn:ietf:params:oauth:grant-type:token-exchange"
}

public enum SubjectTokenType: String, CodableStringEnum {
    case urnIetfParamsOauthTokenTypeAccessToken = "urn:ietf:params:oauth:token-type:access_token"
}
