import Foundation

public class FolderWatermarksManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFolderWatermark(folderId: String, headers: GetFolderWatermarkHeadersArg = GetFolderWatermarkHeadersArg()) async throws -> Watermark {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/watermark")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Watermark.deserialize(from: response.text)
    }

    public func updateFolderWatermark(folderId: String, requestBody: UpdateFolderWatermarkRequestBodyArg, headers: UpdateFolderWatermarkHeadersArg = UpdateFolderWatermarkHeadersArg()) async throws -> Watermark {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/watermark")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Watermark.deserialize(from: response.text)
    }

    public func deleteFolderWatermark(folderId: String, headers: DeleteFolderWatermarkHeadersArg = DeleteFolderWatermarkHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/watermark")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
