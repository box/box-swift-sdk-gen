import Foundation

public class TrashedFoldersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func restoreFolderFromTrash(folderId: String, requestBody: RestoreFolderFromTrashRequestBodyArg = RestoreFolderFromTrashRequestBodyArg(), queryParams: RestoreFolderFromTrashQueryParamsArg = RestoreFolderFromTrashQueryParamsArg(), headers: RestoreFolderFromTrashHeadersArg = RestoreFolderFromTrashHeadersArg()) async throws -> TrashFolderRestored {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashFolderRestored.deserialize(from: response.text)
    }

    public func getFolderTrash(folderId: String, queryParams: GetFolderTrashQueryParamsArg = GetFolderTrashQueryParamsArg(), headers: GetFolderTrashHeadersArg = GetFolderTrashHeadersArg()) async throws -> TrashFolder {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/trash")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashFolder.deserialize(from: response.text)
    }

    public func deleteFolderTrash(folderId: String, headers: DeleteFolderTrashHeadersArg = DeleteFolderTrashHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/trash")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
