import Foundation

public class EmailAliasesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getUserEmailAliases(userId: String, headers: GetUserEmailAliasesHeadersArg = GetUserEmailAliasesHeadersArg()) async throws -> EmailAliases {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/email_aliases")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try EmailAliases.deserialize(from: response.text)
    }

    public func createUserEmailAlias(userId: String, requestBody: CreateUserEmailAliasRequestBodyArg, headers: CreateUserEmailAliasHeadersArg = CreateUserEmailAliasHeadersArg()) async throws -> EmailAlias {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/email_aliases")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try EmailAlias.deserialize(from: response.text)
    }

    public func deleteUserEmailAliasById(userId: String, emailAliasId: String, headers: DeleteUserEmailAliasByIdHeadersArg = DeleteUserEmailAliasByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/email_aliases/")\(emailAliasId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
