import Foundation

public class DownloadsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func downloadFile(fileId: String, downloadDestinationURL: URL, queryParams: DownloadFileQueryParamsArg = DownloadFileQueryParamsArg(), headers: DownloadFileHeadersArg = DownloadFileHeadersArg()) async throws -> URL {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["version": Utils.Strings.toString(value: queryParams.version), "access_token": Utils.Strings.toString(value: queryParams.accessToken)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["range": Utils.Strings.toString(value: headers.range), "boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/content")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, downloadDestinationURL: downloadDestinationURL, responseFormat: "binary", auth: self.auth, networkSession: self.networkSession))
        return response.downloadDestinationURL!
    }

}
