import Foundation

public class ZipDownloadsManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Creates a request to download multiple files and folders as a single `zip`
    /// archive file. This API does not return the archive but instead performs all
    /// the checks to ensure that the user has access to all the items, and then
    /// returns a `download_url` and a `status_url` that can be used to download the
    /// archive.
    /// 
    /// The limit for an archive is either the Account's upload limit or
    /// 10,000 files, whichever is met first.
    /// 
    /// **Note**: Downloading a large file can be
    /// affected by various
    /// factors such as distance, network latency,
    /// bandwidth, and congestion, as well as packet loss
    /// ratio and current server load.
    /// For these reasons we recommend that a maximum ZIP archive
    /// total size does not exceed 25GB.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createZipDownload method
    ///   - headers: Headers of createZipDownload method
    /// - Returns: The `ZipDownload`.
    /// - Throws: The `GeneralError`.
    public func createZipDownload(requestBody: ZipDownloadRequest, headers: CreateZipDownloadHeaders = CreateZipDownloadHeaders()) async throws -> ZipDownload {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await self.networkSession.networkClient.fetch(options: FetchOptions(url: "\(self.networkSession.baseUrls.baseUrl)\("/2.0/zip_downloads")", method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: ResponseFormat.json, auth: self.auth, networkSession: self.networkSession))
        return try ZipDownload.deserialize(from: response.data!)
    }

    /// Returns the contents of a `zip` archive in binary format. This URL does not
    /// require any form of authentication and could be used in a user's browser to
    /// download the archive to a user's device.
    /// 
    /// By default, this URL is only valid for a few seconds from the creation of
    /// the request for this archive. Once a download has started it can not be
    /// stopped and resumed, instead a new request for a zip archive would need to
    /// be created.
    /// 
    /// The URL of this endpoint should not be considered as fixed. Instead, use
    /// the [Create zip download](e://post_zip_downloads) API to request to create a
    /// `zip` archive, and then follow the `download_url` field in the response to
    /// this endpoint.
    ///
    /// - Parameters:
    ///   - downloadUrl: The URL that can be used to download created `zip` archive.
    ///      Example: `https://dl.boxcloud.com/2.0/zip_downloads/29l00nfxDyHOt7RphI9zT_w==nDnZEDjY2S8iEWWCHEEiptFxwoWojjlibZjJ6geuE5xnXENDTPxzgbks_yY=/content`
    ///   - downloadDestinationUrl: The URL on disk where the file will be saved once it has been downloaded.
    ///   - headers: Headers of getZipDownloadContent method
    /// - Returns: The `URL?`.
    /// - Throws: The `GeneralError`.
    public func getZipDownloadContent(downloadUrl: String, downloadDestinationUrl: URL, headers: GetZipDownloadContentHeaders = GetZipDownloadContentHeaders()) async throws -> URL? {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await self.networkSession.networkClient.fetch(options: FetchOptions(url: downloadUrl, method: "GET", headers: headersMap, responseFormat: ResponseFormat.binary, downloadDestinationUrl: downloadDestinationUrl, auth: self.auth, networkSession: self.networkSession))
        return response.downloadDestinationUrl!
    }

    /// Returns the download status of a `zip` archive, allowing an application to
    /// inspect the progress of the download as well as the number of items that
    /// might have been skipped.
    /// 
    /// This endpoint can only be accessed once the download has started.
    /// Subsequently this endpoint is valid for 12 hours from the start of the
    /// download.
    /// 
    /// The URL of this endpoint should not be considered as fixed. Instead, use
    /// the [Create zip download](e://post_zip_downloads) API to request to create a
    /// `zip` archive, and then follow the `status_url` field in the response to
    /// this endpoint.
    ///
    /// - Parameters:
    ///   - statusUrl: The URL that can be used to get the status of the `zip` archive being downloaded.
    ///      Example: `https://dl.boxcloud.com/2.0/zip_downloads/29l00nfxDyHOt7RphI9zT_w==nDnZEDjY2S8iEWWCHEEiptFxwoWojjlibZjJ6geuE5xnXENDTPxzgbks_yY=/status`
    ///   - headers: Headers of getZipDownloadStatus method
    /// - Returns: The `ZipDownloadStatus`.
    /// - Throws: The `GeneralError`.
    public func getZipDownloadStatus(statusUrl: String, headers: GetZipDownloadStatusHeaders = GetZipDownloadStatusHeaders()) async throws -> ZipDownloadStatus {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await self.networkSession.networkClient.fetch(options: FetchOptions(url: statusUrl, method: "GET", headers: headersMap, responseFormat: ResponseFormat.json, auth: self.auth, networkSession: self.networkSession))
        return try ZipDownloadStatus.deserialize(from: response.data!)
    }

    /// Creates a zip and downloads its content
    ///
    /// - Parameters:
    ///   - requestBody: Zip download request body
    ///   - downloadDestinationUrl: The URL on disk where the file will be saved once it has been downloaded.
    ///   - headers: Headers of zip download method
    /// - Returns: The `URL?`.
    /// - Throws: The `GeneralError`.
    public func downloadZip(requestBody: ZipDownloadRequest, downloadDestinationUrl: URL, headers: DownloadZipHeaders = DownloadZipHeaders()) async throws -> URL? {
        let zipDownloadSession: ZipDownload = try await self.createZipDownload(requestBody: ZipDownloadRequest(items: requestBody.items, downloadFileName: requestBody.downloadFileName), headers: CreateZipDownloadHeaders(extraHeaders: headers.extraHeaders))
        return try await self.getZipDownloadContent(downloadUrl: zipDownloadSession.downloadUrl!, downloadDestinationUrl: downloadDestinationUrl, headers: GetZipDownloadContentHeaders(extraHeaders: headers.extraHeaders))
    }

}
