import Foundation

public class FolderMetadataManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves all metadata for a given folder. This can not be used on the root
    /// folder with ID `0`.
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
    ///   - headers: Headers of getFolderMetadata method
    /// - Returns: The `Metadatas`.
    /// - Throws: The `GeneralError`.
    public func getFolderMetadata(folderId: String, headers: GetFolderMetadataHeadersArg = GetFolderMetadataHeadersArg()) async throws -> Metadatas {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadatas.deserialize(from: response.data)
    }

    /// Retrieves the instance of a metadata template that has been applied to a
    /// folder. This can not be used on the root folder with ID `0`.
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
    ///   - scope: The scope of the metadata template
    ///     Example: "global"
    ///   - templateKey: The name of the metadata template
    ///     Example: "properties"
    ///   - headers: Headers of getFolderMetadataById method
    /// - Returns: The `MetadataFull`.
    /// - Throws: The `GeneralError`.
    public func getFolderMetadataById(folderId: String, scope: GetFolderMetadataByIdScopeArg, templateKey: String, headers: GetFolderMetadataByIdHeadersArg = GetFolderMetadataByIdHeadersArg()) async throws -> MetadataFull {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataFull.deserialize(from: response.data)
    }

    /// Applies an instance of a metadata template to a folder.
    /// 
    /// In most cases only values that are present in the metadata template
    /// will be accepted, except for the `global.properties` template which accepts
    /// any key-value pair.
    /// 
    /// To display the metadata template in the Box web app the enterprise needs to be
    /// configured to enable **Cascading Folder Level Metadata** for the user in the
    /// admin console.
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
    ///   - scope: The scope of the metadata template
    ///     Example: "global"
    ///   - templateKey: The name of the metadata template
    ///     Example: "properties"
    ///   - requestBody: Request body of createFolderMetadataById method
    ///   - headers: Headers of createFolderMetadataById method
    /// - Returns: The `Metadata`.
    /// - Throws: The `GeneralError`.
    public func createFolderMetadataById(folderId: String, scope: CreateFolderMetadataByIdScopeArg, templateKey: String, requestBody: CreateFolderMetadataByIdRequestBodyArg, headers: CreateFolderMetadataByIdHeadersArg = CreateFolderMetadataByIdHeadersArg()) async throws -> Metadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadata.deserialize(from: response.data)
    }

    /// Updates a piece of metadata on a folder.
    /// 
    /// The metadata instance can only be updated if the template has already been
    /// applied to the folder before. When editing metadata, only values that match
    /// the metadata template schema will be accepted.
    /// 
    /// The update is applied atomically. If any errors occur during the
    /// application of the operations, the metadata instance will not be changed.
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
    ///   - scope: The scope of the metadata template
    ///     Example: "global"
    ///   - templateKey: The name of the metadata template
    ///     Example: "properties"
    ///   - requestBody: Request body of updateFolderMetadataById method
    ///   - headers: Headers of updateFolderMetadataById method
    /// - Returns: The `Metadata`.
    /// - Throws: The `GeneralError`.
    public func updateFolderMetadataById(folderId: String, scope: UpdateFolderMetadataByIdScopeArg, templateKey: String, requestBody: [UpdateFolderMetadataByIdRequestBodyArg], headers: UpdateFolderMetadataByIdHeadersArg = UpdateFolderMetadataByIdHeadersArg()) async throws -> Metadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadata.deserialize(from: response.data)
    }

    /// Deletes a piece of folder metadata.
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
    ///   - scope: The scope of the metadata template
    ///     Example: "global"
    ///   - templateKey: The name of the metadata template
    ///     Example: "properties"
    ///   - headers: Headers of deleteFolderMetadataById method
    /// - Throws: The `GeneralError`.
    public func deleteFolderMetadataById(folderId: String, scope: DeleteFolderMetadataByIdScopeArg, templateKey: String, headers: DeleteFolderMetadataByIdHeadersArg = DeleteFolderMetadataByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
