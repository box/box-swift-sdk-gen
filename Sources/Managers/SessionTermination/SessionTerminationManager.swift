import Foundation

public class SessionTerminationManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Validates the roles and permissions of the user,
    /// and creates asynchronous jobs
    /// to terminate the user's sessions.
    /// Returns the status for the POST request.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createUserTerminateSession method
    ///   - headers: Headers of createUserTerminateSession method
    /// - Returns: The `SessionTerminationMessage`.
    /// - Throws: The `GeneralError`.
    public func createUserTerminateSession(requestBody: CreateUserTerminateSessionRequestBodyArg, headers: CreateUserTerminateSessionHeadersArg = CreateUserTerminateSessionHeadersArg()) async throws -> SessionTerminationMessage {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/terminate_sessions")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SessionTerminationMessage.deserialize(from: response.data)
    }

    /// Validates the roles and permissions of the group,
    /// and creates asynchronous jobs
    /// to terminate the group's sessions.
    /// Returns the status for the POST request.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createGroupTerminateSession method
    ///   - headers: Headers of createGroupTerminateSession method
    /// - Returns: The `SessionTerminationMessage`.
    /// - Throws: The `GeneralError`.
    public func createGroupTerminateSession(requestBody: CreateGroupTerminateSessionRequestBodyArg, headers: CreateGroupTerminateSessionHeadersArg = CreateGroupTerminateSessionHeadersArg()) async throws -> SessionTerminationMessage {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups/terminate_sessions")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SessionTerminationMessage.deserialize(from: response.data)
    }

}
