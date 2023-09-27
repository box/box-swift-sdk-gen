import Foundation

public class FileRequestsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileRequestById(fileRequestId: String, headers: GetFileRequestByIdHeadersArg = GetFileRequestByIdHeadersArg()) async throws -> FileRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_requests/")\(fileRequestId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileRequest.deserialize(from: response.text)
    }

    public func updateFileRequestById(fileRequestId: String, requestBody: FileRequestUpdateRequest, headers: UpdateFileRequestByIdHeadersArg = UpdateFileRequestByIdHeadersArg()) async throws -> FileRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-match": Utils.Strings.toString(value: headers.ifMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_requests/")\(fileRequestId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileRequest.deserialize(from: response.text)
    }

    public func deleteFileRequestById(fileRequestId: String, headers: DeleteFileRequestByIdHeadersArg = DeleteFileRequestByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_requests/")\(fileRequestId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func createFileRequestCopy(fileRequestId: String, requestBody: FileRequestCopyRequest, headers: CreateFileRequestCopyHeadersArg = CreateFileRequestCopyHeadersArg()) async throws -> FileRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/file_requests/")\(fileRequestId)\("/copy")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileRequest.deserialize(from: response.text)
    }

}
