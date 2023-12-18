import Foundation

public class SessionTerminationManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Validates the roles and permissions of the user,
    /// and creates asynchronous jobs
    /// to terminate the user's sessions.
    /// Returns the status for the POST request.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of terminateUsersSessions method
    ///   - headers: Headers of terminateUsersSessions method
    /// - Returns: The `SessionTerminationMessage`.
    /// - Throws: The `GeneralError`.
    public func terminateUsersSessions(requestBody: TerminateUsersSessionsRequestBody, headers: TerminateUsersSessionsHeaders = TerminateUsersSessionsHeaders()) async throws -> SessionTerminationMessage {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/users/terminate_sessions")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SessionTerminationMessage.deserialize(from: response.data)
    }

    /// Validates the roles and permissions of the group,
    /// and creates asynchronous jobs
    /// to terminate the group's sessions.
    /// Returns the status for the POST request.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of terminateGroupsSessions method
    ///   - headers: Headers of terminateGroupsSessions method
    /// - Returns: The `SessionTerminationMessage`.
    /// - Throws: The `GeneralError`.
    public func terminateGroupsSessions(requestBody: TerminateGroupsSessionsRequestBody, headers: TerminateGroupsSessionsHeaders = TerminateGroupsSessionsHeaders()) async throws -> SessionTerminationMessage {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/groups/terminate_sessions")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SessionTerminationMessage.deserialize(from: response.data)
    }

}
