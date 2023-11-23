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
    ///   - headers: Headers of getClassificationTemplate method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func getClassificationTemplate(headers: GetClassificationTemplateHeadersArg = GetClassificationTemplateHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.data)
    }

    /// Adds one or more new classifications to the list of classifications
    /// available to the enterprise.
    /// 
    /// This API can also be called by including the enterprise ID in the
    /// URL explicitly, for example
    /// `/metadata_templates/enterprise_12345/securityClassification-6VMVochwUWo/schema`.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of addClassification method
    ///   - headers: Headers of addClassification method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func addClassification(requestBody: [AddClassificationRequestBodyArg], headers: AddClassificationHeadersArg = AddClassificationHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema#add")", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
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
    ///   - requestBody: Request body of updateClassification method
    ///   - headers: Headers of updateClassification method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func updateClassification(requestBody: [UpdateClassificationRequestBodyArg], headers: UpdateClassificationHeadersArg = UpdateClassificationHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema#update")", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
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
    ///   - requestBody: Request body of createClassificationTemplate method
    ///   - headers: Headers of createClassificationTemplate method
    /// - Returns: The `ClassificationTemplate`.
    /// - Throws: The `GeneralError`.
    public func createClassificationTemplate(requestBody: CreateClassificationTemplateRequestBodyArg, headers: CreateClassificationTemplateHeadersArg = CreateClassificationTemplateHeadersArg()) async throws -> ClassificationTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/schema#classifications")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ClassificationTemplate.deserialize(from: response.data)
    }

}
