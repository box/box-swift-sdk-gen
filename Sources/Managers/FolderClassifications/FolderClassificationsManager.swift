import Foundation

public class FolderClassificationsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFolderMetadataEnterpriseSecurityClassification6VmVochwUWo(folderId: String, headers: GetFolderMetadataEnterpriseSecurityClassification6VmVochwUWoHeadersArg = GetFolderMetadataEnterpriseSecurityClassification6VmVochwUWoHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    public func createFolderMetadataEnterpriseSecurityClassification(folderId: String, requestBody: CreateFolderMetadataEnterpriseSecurityClassificationRequestBodyArg = CreateFolderMetadataEnterpriseSecurityClassificationRequestBodyArg(), headers: CreateFolderMetadataEnterpriseSecurityClassificationHeadersArg = CreateFolderMetadataEnterpriseSecurityClassificationHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    public func updateFolderMetadataEnterpriseSecurityClassification(folderId: String, requestBody: [UpdateFolderMetadataEnterpriseSecurityClassificationRequestBodyArg], headers: UpdateFolderMetadataEnterpriseSecurityClassificationHeadersArg = UpdateFolderMetadataEnterpriseSecurityClassificationHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    public func deleteFolderMetadataEnterpriseSecurityClassification(folderId: String, headers: DeleteFolderMetadataEnterpriseSecurityClassificationHeadersArg = DeleteFolderMetadataEnterpriseSecurityClassificationHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
