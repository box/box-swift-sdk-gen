import Foundation

public class SharedLinksFoldersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getSharedItemFolders(queryParams: GetSharedItemFoldersQueryParamsArg = GetSharedItemFoldersQueryParamsArg(), headers: GetSharedItemFoldersHeadersArg) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch), "boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shared_items#folders")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    public func getFolderGetSharedLink(folderId: String, queryParams: GetFolderGetSharedLinkQueryParamsArg, headers: GetFolderGetSharedLinkHeadersArg = GetFolderGetSharedLinkHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("#get_shared_link")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    public func updateFolderAddSharedLink(folderId: String, requestBody: UpdateFolderAddSharedLinkRequestBodyArg = UpdateFolderAddSharedLinkRequestBodyArg(), queryParams: UpdateFolderAddSharedLinkQueryParamsArg, headers: UpdateFolderAddSharedLinkHeadersArg = UpdateFolderAddSharedLinkHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("#add_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    public func updateFolderUpdateSharedLink(folderId: String, requestBody: UpdateFolderUpdateSharedLinkRequestBodyArg = UpdateFolderUpdateSharedLinkRequestBodyArg(), queryParams: UpdateFolderUpdateSharedLinkQueryParamsArg, headers: UpdateFolderUpdateSharedLinkHeadersArg = UpdateFolderUpdateSharedLinkHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("#update_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    public func updateFolderRemoveSharedLink(folderId: String, requestBody: UpdateFolderRemoveSharedLinkRequestBodyArg = UpdateFolderRemoveSharedLinkRequestBodyArg(), queryParams: UpdateFolderRemoveSharedLinkQueryParamsArg, headers: UpdateFolderRemoveSharedLinkHeadersArg = UpdateFolderRemoveSharedLinkHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("#remove_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

}
