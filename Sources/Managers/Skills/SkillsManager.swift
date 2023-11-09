import Foundation

public class SkillsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// List the Box Skills metadata cards that are attached to a file.
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
    ///   - headers: Headers of getFileMetadataGlobalBoxSkillsCards method
    /// - Returns: The `SkillCardsMetadata`.
    /// - Throws: The `GeneralError`.
    public func getFileMetadataGlobalBoxSkillsCards(fileId: String, headers: GetFileMetadataGlobalBoxSkillsCardsHeadersArg = GetFileMetadataGlobalBoxSkillsCardsHeadersArg()) async throws -> SkillCardsMetadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/global/boxSkillsCards")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SkillCardsMetadata.deserialize(from: response.data)
    }

    /// Applies one or more Box Skills metadata cards to a file.
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
    ///   - requestBody: Request body of createFileMetadataGlobalBoxSkillsCard method
    ///   - headers: Headers of createFileMetadataGlobalBoxSkillsCard method
    /// - Returns: The `SkillCardsMetadata`.
    /// - Throws: The `GeneralError`.
    public func createFileMetadataGlobalBoxSkillsCard(fileId: String, requestBody: CreateFileMetadataGlobalBoxSkillsCardRequestBodyArg, headers: CreateFileMetadataGlobalBoxSkillsCardHeadersArg = CreateFileMetadataGlobalBoxSkillsCardHeadersArg()) async throws -> SkillCardsMetadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/global/boxSkillsCards")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SkillCardsMetadata.deserialize(from: response.data)
    }

    /// Updates one or more Box Skills metadata cards to a file.
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
    ///   - requestBody: Request body of updateFileMetadataGlobalBoxSkillsCard method
    ///   - headers: Headers of updateFileMetadataGlobalBoxSkillsCard method
    /// - Returns: The `SkillCardsMetadata`.
    /// - Throws: The `GeneralError`.
    public func updateFileMetadataGlobalBoxSkillsCard(fileId: String, requestBody: [UpdateFileMetadataGlobalBoxSkillsCardRequestBodyArg], headers: UpdateFileMetadataGlobalBoxSkillsCardHeadersArg = UpdateFileMetadataGlobalBoxSkillsCardHeadersArg()) async throws -> SkillCardsMetadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/global/boxSkillsCards")", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SkillCardsMetadata.deserialize(from: response.data)
    }

    /// Removes any Box Skills cards metadata from a file.
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
    ///   - headers: Headers of deleteFileMetadataGlobalBoxSkillsCard method
    /// - Throws: The `GeneralError`.
    public func deleteFileMetadataGlobalBoxSkillsCard(fileId: String, headers: DeleteFileMetadataGlobalBoxSkillsCardHeadersArg = DeleteFileMetadataGlobalBoxSkillsCardHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/global/boxSkillsCards")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// An alternative method that can be used to overwrite and update all Box Skill
    /// metadata cards on a file.
    ///
    /// - Parameters:
    ///   - skillId: The ID of the skill to apply this metadata for.
    ///     Example: "33243242"
    ///   - requestBody: Request body of updateSkillInvocationById method
    ///   - headers: Headers of updateSkillInvocationById method
    /// - Throws: The `GeneralError`.
    public func updateSkillInvocationById(skillId: String, requestBody: UpdateSkillInvocationByIdRequestBodyArg, headers: UpdateSkillInvocationByIdHeadersArg = UpdateSkillInvocationByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/skill_invocations/")\(skillId)", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
