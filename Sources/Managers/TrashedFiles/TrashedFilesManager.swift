import Foundation

public class TrashedFilesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Restores a file that has been moved to the trash.
    /// 
    /// An optional new parent ID can be provided to restore the file to in case the
    /// original folder has been deleted.
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
    ///   - requestBody: Request body of restoreFileFromTrash method
    ///   - queryParams: Query parameters of restoreFileFromTrash method
    ///   - headers: Headers of restoreFileFromTrash method
    /// - Returns: The `TrashFileRestored`.
    /// - Throws: The `GeneralError`.
    public func restoreFileFromTrash(fileId: String, requestBody: RestoreFileFromTrashRequestBodyArg = RestoreFileFromTrashRequestBodyArg(), queryParams: RestoreFileFromTrashQueryParamsArg = RestoreFileFromTrashQueryParamsArg(), headers: RestoreFileFromTrashHeadersArg = RestoreFileFromTrashHeadersArg()) async throws -> TrashFileRestored {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashFileRestored.deserialize(from: response.data)
    }

    /// Retrieves a file that has been moved to the trash.
    /// 
    /// Please note that only if the file itself has been moved to the
    /// trash can it be retrieved with this API call. If instead one of
    /// its parent folders was moved to the trash, only that folder
    /// can be inspected using the
    /// [`GET /folders/:id/trash`](e://get_folders_id_trash) API.
    /// 
    /// To list all items that have been moved to the trash, please
    /// use the [`GET /folders/trash/items`](e://get-folders-trash-items/)
    /// API.
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
    ///   - queryParams: Query parameters of getFileTrash method
    ///   - headers: Headers of getFileTrash method
    /// - Returns: The `TrashFile`.
    /// - Throws: The `GeneralError`.
    public func getFileTrash(fileId: String, queryParams: GetFileTrashQueryParamsArg = GetFileTrashQueryParamsArg(), headers: GetFileTrashHeadersArg = GetFileTrashHeadersArg()) async throws -> TrashFile {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/trash")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashFile.deserialize(from: response.data)
    }

    /// Permanently deletes a file that is in the trash.
    /// This action cannot be undone.
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
    ///   - headers: Headers of deleteFileTrash method
    /// - Throws: The `GeneralError`.
    public func deleteFileTrash(fileId: String, headers: DeleteFileTrashHeadersArg = DeleteFileTrashHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/trash")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
