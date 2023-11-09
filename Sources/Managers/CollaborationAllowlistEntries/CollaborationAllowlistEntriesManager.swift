import Foundation

public class CollaborationAllowlistEntriesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Returns the list domains that have been deemed safe to create collaborations
    /// for within the current enterprise.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getCollaborationWhitelistEntries method
    ///   - headers: Headers of getCollaborationWhitelistEntries method
    /// - Returns: The `CollaborationAllowlistEntries`.
    /// - Throws: The `GeneralError`.
    public func getCollaborationWhitelistEntries(queryParams: GetCollaborationWhitelistEntriesQueryParamsArg = GetCollaborationWhitelistEntriesQueryParamsArg(), headers: GetCollaborationWhitelistEntriesHeadersArg = GetCollaborationWhitelistEntriesHeadersArg()) async throws -> CollaborationAllowlistEntries {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_entries")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistEntries.deserialize(from: response.data)
    }

    /// Creates a new entry in the list of allowed domains to allow
    /// collaboration for.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createCollaborationWhitelistEntry method
    ///   - headers: Headers of createCollaborationWhitelistEntry method
    /// - Returns: The `CollaborationAllowlistEntry`.
    /// - Throws: The `GeneralError`.
    public func createCollaborationWhitelistEntry(requestBody: CreateCollaborationWhitelistEntryRequestBodyArg, headers: CreateCollaborationWhitelistEntryHeadersArg = CreateCollaborationWhitelistEntryHeadersArg()) async throws -> CollaborationAllowlistEntry {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_entries")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistEntry.deserialize(from: response.data)
    }

    /// Returns a domain that has been deemed safe to create collaborations
    /// for within the current enterprise.
    ///
    /// - Parameters:
    ///   - collaborationWhitelistEntryId: The ID of the entry in the list.
    ///     Example: "213123"
    ///   - headers: Headers of getCollaborationWhitelistEntryById method
    /// - Returns: The `CollaborationAllowlistEntry`.
    /// - Throws: The `GeneralError`.
    public func getCollaborationWhitelistEntryById(collaborationWhitelistEntryId: String, headers: GetCollaborationWhitelistEntryByIdHeadersArg = GetCollaborationWhitelistEntryByIdHeadersArg()) async throws -> CollaborationAllowlistEntry {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_entries/")\(collaborationWhitelistEntryId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistEntry.deserialize(from: response.data)
    }

    /// Removes a domain from the list of domains that have been deemed safe to create
    /// collaborations for within the current enterprise.
    ///
    /// - Parameters:
    ///   - collaborationWhitelistEntryId: The ID of the entry in the list.
    ///     Example: "213123"
    ///   - headers: Headers of deleteCollaborationWhitelistEntryById method
    /// - Throws: The `GeneralError`.
    public func deleteCollaborationWhitelistEntryById(collaborationWhitelistEntryId: String, headers: DeleteCollaborationWhitelistEntryByIdHeadersArg = DeleteCollaborationWhitelistEntryByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_entries/")\(collaborationWhitelistEntryId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
