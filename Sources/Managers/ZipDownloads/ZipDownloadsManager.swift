import Foundation

public class ZipDownloadsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func createZipDownload(requestBody: ZipDownloadRequest, headers: CreateZipDownloadHeadersArg = CreateZipDownloadHeadersArg()) async throws -> ZipDownload {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/zip_downloads")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ZipDownload.deserialize(from: response.text)
    }

    public func getZipDownloadContent(zipDownloadId: String, downloadDestinationURL: URL, headers: GetZipDownloadContentHeadersArg = GetZipDownloadContentHeadersArg()) async throws -> URL {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://dl.boxcloud.com/2.0/zip_downloads/")\(zipDownloadId)\("/content")", options: FetchOptions(method: "GET", headers: headersMap, downloadDestinationURL: downloadDestinationURL, responseFormat: "binary", auth: self.auth, networkSession: self.networkSession))
        return response.downloadDestinationURL!
    }

    public func getZipDownloadStatus(zipDownloadId: String, headers: GetZipDownloadStatusHeadersArg = GetZipDownloadStatusHeadersArg()) async throws -> ZipDownloadStatus {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/zip_downloads/")\(zipDownloadId)\("/status")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ZipDownloadStatus.deserialize(from: response.text)
    }

}
