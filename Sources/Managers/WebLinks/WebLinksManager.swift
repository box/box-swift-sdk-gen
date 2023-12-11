import Foundation

public class WebLinksManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Creates a web link object within a folder.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createWebLink method
    ///   - headers: Headers of createWebLink method
    /// - Returns: The `WebLink`.
    /// - Throws: The `GeneralError`.
    public func createWebLink(requestBody: CreateWebLinkRequestBodyArg, headers: CreateWebLinkHeadersArg = CreateWebLinkHeadersArg()) async throws -> WebLink {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.data)
    }

    /// Retrieve information about a web link.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - headers: Headers of getWebLinkById method
    /// - Returns: The `WebLink`.
    /// - Throws: The `GeneralError`.
    public func getWebLinkById(webLinkId: String, headers: GetWebLinkByIdHeadersArg = GetWebLinkByIdHeadersArg()) async throws -> WebLink {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge(["boxapi": Utils.Strings.toString(value: headers.boxapi)], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.data)
    }

    /// Updates a web link object.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateWebLinkById method
    ///   - headers: Headers of updateWebLinkById method
    /// - Returns: The `WebLink`.
    /// - Throws: The `GeneralError`.
    public func updateWebLinkById(webLinkId: String, requestBody: UpdateWebLinkByIdRequestBodyArg = UpdateWebLinkByIdRequestBodyArg(), headers: UpdateWebLinkByIdHeadersArg = UpdateWebLinkByIdHeadersArg()) async throws -> WebLink {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try WebLink.deserialize(from: response.data)
    }

    /// Deletes a web link.
    ///
    /// - Parameters:
    ///   - webLinkId: The ID of the web link.
    ///     Example: "12345"
    ///   - headers: Headers of deleteWebLinkById method
    /// - Throws: The `GeneralError`.
    public func deleteWebLinkById(webLinkId: String, headers: DeleteWebLinkByIdHeadersArg = DeleteWebLinkByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/web_links/")\(webLinkId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
