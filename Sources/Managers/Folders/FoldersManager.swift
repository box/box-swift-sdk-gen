import Foundation

public class FoldersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFolderById(folderId: String, queryParams: GetFolderByIdQueryParamsArg = GetFolderByIdQueryParamsArg(), headers: GetFolderByIdHeadersArg = GetFolderByIdHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "sort": Utils.Strings.toString(value: queryParams.sort), "direction": Utils.Strings.toString(value: queryParams.direction), "offset": Utils.Strings.toString(value: queryParams.offset), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch), "boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    public func updateFolderById(folderId: String, requestBody: UpdateFolderByIdRequestBodyArg = UpdateFolderByIdRequestBodyArg(), queryParams: UpdateFolderByIdQueryParamsArg = UpdateFolderByIdQueryParamsArg(), headers: UpdateFolderByIdHeadersArg = UpdateFolderByIdHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-match": Utils.Strings.toString(value: headers.ifMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    public func deleteFolderById(folderId: String, queryParams: DeleteFolderByIdQueryParamsArg = DeleteFolderByIdQueryParamsArg(), headers: DeleteFolderByIdHeadersArg = DeleteFolderByIdHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["recursive": Utils.Strings.toString(value: queryParams.recursive)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-match": Utils.Strings.toString(value: headers.ifMatch)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)", options: FetchOptions(method: "DELETE", params: queryParamsMap, headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getFolderItems(folderId: String, queryParams: GetFolderItemsQueryParamsArg = GetFolderItemsQueryParamsArg(), headers: GetFolderItemsHeadersArg = GetFolderItemsHeadersArg()) async throws -> Items {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "usemarker": Utils.Strings.toString(value: queryParams.usemarker), "marker": Utils.Strings.toString(value: queryParams.marker), "offset": Utils.Strings.toString(value: queryParams.offset), "limit": Utils.Strings.toString(value: queryParams.limit), "sort": Utils.Strings.toString(value: queryParams.sort), "direction": Utils.Strings.toString(value: queryParams.direction)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/items")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Items.deserialize(from: response.text)
    }

    public func createFolder(requestBody: CreateFolderRequestBodyArg, queryParams: CreateFolderQueryParamsArg = CreateFolderQueryParamsArg(), headers: CreateFolderHeadersArg = CreateFolderHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    public func copyFolder(folderId: String, requestBody: CopyFolderRequestBodyArg, queryParams: CopyFolderQueryParamsArg = CopyFolderQueryParamsArg(), headers: CopyFolderHeadersArg = CopyFolderHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/copy")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

}
