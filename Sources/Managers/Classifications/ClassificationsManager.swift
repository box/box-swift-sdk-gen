import Foundation

public class ClassificationsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves the classification metadata template and lists all the
    /// classifications available to this enterprise.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/metadata_templates/enterprise_12345/securityClassification-6VMVochwUWo/schema`.
    ///
    /// - Parameters:
    ///   - headers: Headers of getMetadataTemplateEnterpriseSecurityClassificationSchema method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func getMetadataTemplateEnterpriseSecurityClassificationSchema(headers: GetMetadataTemplateEnterpriseSecurityClassificationSchemaHeadersArg = GetMetadataTemplateEnterpriseSecurityClassificationSchemaHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.data)
    }

    /// Delete all classifications by deleting the classification
    /// metadata template.
    ///
    /// - Parameters:
    ///   - headers: Headers of deleteMetadataTemplateEnterpriseSecurityClassificationSchema method
    /// - Throws: The `GeneralError`.
    public func deleteMetadataTemplateEnterpriseSecurityClassificationSchema(headers: DeleteMetadataTemplateEnterpriseSecurityClassificationSchemaHeadersArg = DeleteMetadataTemplateEnterpriseSecurityClassificationSchemaHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Adds one or more new classifications to the list of classifications
    /// available to the enterprise.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/metadata_templates/enterprise_12345/securityClassification-6VMVochwUWo/schema`.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of updateMetadataTemplateEnterpriseSecurityClassificationSchemaAdd method
    ///   - headers: Headers of updateMetadataTemplateEnterpriseSecurityClassificationSchemaAdd method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func updateMetadataTemplateEnterpriseSecurityClassificationSchemaAdd(requestBody: [UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddRequestBodyArg], headers: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddHeadersArg = UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaAddHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema#add")", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.data)
    }

    /// Updates the labels and descriptions of one or more classifications
    /// available to the enterprise.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/metadata_templates/enterprise_12345/securityClassification-6VMVochwUWo/schema`.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of updateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdate method
    ///   - headers: Headers of updateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdate method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func updateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdate(requestBody: [UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateRequestBodyArg], headers: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateHeadersArg = UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaUpdateHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema#update")", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.data)
    }

    /// Removes a classification from the list of classifications
    /// available to the enterprise.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/metadata_templates/enterprise_12345/securityClassification-6VMVochwUWo/schema`.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of updateMetadataTemplateEnterpriseSecurityClassificationSchemaDelete method
    ///   - headers: Headers of updateMetadataTemplateEnterpriseSecurityClassificationSchemaDelete method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func updateMetadataTemplateEnterpriseSecurityClassificationSchemaDelete(requestBody: [UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteRequestBodyArg], headers: UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteHeadersArg = UpdateMetadataTemplateEnterpriseSecurityClassificationSchemaDeleteHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema#delete")", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.data)
    }

    /// When an enterprise does not yet have any classifications, this API call
    /// initializes the classification template with an initial set of
    /// classifications.
    /// 
    /// If an enterprise already has a classification, the template will already
    /// exist and instead an API call should be made to add additional
    /// classifications.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createMetadataTemplateSchemaClassification method
    ///   - headers: Headers of createMetadataTemplateSchemaClassification method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func createMetadataTemplateSchemaClassification(requestBody: CreateMetadataTemplateSchemaClassificationRequestBodyArg, headers: CreateMetadataTemplateSchemaClassificationHeadersArg = CreateMetadataTemplateSchemaClassificationHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/schema#classifications")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.data)
    }

}
