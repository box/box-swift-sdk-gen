import Foundation

public class FolderClassificationsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves the classification metadata instance that
    /// has been applied to a folder.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/folders/:id//enterprise_12345/securityClassification-6VMVochwUWo`.
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
    ///   - headers: Headers of getFolderMetadataEnterpriseSecurityClassification6VmVochwUWo method
    /// - Returns: The `Classification`.
    /// - Throws: The `GeneralError`.
    public func getFolderMetadataEnterpriseSecurityClassification6VmVochwUWo(folderId: String, headers: GetFolderMetadataEnterpriseSecurityClassification6VmVochwUWoHeadersArg = GetFolderMetadataEnterpriseSecurityClassification6VmVochwUWoHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.data)
    }

    /// Adds a classification to a folder by specifying the label of the
    /// classification to add.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/folders/:id//enterprise_12345/securityClassification-6VMVochwUWo`.
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
    ///   - requestBody: Request body of createFolderMetadataEnterpriseSecurityClassification method
    ///   - headers: Headers of createFolderMetadataEnterpriseSecurityClassification method
    /// - Returns: The `Classification`.
    /// - Throws: The `GeneralError`.
    public func createFolderMetadataEnterpriseSecurityClassification(folderId: String, requestBody: CreateFolderMetadataEnterpriseSecurityClassificationRequestBodyArg = CreateFolderMetadataEnterpriseSecurityClassificationRequestBodyArg(), headers: CreateFolderMetadataEnterpriseSecurityClassificationHeadersArg = CreateFolderMetadataEnterpriseSecurityClassificationHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.data)
    }

    /// Updates a classification on a folder.
    /// 
    /// The classification can only be updated if a classification has already been
    /// applied to the folder before. When editing classifications, only values are
    /// defined for the enterprise will be accepted.
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
    ///   - requestBody: Request body of updateFolderMetadataEnterpriseSecurityClassification method
    ///   - headers: Headers of updateFolderMetadataEnterpriseSecurityClassification method
    /// - Returns: The `Classification`.
    /// - Throws: The `GeneralError`.
    public func updateFolderMetadataEnterpriseSecurityClassification(folderId: String, requestBody: [UpdateFolderMetadataEnterpriseSecurityClassificationRequestBodyArg], headers: UpdateFolderMetadataEnterpriseSecurityClassificationHeadersArg = UpdateFolderMetadataEnterpriseSecurityClassificationHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.data)
    }

    /// Removes any classifications from a folder.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/folders/:id//enterprise_12345/securityClassification-6VMVochwUWo`.
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
    ///   - headers: Headers of deleteFolderMetadataEnterpriseSecurityClassification method
    /// - Throws: The `GeneralError`.
    public func deleteFolderMetadataEnterpriseSecurityClassification(folderId: String, headers: DeleteFolderMetadataEnterpriseSecurityClassificationHeadersArg = DeleteFolderMetadataEnterpriseSecurityClassificationHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
