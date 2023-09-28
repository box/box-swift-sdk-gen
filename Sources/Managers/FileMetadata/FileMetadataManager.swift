import Foundation

public class FileMetadataManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileMetadata(fileId: String, headers: GetFileMetadataHeadersArg = GetFileMetadataHeadersArg()) async throws -> Metadatas {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadatas.deserialize(from: response.text)
    }

    public func getFileMetadataById(fileId: String, scope: GetFileMetadataByIdScopeArg, templateKey: String, headers: GetFileMetadataByIdHeadersArg = GetFileMetadataByIdHeadersArg()) async throws -> MetadataFull {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataFull.deserialize(from: response.text)
    }

    public func createFileMetadataById(fileId: String, scope: CreateFileMetadataByIdScopeArg, templateKey: String, requestBody: CreateFileMetadataByIdRequestBodyArg, headers: CreateFileMetadataByIdHeadersArg = CreateFileMetadataByIdHeadersArg()) async throws -> Metadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadata.deserialize(from: response.text)
    }

    public func updateFileMetadataById(fileId: String, scope: UpdateFileMetadataByIdScopeArg, templateKey: String, requestBody: [UpdateFileMetadataByIdRequestBodyArg], headers: UpdateFileMetadataByIdHeadersArg = UpdateFileMetadataByIdHeadersArg()) async throws -> Metadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Metadata.deserialize(from: response.text)
    }

    public func deleteFileMetadataById(fileId: String, scope: DeleteFileMetadataByIdScopeArg, templateKey: String, headers: DeleteFileMetadataByIdHeadersArg = DeleteFileMetadataByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/")\(scope)\("/")\(templateKey)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
