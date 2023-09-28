import Foundation

public class UploadsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func uploadFileVersion(fileId: String, requestBody: UploadFileVersionRequestBodyArg, queryParams: UploadFileVersionQueryParamsArg = UploadFileVersionQueryParamsArg(), headers: UploadFileVersionHeadersArg = UploadFileVersionHeadersArg()) async throws -> Files {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-match": Utils.Strings.toString(value: headers.ifMatch), "content-md5": Utils.Strings.toString(value: headers.contentMd5)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/")\(fileId)\("/content")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, multipartData: [MultipartItem(partName: "attributes", body: requestBody.attributes.serialize()), MultipartItem(partName: "file", fileStream: requestBody.file, fileName: requestBody.fileFileName, contentType: requestBody.fileContentType)], contentType: "multipart/form-data", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Files.deserialize(from: response.text)
    }

    public func uploadFile(requestBody: UploadFileRequestBodyArg, queryParams: UploadFileQueryParamsArg = UploadFileQueryParamsArg(), headers: UploadFileHeadersArg = UploadFileHeadersArg()) async throws -> Files {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["content-md5": Utils.Strings.toString(value: headers.contentMd5)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/content")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, multipartData: [MultipartItem(partName: "attributes", body: requestBody.attributes.serialize()), MultipartItem(partName: "file", fileStream: requestBody.file, fileName: requestBody.fileFileName, contentType: requestBody.fileContentType)], contentType: "multipart/form-data", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Files.deserialize(from: response.text)
    }

    public func preflightFileUpload(requestBody: PreflightFileUploadRequestBodyArg = PreflightFileUploadRequestBodyArg(), headers: PreflightFileUploadHeadersArg = PreflightFileUploadHeadersArg()) async throws -> UploadUrl {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/content")", options: FetchOptions(method: "OPTIONS", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadUrl.deserialize(from: response.text)
    }

}
