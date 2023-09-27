import Foundation

public class CollaborationAllowlistExemptTargetsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getCollaborationWhitelistExemptTargets(queryParams: GetCollaborationWhitelistExemptTargetsQueryParamsArg = GetCollaborationWhitelistExemptTargetsQueryParamsArg(), headers: GetCollaborationWhitelistExemptTargetsHeadersArg = GetCollaborationWhitelistExemptTargetsHeadersArg()) async throws -> CollaborationAllowlistExemptTargets {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_exempt_targets")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistExemptTargets.deserialize(from: response.text)
    }

    public func createCollaborationWhitelistExemptTarget(requestBody: CreateCollaborationWhitelistExemptTargetRequestBodyArg, headers: CreateCollaborationWhitelistExemptTargetHeadersArg = CreateCollaborationWhitelistExemptTargetHeadersArg()) async throws -> CollaborationAllowlistExemptTarget {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_exempt_targets")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistExemptTarget.deserialize(from: response.text)
    }

    public func getCollaborationWhitelistExemptTargetById(collaborationWhitelistExemptTargetId: String, headers: GetCollaborationWhitelistExemptTargetByIdHeadersArg = GetCollaborationWhitelistExemptTargetByIdHeadersArg()) async throws -> CollaborationAllowlistExemptTarget {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_exempt_targets/")\(collaborationWhitelistExemptTargetId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CollaborationAllowlistExemptTarget.deserialize(from: response.text)
    }

    public func deleteCollaborationWhitelistExemptTargetById(collaborationWhitelistExemptTargetId: String, headers: DeleteCollaborationWhitelistExemptTargetByIdHeadersArg = DeleteCollaborationWhitelistExemptTargetByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaboration_whitelist_exempt_targets/")\(collaborationWhitelistExemptTargetId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
