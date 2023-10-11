import Foundation

public class FileClassificationsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves the classification metadata instance that
    /// has been applied to a file.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/files/:id//enterprise_12345/securityClassification-6VMVochwUWo`.
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
    ///   - headers: Headers of getFileMetadataEnterpriseSecurityClassification6VmVochwUWo method
    /// - Returns: The `Classification`.
    /// - Throws: The `GeneralError`.
    public func getFileMetadataEnterpriseSecurityClassification6VmVochwUWo(fileId: String, headers: GetFileMetadataEnterpriseSecurityClassification6VmVochwUWoHeadersArg = GetFileMetadataEnterpriseSecurityClassification6VmVochwUWoHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    /// Adds a classification to a file by specifying the label of the
    /// classification to add.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/files/:id//enterprise_12345/securityClassification-6VMVochwUWo`.
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
    ///   - requestBody: Request body of createFileMetadataEnterpriseSecurityClassification method
    ///   - headers: Headers of createFileMetadataEnterpriseSecurityClassification method
    /// - Returns: The `Classification`.
    /// - Throws: The `GeneralError`.
    public func createFileMetadataEnterpriseSecurityClassification(fileId: String, requestBody: CreateFileMetadataEnterpriseSecurityClassificationRequestBodyArg = CreateFileMetadataEnterpriseSecurityClassificationRequestBodyArg(), headers: CreateFileMetadataEnterpriseSecurityClassificationHeadersArg = CreateFileMetadataEnterpriseSecurityClassificationHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    /// Updates a classification on a file.
    /// 
    /// The classification can only be updated if a classification has already been
    /// applied to the file before. When editing classifications, only values are
    /// defined for the enterprise will be accepted.
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
    ///   - requestBody: Request body of updateFileMetadataEnterpriseSecurityClassification method
    ///   - headers: Headers of updateFileMetadataEnterpriseSecurityClassification method
    /// - Returns: The `Classification`.
    /// - Throws: The `GeneralError`.
    public func updateFileMetadataEnterpriseSecurityClassification(fileId: String, requestBody: [UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArg], headers: UpdateFileMetadataEnterpriseSecurityClassificationHeadersArg = UpdateFileMetadataEnterpriseSecurityClassificationHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    /// Removes any classifications from a file.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/files/:id//enterprise_12345/securityClassification-6VMVochwUWo`.
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
    ///   - headers: Headers of deleteFileMetadataEnterpriseSecurityClassification method
    /// - Throws: The `GeneralError`.
    public func deleteFileMetadataEnterpriseSecurityClassification(fileId: String, headers: DeleteFileMetadataEnterpriseSecurityClassificationHeadersArg = DeleteFileMetadataEnterpriseSecurityClassificationHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
