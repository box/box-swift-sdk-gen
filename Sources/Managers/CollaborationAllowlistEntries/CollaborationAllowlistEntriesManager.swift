import Foundation

public class CollaborationAllowlistEntriesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getCollaborationWhitelistEntries(queryParams: GetCollaborationWhitelistEntriesQueryParamsArg = GetCollaborationWhitelistEntriesQueryParamsArg(), headers: GetCollaborationWhitelistEntriesHeadersArg = GetCollaborationWhitelistEntriesHeadersArg()) async throws -> CollaborationAllowlistEntries {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_entries")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistEntries.deserialize(from: response.text)
    }

    public func createCollaborationWhitelistEntry(requestBody: CreateCollaborationWhitelistEntryRequestBodyArg, headers: CreateCollaborationWhitelistEntryHeadersArg = CreateCollaborationWhitelistEntryHeadersArg()) async throws -> CollaborationAllowlistEntry {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_entries")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistEntry.deserialize(from: response.text)
    }

    public func getCollaborationWhitelistEntryById(collaborationWhitelistEntryId: String, headers: GetCollaborationWhitelistEntryByIdHeadersArg = GetCollaborationWhitelistEntryByIdHeadersArg()) async throws -> CollaborationAllowlistEntry {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_entries/")\(collaborationWhitelistEntryId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistEntry.deserialize(from: response.text)
    }

    public func deleteCollaborationWhitelistEntryById(collaborationWhitelistEntryId: String, headers: DeleteCollaborationWhitelistEntryByIdHeadersArg = DeleteCollaborationWhitelistEntryByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_entries/")\(collaborationWhitelistEntryId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
