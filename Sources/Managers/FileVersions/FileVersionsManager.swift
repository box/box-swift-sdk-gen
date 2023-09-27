import Foundation

public class FileVersionsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileVersions(fileId: String, queryParams: GetFileVersionsQueryParamsArg = GetFileVersionsQueryParamsArg(), headers: GetFileVersionsHeadersArg = GetFileVersionsHeadersArg()) async throws -> FileVersions {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/versions")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersions.deserialize(from: response.text)
    }

    public func getFileVersionById(fileId: String, fileVersionId: String, queryParams: GetFileVersionByIdQueryParamsArg = GetFileVersionByIdQueryParamsArg(), headers: GetFileVersionByIdHeadersArg = GetFileVersionByIdHeadersArg()) async throws -> FileVersionFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/versions/")\(fileVersionId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionFull.deserialize(from: response.text)
    }

    public func updateFileVersionById(fileId: String, fileVersionId: String, requestBody: UpdateFileVersionByIdRequestBodyArg = UpdateFileVersionByIdRequestBodyArg(), headers: UpdateFileVersionByIdHeadersArg = UpdateFileVersionByIdHeadersArg()) async throws -> FileVersionFull {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/versions/")\(fileVersionId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionFull.deserialize(from: response.text)
    }

    public func deleteFileVersionById(fileId: String, fileVersionId: String, headers: DeleteFileVersionByIdHeadersArg = DeleteFileVersionByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-match": Utils.Strings.toString(value: headers.ifMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/versions/")\(fileVersionId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func promoteFileVersion(fileId: String, requestBody: PromoteFileVersionRequestBodyArg = PromoteFileVersionRequestBodyArg(), queryParams: PromoteFileVersionQueryParamsArg = PromoteFileVersionQueryParamsArg(), headers: PromoteFileVersionHeadersArg = PromoteFileVersionHeadersArg()) async throws -> FileVersionFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/versions/current")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionFull.deserialize(from: response.text)
    }

}
