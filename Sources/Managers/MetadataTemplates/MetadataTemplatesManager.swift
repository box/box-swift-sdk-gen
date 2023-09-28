import Foundation

public class MetadataTemplatesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getMetadataTemplates(queryParams: GetMetadataTemplatesQueryParamsArg, headers: GetMetadataTemplatesHeadersArg = GetMetadataTemplatesHeadersArg()) async throws -> MetadataTemplates {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["metadata_instance_id": Utils.Strings.toString(value: queryParams.metadataInstanceId)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplates.deserialize(from: response.text)
    }

    public func getMetadataTemplateSchema(scope: GetMetadataTemplateSchemaScopeArg, templateKey: String, headers: GetMetadataTemplateSchemaHeadersArg = GetMetadataTemplateSchemaHeadersArg()) async throws -> MetadataTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/")\(scope)\("/")\(templateKey)\("/schema")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplate.deserialize(from: response.text)
    }

    public func updateMetadataTemplateSchema(scope: UpdateMetadataTemplateSchemaScopeArg, templateKey: String, requestBody: [UpdateMetadataTemplateSchemaRequestBodyArg], headers: UpdateMetadataTemplateSchemaHeadersArg = UpdateMetadataTemplateSchemaHeadersArg()) async throws -> MetadataTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/")\(scope)\("/")\(templateKey)\("/schema")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplate.deserialize(from: response.text)
    }

    public func deleteMetadataTemplateSchema(scope: DeleteMetadataTemplateSchemaScopeArg, templateKey: String, headers: DeleteMetadataTemplateSchemaHeadersArg = DeleteMetadataTemplateSchemaHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/")\(scope)\("/")\(templateKey)\("/schema")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getMetadataTemplateById(templateId: String, headers: GetMetadataTemplateByIdHeadersArg = GetMetadataTemplateByIdHeadersArg()) async throws -> MetadataTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/")\(templateId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplate.deserialize(from: response.text)
    }

    public func getMetadataTemplateGlobal(queryParams: GetMetadataTemplateGlobalQueryParamsArg = GetMetadataTemplateGlobalQueryParamsArg(), headers: GetMetadataTemplateGlobalHeadersArg = GetMetadataTemplateGlobalHeadersArg()) async throws -> MetadataTemplates {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/global")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplates.deserialize(from: response.text)
    }

    public func getMetadataTemplateEnterprise(queryParams: GetMetadataTemplateEnterpriseQueryParamsArg = GetMetadataTemplateEnterpriseQueryParamsArg(), headers: GetMetadataTemplateEnterpriseHeadersArg = GetMetadataTemplateEnterpriseHeadersArg()) async throws -> MetadataTemplates {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplates.deserialize(from: response.text)
    }

    public func createMetadataTemplateSchema(requestBody: CreateMetadataTemplateSchemaRequestBodyArg, headers: CreateMetadataTemplateSchemaHeadersArg = CreateMetadataTemplateSchemaHeadersArg()) async throws -> MetadataTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/schema")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplate.deserialize(from: response.text)
    }

}
