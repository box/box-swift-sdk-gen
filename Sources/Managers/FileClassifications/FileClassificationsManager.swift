import Foundation

public class FileClassificationsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileMetadataEnterpriseSecurityClassification6VmVochwUWo(fileId: String, headers: GetFileMetadataEnterpriseSecurityClassification6VmVochwUWoHeadersArg = GetFileMetadataEnterpriseSecurityClassification6VmVochwUWoHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    public func createFileMetadataEnterpriseSecurityClassification(fileId: String, requestBody: CreateFileMetadataEnterpriseSecurityClassificationRequestBodyArg = CreateFileMetadataEnterpriseSecurityClassificationRequestBodyArg(), headers: CreateFileMetadataEnterpriseSecurityClassificationHeadersArg = CreateFileMetadataEnterpriseSecurityClassificationHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    public func updateFileMetadataEnterpriseSecurityClassification(fileId: String, requestBody: [UpdateFileMetadataEnterpriseSecurityClassificationRequestBodyArg], headers: UpdateFileMetadataEnterpriseSecurityClassificationHeadersArg = UpdateFileMetadataEnterpriseSecurityClassificationHeadersArg()) async throws -> Classification {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Classification.deserialize(from: response.text)
    }

    public func deleteFileMetadataEnterpriseSecurityClassification(fileId: String, headers: DeleteFileMetadataEnterpriseSecurityClassificationHeadersArg = DeleteFileMetadataEnterpriseSecurityClassificationHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/enterprise/securityClassification-6VMVochwUWo")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
