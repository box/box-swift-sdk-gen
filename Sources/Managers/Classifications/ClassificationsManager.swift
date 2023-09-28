import Foundation

public class ClassificationsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getMetadataTemplateEnterpriseSecurityClassificationSchema(headers: GetMetadataTemplateEnterpriseSecurityClassificationSchemaHeadersArg = GetMetadataTemplateEnterpriseSecurityClassificationSchemaHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.text)
    }

    public func deleteMetadataTemplateEnterpriseSecurityClassificationSchema(headers: DeleteMetadataTemplateEnterpriseSecurityClassificationSchemaHeadersArg = DeleteMetadataTemplateEnterpriseSecurityClassificationSchemaHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func updateMetadataTemplateEnterpriseSecurityClassificationSchemaAdd(requestBody: [UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArg], headers: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddHeadersArg = UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema#add")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.text)
    }

    public func updateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdate(requestBody: [UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArg], headers: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateHeadersArg = UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema#update")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.text)
    }

    public func updateMetadataTemplateEnterpriseSecurityClassificationSchemaDelete(requestBody: [UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArg], headers: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteHeadersArg = UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema#delete")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.text)
    }

    public func createMetadataTemplateSchemaClassification(requestBody: CreateMetadataTemplateSchemaClassificationRequestBodyArg, headers: CreateMetadataTemplateSchemaClassificationHeadersArg = CreateMetadataTemplateSchemaClassificationHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/schema#classifications")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.text)
    }

}
