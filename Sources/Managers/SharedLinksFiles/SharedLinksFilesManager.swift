import Foundation

public class SharedLinksFilesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getSharedItems(queryParams: GetSharedItemsQueryParamsArg = GetSharedItemsQueryParamsArg(), headers: GetSharedItemsHeadersArg) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch), "boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shared_items")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.text)
    }

    public func getFileGetSharedLink(fileId: String, queryParams: GetFileGetSharedLinkQueryParamsArg, headers: GetFileGetSharedLinkHeadersArg = GetFileGetSharedLinkHeadersArg()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("#get_shared_link")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.text)
    }

    public func updateFileAddSharedLink(fileId: String, requestBody: UpdateFileAddSharedLinkRequestBodyArg = UpdateFileAddSharedLinkRequestBodyArg(), queryParams: UpdateFileAddSharedLinkQueryParamsArg, headers: UpdateFileAddSharedLinkHeadersArg = UpdateFileAddSharedLinkHeadersArg()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("#add_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.text)
    }

    public func updateFileUpdateSharedLink(fileId: String, requestBody: UpdateFileUpdateSharedLinkRequestBodyArg = UpdateFileUpdateSharedLinkRequestBodyArg(), queryParams: UpdateFileUpdateSharedLinkQueryParamsArg, headers: UpdateFileUpdateSharedLinkHeadersArg = UpdateFileUpdateSharedLinkHeadersArg()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("#update_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.text)
    }

    public func updateFileRemoveSharedLink(fileId: String, requestBody: UpdateFileRemoveSharedLinkRequestBodyArg = UpdateFileRemoveSharedLinkRequestBodyArg(), queryParams: UpdateFileRemoveSharedLinkQueryParamsArg, headers: UpdateFileRemoveSharedLinkHeadersArg = UpdateFileRemoveSharedLinkHeadersArg()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("#remove_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.text)
    }

}
