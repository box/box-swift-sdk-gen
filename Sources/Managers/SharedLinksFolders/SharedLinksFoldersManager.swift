import Foundation

public class SharedLinksFoldersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Return the folder represented by a shared link.
    /// 
    /// A shared folder can be represented by a shared link,
    /// which can originate within the current enterprise or within another.
    /// 
    /// This endpoint allows an application to retrieve information about a
    /// shared folder when only given a shared link.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getSharedItemFolders method
    ///   - headers: Headers of getSharedItemFolders method
    /// - Returns: The `FolderFull`.
    /// - Throws: The `GeneralError`.
    public func getSharedItemFolders(queryParams: GetSharedItemFoldersQueryParamsArg = GetSharedItemFoldersQueryParamsArg(), headers: GetSharedItemFoldersHeadersArg) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch), "boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shared_items#folders")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    /// Gets the information for a shared link on a folder.
    ///
    /// - Parameters:
    ///   - folderId: The unique identifier that represent a folder.
    ///     
    ///     The ID for any folder can be determined
    ///     by visiting this folder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/folder/123`
    ///     the `folder_id` is `123`.
    ///     
    ///     The root folder of a Box account is
    ///     always represented by the ID `0`.
    ///     Example: "12345"
    ///   - queryParams: Query parameters of getFolderGetSharedLink method
    ///   - headers: Headers of getFolderGetSharedLink method
    /// - Returns: The `FolderFull`.
    /// - Throws: The `GeneralError`.
    public func getFolderGetSharedLink(folderId: String, queryParams: GetFolderGetSharedLinkQueryParamsArg, headers: GetFolderGetSharedLinkHeadersArg = GetFolderGetSharedLinkHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("#get_shared_link")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    /// Adds a shared link to a folder.
    ///
    /// - Parameters:
    ///   - folderId: The unique identifier that represent a folder.
    ///     
    ///     The ID for any folder can be determined
    ///     by visiting this folder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/folder/123`
    ///     the `folder_id` is `123`.
    ///     
    ///     The root folder of a Box account is
    ///     always represented by the ID `0`.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateFolderAddSharedLink method
    ///   - queryParams: Query parameters of updateFolderAddSharedLink method
    ///   - headers: Headers of updateFolderAddSharedLink method
    /// - Returns: The `FolderFull`.
    /// - Throws: The `GeneralError`.
    public func updateFolderAddSharedLink(folderId: String, requestBody: UpdateFolderAddSharedLinkRequestBodyArg = UpdateFolderAddSharedLinkRequestBodyArg(), queryParams: UpdateFolderAddSharedLinkQueryParamsArg, headers: UpdateFolderAddSharedLinkHeadersArg = UpdateFolderAddSharedLinkHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("#add_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    /// Updates a shared link on a folder.
    ///
    /// - Parameters:
    ///   - folderId: The unique identifier that represent a folder.
    ///     
    ///     The ID for any folder can be determined
    ///     by visiting this folder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/folder/123`
    ///     the `folder_id` is `123`.
    ///     
    ///     The root folder of a Box account is
    ///     always represented by the ID `0`.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateFolderUpdateSharedLink method
    ///   - queryParams: Query parameters of updateFolderUpdateSharedLink method
    ///   - headers: Headers of updateFolderUpdateSharedLink method
    /// - Returns: The `FolderFull`.
    /// - Throws: The `GeneralError`.
    public func updateFolderUpdateSharedLink(folderId: String, requestBody: UpdateFolderUpdateSharedLinkRequestBodyArg = UpdateFolderUpdateSharedLinkRequestBodyArg(), queryParams: UpdateFolderUpdateSharedLinkQueryParamsArg, headers: UpdateFolderUpdateSharedLinkHeadersArg = UpdateFolderUpdateSharedLinkHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("#update_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

    /// Removes a shared link from a folder.
    ///
    /// - Parameters:
    ///   - folderId: The unique identifier that represent a folder.
    ///     
    ///     The ID for any folder can be determined
    ///     by visiting this folder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/folder/123`
    ///     the `folder_id` is `123`.
    ///     
    ///     The root folder of a Box account is
    ///     always represented by the ID `0`.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateFolderRemoveSharedLink method
    ///   - queryParams: Query parameters of updateFolderRemoveSharedLink method
    ///   - headers: Headers of updateFolderRemoveSharedLink method
    /// - Returns: The `FolderFull`.
    /// - Throws: The `GeneralError`.
    public func updateFolderRemoveSharedLink(folderId: String, requestBody: UpdateFolderRemoveSharedLinkRequestBodyArg = UpdateFolderRemoveSharedLinkRequestBodyArg(), queryParams: UpdateFolderRemoveSharedLinkQueryParamsArg, headers: UpdateFolderRemoveSharedLinkHeadersArg = UpdateFolderRemoveSharedLinkHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("#remove_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

}
