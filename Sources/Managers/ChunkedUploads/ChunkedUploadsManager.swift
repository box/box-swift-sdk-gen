import Foundation

public class ChunkedUploadsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func createFileUploadSession(requestBody: CreateFileUploadSessionRequestBodyArg, headers: CreateFileUploadSessionHeadersArg = CreateFileUploadSessionHeadersArg()) async throws -> UploadSession {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/upload_sessions")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadSession.deserialize(from: response.text)
    }

    public func createFileUploadSessionForExistingFile(fileId: String, requestBody: CreateFileUploadSessionForExistingFileRequestBodyArg, headers: CreateFileUploadSessionForExistingFileHeadersArg = CreateFileUploadSessionForExistingFileHeadersArg()) async throws -> UploadSession {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/")\(fileId)\("/upload_sessions")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadSession.deserialize(from: response.text)
    }

    public func getFileUploadSessionById(uploadSessionId: String, headers: GetFileUploadSessionByIdHeadersArg = GetFileUploadSessionByIdHeadersArg()) async throws -> UploadSession {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/upload_sessions/")\(uploadSessionId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadSession.deserialize(from: response.text)
    }

    public func uploadFilePart(uploadSessionId: String, requestBody: InputStream, headers: UploadFilePartHeadersArg) async throws -> UploadedPart {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["digest": Utils.Strings.toString(value: headers.digest), "content-range": Utils.Strings.toString(value: headers.contentRange)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/upload_sessions/")\(uploadSessionId)", options: FetchOptions(method: "PUT", headers: headersMap, fileStream: requestBody, contentType: "application/octet-stream", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadedPart.deserialize(from: response.text)
    }

    public func deleteFileUploadSessionById(uploadSessionId: String, headers: DeleteFileUploadSessionByIdHeadersArg = DeleteFileUploadSessionByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/upload_sessions/")\(uploadSessionId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getFileUploadSessionParts(uploadSessionId: String, queryParams: GetFileUploadSessionPartsQueryParamsArg = GetFileUploadSessionPartsQueryParamsArg(), headers: GetFileUploadSessionPartsHeadersArg = GetFileUploadSessionPartsHeadersArg()) async throws -> UploadParts {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["offset": Utils.Strings.toString(value: queryParams.offset), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/upload_sessions/")\(uploadSessionId)\("/parts")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UploadParts.deserialize(from: response.text)
    }

    public func createFileUploadSessionCommit(uploadSessionId: String, requestBody: CreateFileUploadSessionCommitRequestBodyArg, headers: CreateFileUploadSessionCommitHeadersArg) async throws -> Files {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["digest": Utils.Strings.toString(value: headers.digest), "if-match": Utils.Strings.toString(value: headers.ifMatch), "if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://upload.box.com/api/2.0/files/upload_sessions/")\(uploadSessionId)\("/commit")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Files.deserialize(from: response.text)
    }

}
