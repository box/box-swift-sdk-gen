import Foundation

public class FileVersionRetentionsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileVersionRetentions(queryParams: GetFileVersionRetentionsQueryParamsArg = GetFileVersionRetentionsQueryParamsArg(), headers: GetFileVersionRetentionsHeadersArg = GetFileVersionRetentionsHeadersArg()) async throws -> FileVersionRetentions {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["file_id": Utils.Strings.toString(value: queryParams.fileId), "file_version_id": Utils.Strings.toString(value: queryParams.fileVersionId), "policy_id": Utils.Strings.toString(value: queryParams.policyId), "disposition_action": Utils.Strings.toString(value: queryParams.dispositionAction), "disposition_before": Utils.Strings.toString(value: queryParams.dispositionBefore), "disposition_after": Utils.Strings.toString(value: queryParams.dispositionAfter), "limit": Utils.Strings.toString(value: queryParams.limit), "marker": Utils.Strings.toString(value: queryParams.marker)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_version_retentions")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionRetentions.deserialize(from: response.text)
    }

    public func getFileVersionRetentionById(fileVersionRetentionId: String, headers: GetFileVersionRetentionByIdHeadersArg = GetFileVersionRetentionByIdHeadersArg()) async throws -> FileVersionRetention {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_version_retentions/")\(fileVersionRetentionId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionRetention.deserialize(from: response.text)
    }

}
