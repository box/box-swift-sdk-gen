import Foundation

public class FileVersionLegalHoldsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileVersionLegalHoldById(fileVersionLegalHoldId: String, headers: GetFileVersionLegalHoldByIdHeadersArg = GetFileVersionLegalHoldByIdHeadersArg()) async throws -> FileVersionLegalHold {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_version_legal_holds/")\(fileVersionLegalHoldId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionLegalHold.deserialize(from: response.text)
    }

    public func getFileVersionLegalHolds(queryParams: GetFileVersionLegalHoldsQueryParamsArg, headers: GetFileVersionLegalHoldsHeadersArg = GetFileVersionLegalHoldsHeadersArg()) async throws -> FileVersionLegalHolds {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["policy_id": Utils.Strings.toString(value: queryParams.policyId), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_version_legal_holds")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionLegalHolds.deserialize(from: response.text)
    }

}
