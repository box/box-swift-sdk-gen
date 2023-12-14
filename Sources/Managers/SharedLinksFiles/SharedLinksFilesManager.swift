import Foundation

public class SharedLinksFilesManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Returns the file represented by a shared link.
    /// 
    /// A shared file can be represented by a shared link,
    /// which can originate within the current enterprise or within another.
    /// 
    /// This endpoint allows an application to retrieve information about a
    /// shared file when only given a shared link.
    /// 
    /// The `shared_link_permission_options` array field can be returned
    /// by requesting it in the `fields` query parameter.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getSharedItems method
    ///   - headers: Headers of getSharedItems method
    /// - Returns: The `FileFull`.
    /// - Throws: The `GeneralError`.
    public func getSharedItems(queryParams: GetSharedItemsQueryParams = GetSharedItemsQueryParams(), headers: GetSharedItemsHeaders) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["if-none-match": Utils.Strings.toString(value: headers.ifNoneMatch), "boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/shared_items")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.data)
    }

    /// Gets the information for a shared link on a file.
    ///
    /// - Parameters:
    ///   - fileId: The unique identifier that represents a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///     Example: "12345"
    ///   - queryParams: Query parameters of getFileGetSharedLink method
    ///   - headers: Headers of getFileGetSharedLink method
    /// - Returns: The `FileFull`.
    /// - Throws: The `GeneralError`.
    public func getFileGetSharedLink(fileId: String, queryParams: GetFileGetSharedLinkQueryParams, headers: GetFileGetSharedLinkHeaders = GetFileGetSharedLinkHeaders()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/files/")\(fileId)\("#get_shared_link")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.data)
    }

    /// Adds a shared link to a file.
    ///
    /// - Parameters:
    ///   - fileId: The unique identifier that represents a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateFileAddSharedLink method
    ///   - queryParams: Query parameters of updateFileAddSharedLink method
    ///   - headers: Headers of updateFileAddSharedLink method
    /// - Returns: The `FileFull`.
    /// - Throws: The `GeneralError`.
    public func updateFileAddSharedLink(fileId: String, requestBody: UpdateFileAddSharedLinkRequestBody = UpdateFileAddSharedLinkRequestBody(), queryParams: UpdateFileAddSharedLinkQueryParams, headers: UpdateFileAddSharedLinkHeaders = UpdateFileAddSharedLinkHeaders()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/files/")\(fileId)\("#add_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.data)
    }

    /// Updates a shared link on a file.
    ///
    /// - Parameters:
    ///   - fileId: The unique identifier that represents a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateFileUpdateSharedLink method
    ///   - queryParams: Query parameters of updateFileUpdateSharedLink method
    ///   - headers: Headers of updateFileUpdateSharedLink method
    /// - Returns: The `FileFull`.
    /// - Throws: The `GeneralError`.
    public func updateFileUpdateSharedLink(fileId: String, requestBody: UpdateFileUpdateSharedLinkRequestBody = UpdateFileUpdateSharedLinkRequestBody(), queryParams: UpdateFileUpdateSharedLinkQueryParams, headers: UpdateFileUpdateSharedLinkHeaders = UpdateFileUpdateSharedLinkHeaders()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/files/")\(fileId)\("#update_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.data)
    }

    /// Removes a shared link from a file.
    ///
    /// - Parameters:
    ///   - fileId: The unique identifier that represents a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateFileRemoveSharedLink method
    ///   - queryParams: Query parameters of updateFileRemoveSharedLink method
    ///   - headers: Headers of updateFileRemoveSharedLink method
    /// - Returns: The `FileFull`.
    /// - Throws: The `GeneralError`.
    public func updateFileRemoveSharedLink(fileId: String, requestBody: UpdateFileRemoveSharedLinkRequestBody = UpdateFileRemoveSharedLinkRequestBody(), queryParams: UpdateFileRemoveSharedLinkQueryParams, headers: UpdateFileRemoveSharedLinkHeaders = UpdateFileRemoveSharedLinkHeaders()) async throws -> FileFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/files/")\(fileId)\("#remove_shared_link")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileFull.deserialize(from: response.data)
    }

}
