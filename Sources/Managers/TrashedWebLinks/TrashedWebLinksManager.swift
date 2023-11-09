import Foundation

public class TrashedWebLinksManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Restores a web link that has been moved to the trash.
    /// 
    /// An optional new parent ID can be provided to restore the  web link to in case
    /// the original folder has been deleted.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - requestBody: Request body of restoreWeblinkFromTrash method
    ///   - queryParams: Query parameters of restoreWeblinkFromTrash method
    ///   - headers: Headers of restoreWeblinkFromTrash method
    /// - Returns: The `TrashWebLinkRestored`.
    /// - Throws: The `GeneralError`.
    public func restoreWeblinkFromTrash(webLinkId: String, requestBody: RestoreWeblinkFromTrashRequestBodyArg = RestoreWeblinkFromTrashRequestBodyArg(), queryParams: RestoreWeblinkFromTrashQueryParamsArg = RestoreWeblinkFromTrashQueryParamsArg(), headers: RestoreWeblinkFromTrashHeadersArg = RestoreWeblinkFromTrashHeadersArg()) async throws -> TrashWebLinkRestored {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashWebLinkRestored.deserialize(from: response.data)
    }

    /// Retrieves a web link that has been moved to the trash.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - queryParams: Query parameters of getWebLinkTrash method
    ///   - headers: Headers of getWebLinkTrash method
    /// - Returns: The `TrashWebLink`.
    /// - Throws: The `GeneralError`.
    public func getWebLinkTrash(webLinkId: String, queryParams: GetWebLinkTrashQueryParamsArg = GetWebLinkTrashQueryParamsArg(), headers: GetWebLinkTrashHeadersArg = GetWebLinkTrashHeadersArg()) async throws -> TrashWebLink {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("/trash")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TrashWebLink.deserialize(from: response.data)
    }

    /// Permanently deletes a web link that is in the trash.
    /// This action cannot be undone.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - headers: Headers of deleteWebLinkTrash method
    /// - Throws: The `GeneralError`.
    public func deleteWebLinkTrash(webLinkId: String, headers: DeleteWebLinkTrashHeadersArg = DeleteWebLinkTrashHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)\("/trash")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
