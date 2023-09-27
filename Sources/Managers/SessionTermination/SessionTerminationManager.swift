import Foundation

public class SessionTerminationManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func createUserTerminateSession(requestBody: CreateUserTerminateSessionRequestBodyArg, headers: CreateUserTerminateSessionHeadersArg = CreateUserTerminateSessionHeadersArg()) async throws -> SessionTerminationMessage {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/terminate_sessions")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SessionTerminationMessage.deserialize(from: response.text)
    }

    public func createGroupTerminateSession(requestBody: CreateGroupTerminateSessionRequestBodyArg, headers: CreateGroupTerminateSessionHeadersArg = CreateGroupTerminateSessionHeadersArg()) async throws -> SessionTerminationMessage {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups/terminate_sessions")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SessionTerminationMessage.deserialize(from: response.text)
    }

}
