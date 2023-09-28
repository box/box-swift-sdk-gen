import Foundation

public class FolderMetadataManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFolderMetadata(folderId: String, headers: GetFolderMetadataHeadersArg = GetFolderMetadataHeadersArg()) async throws -> Metadatas {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadatas.deserialize(from: response.text)
    }

    public func getFolderMetadataById(folderId: String, scope: GetFolderMetadataByIdScopeArg, templateKey: String, headers: GetFolderMetadataByIdHeadersArg = GetFolderMetadataByIdHeadersArg()) async throws -> MetadataFull {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataFull.deserialize(from: response.text)
    }

    public func createFolderMetadataById(folderId: String, scope: CreateFolderMetadataByIdScopeArg, templateKey: String, requestBody: CreateFolderMetadataByIdRequestBodyArg, headers: CreateFolderMetadataByIdHeadersArg = CreateFolderMetadataByIdHeadersArg()) async throws -> Metadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadata.deserialize(from: response.text)
    }

    public func updateFolderMetadataById(folderId: String, scope: UpdateFolderMetadataByIdScopeArg, templateKey: String, requestBody: [UpdateFolderMetadataByIdRequestBodyArg], headers: UpdateFolderMetadataByIdHeadersArg = UpdateFolderMetadataByIdHeadersArg()) async throws -> Metadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadata.deserialize(from: response.text)
    }

    public func deleteFolderMetadataById(folderId: String, scope: DeleteFolderMetadataByIdScopeArg, templateKey: String, headers: DeleteFolderMetadataByIdHeadersArg = DeleteFolderMetadataByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
