import Foundation

public class FilesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileById(fileId: String, queryParams: GetFileByIdQueryParamsArg = GetFileByIdQueryParamsArg(), headers: GetFileByIdHeadersArg = GetFileByIdHeadersArg()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch), "boxapi": Utils.Strings.toString(value: headers.boxapi), "x-rep-hints": Utils.Strings.toString(value: headers.xRepHints)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.text)
    }

    public func updateFileById(fileId: String, requestBody: UpdateFileByIdRequestBodyArg = UpdateFileByIdRequestBodyArg(), queryParams: UpdateFileByIdQueryParamsArg = UpdateFileByIdQueryParamsArg(), headers: UpdateFileByIdHeadersArg = UpdateFileByIdHeadersArg()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-match": Utils.Strings.toString(value: headers.ifMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.text)
    }

    public func deleteFileById(fileId: String, headers: DeleteFileByIdHeadersArg = DeleteFileByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-match": Utils.Strings.toString(value: headers.ifMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func copyFile(fileId: String, requestBody: CopyFileRequestBodyArg, queryParams: CopyFileQueryParamsArg = CopyFileQueryParamsArg(), headers: CopyFileHeadersArg = CopyFileHeadersArg()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/copy")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.text)
    }

    public func getFileThumbnailById(fileId: String, extension_: GetFileThumbnailByIdExtensionArg, downloadDestinationURL: URL, queryParams: GetFileThumbnailByIdQueryParamsArg = GetFileThumbnailByIdQueryParamsArg(), headers: GetFileThumbnailByIdHeadersArg = GetFileThumbnailByIdHeadersArg()) async throws -> URL {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["min_height": Utils.Strings.toString(value: queryParams.minHeight), "min_width": Utils.Strings.toString(value: queryParams.minWidth), "max_height": Utils.Strings.toString(value: queryParams.maxHeight), "max_width": Utils.Strings.toString(value: queryParams.maxWidth)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/thumbnail.")\(extension_)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, downloadDestinationURL: downloadDestinationURL, responseFormat: "binary", auth: self.auth, networkSession: self.networkSession))
        return response.downloadDestinationURL!
    }

}
