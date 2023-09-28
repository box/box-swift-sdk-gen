import Foundation

public class TrashedFilesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func restoreFileFromTrash(fileId: String, requestBody: RestoreFileFromTrashRequestBodyArg = RestoreFileFromTrashRequestBodyArg(), queryParams: RestoreFileFromTrashQueryParamsArg = RestoreFileFromTrashQueryParamsArg(), headers: RestoreFileFromTrashHeadersArg = RestoreFileFromTrashHeadersArg()) async throws -> TrashFileRestored {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashFileRestored.deserialize(from: response.text)
    }

    public func getFileTrash(fileId: String, queryParams: GetFileTrashQueryParamsArg = GetFileTrashQueryParamsArg(), headers: GetFileTrashHeadersArg = GetFileTrashHeadersArg()) async throws -> TrashFile {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/trash")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashFile.deserialize(from: response.text)
    }

    public func deleteFileTrash(fileId: String, headers: DeleteFileTrashHeadersArg = DeleteFileTrashHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/trash")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
