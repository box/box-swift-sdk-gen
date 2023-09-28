import Foundation

public class InvitesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func createInvite(requestBody: CreateInviteRequestBodyArg, queryParams: CreateInviteQueryParamsArg = CreateInviteQueryParamsArg(), headers: CreateInviteHeadersArg = CreateInviteHeadersArg()) async throws -> Invite {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/invites")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Invite.deserialize(from: response.text)
    }

    public func getInviteById(inviteId: String, queryParams: GetInviteByIdQueryParamsArg = GetInviteByIdQueryParamsArg(), headers: GetInviteByIdHeadersArg = GetInviteByIdHeadersArg()) async throws -> Invite {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/invites/")\(inviteId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Invite.deserialize(from: response.text)
    }

}
