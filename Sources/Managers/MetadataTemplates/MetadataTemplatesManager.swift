import Foundation

public class MetadataTemplatesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Finds a metadata template by searching for the ID of an instance of the
    /// template.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getMetadataTemplatesByInstanceId method
    ///   - headers: Headers of getMetadataTemplatesByInstanceId method
    /// - Returns: The `MetadataTemplates`.
    /// - Throws: The `GeneralError`.
    public func getMetadataTemplatesByInstanceId(queryParams: GetMetadataTemplatesByInstanceIdQueryParamsArg, headers: GetMetadataTemplatesByInstanceIdHeadersArg = GetMetadataTemplatesByInstanceIdHeadersArg()) async throws -> MetadataTemplates {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["metadata_instance_id": Utils.Strings.toString(value: queryParams.metadataInstanceId)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplates.deserialize(from: response.data)
    }

    /// Retrieves a metadata template by its `scope` and `templateKey` values.
    /// 
    /// To find the `scope` and `templateKey` for a template, list all templates for
    /// an enterprise or globally, or list all templates applied to a file or folder.
    ///
    /// - Parameters:
    ///   - scope: The scope of the metadata template
    ///     Example: "global"
    ///   - templateKey: The name of the metadata template
    ///     Example: "properties"
    ///   - headers: Headers of getMetadataTemplate method
    /// - Returns: The `MetadataTemplate`.
    /// - Throws: The `GeneralError`.
    public func getMetadataTemplate(scope: GetMetadataTemplateScopeArg, templateKey: String, headers: GetMetadataTemplateHeadersArg = GetMetadataTemplateHeadersArg()) async throws -> MetadataTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/")\(scope)\("/")\(templateKey)\("/schema")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplate.deserialize(from: response.data)
    }

    /// Updates a metadata template.
    /// 
    /// The metadata template can only be updated if the template
    /// already exists.
    /// 
    /// The update is applied atomically. If any errors occur during the
    /// application of the operations, the metadata template will not be changed.
    ///
    /// - Parameters:
    ///   - scope: The scope of the metadata template
    ///     Example: "global"
    ///   - templateKey: The name of the metadata template
    ///     Example: "properties"
    ///   - requestBody: Request body of updateMetadataTemplate method
    ///   - headers: Headers of updateMetadataTemplate method
    /// - Returns: The `MetadataTemplate`.
    /// - Throws: The `GeneralError`.
    public func updateMetadataTemplate(scope: UpdateMetadataTemplateScopeArg, templateKey: String, requestBody: [UpdateMetadataTemplateRequestBodyArg], headers: UpdateMetadataTemplateHeadersArg = UpdateMetadataTemplateHeadersArg()) async throws -> MetadataTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/")\(scope)\("/")\(templateKey)\("/schema")", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplate.deserialize(from: response.data)
    }

    /// Delete a metadata template and its instances.
    /// This deletion is permanent and can not be reversed.
    ///
    /// - Parameters:
    ///   - scope: The scope of the metadata template
    ///     Example: "global"
    ///   - templateKey: The name of the metadata template
    ///     Example: "properties"
    ///   - headers: Headers of deleteMetadataTemplate method
    /// - Throws: The `GeneralError`.
    public func deleteMetadataTemplate(scope: DeleteMetadataTemplateScopeArg, templateKey: String, headers: DeleteMetadataTemplateHeadersArg = DeleteMetadataTemplateHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/")\(scope)\("/")\(templateKey)\("/schema")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Retrieves a metadata template by its ID.
    ///
    /// - Parameters:
    ///   - templateId: The ID of the template
    ///     Example: "f7a9891f"
    ///   - headers: Headers of getMetadataTemplateById method
    /// - Returns: The `MetadataTemplate`.
    /// - Throws: The `GeneralError`.
    public func getMetadataTemplateById(templateId: String, headers: GetMetadataTemplateByIdHeadersArg = GetMetadataTemplateByIdHeadersArg()) async throws -> MetadataTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/")\(templateId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplate.deserialize(from: response.data)
    }

    /// Used to retrieve all generic, global metadata templates available to all
    /// enterprises using Box.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getGlobalMetadataTemplates method
    ///   - headers: Headers of getGlobalMetadataTemplates method
    /// - Returns: The `MetadataTemplates`.
    /// - Throws: The `GeneralError`.
    public func getGlobalMetadataTemplates(queryParams: GetGlobalMetadataTemplatesQueryParamsArg = GetGlobalMetadataTemplatesQueryParamsArg(), headers: GetGlobalMetadataTemplatesHeadersArg = GetGlobalMetadataTemplatesHeadersArg()) async throws -> MetadataTemplates {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/global")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplates.deserialize(from: response.data)
    }

    /// Used to retrieve all metadata templates created to be used specifically within
    /// the user's enterprise
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getEnterpriseMetadataTemplates method
    ///   - headers: Headers of getEnterpriseMetadataTemplates method
    /// - Returns: The `MetadataTemplates`.
    /// - Throws: The `GeneralError`.
    public func getEnterpriseMetadataTemplates(queryParams: GetEnterpriseMetadataTemplatesQueryParamsArg = GetEnterpriseMetadataTemplatesQueryParamsArg(), headers: GetEnterpriseMetadataTemplatesHeadersArg = GetEnterpriseMetadataTemplatesHeadersArg()) async throws -> MetadataTemplates {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/enterprise")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplates.deserialize(from: response.data)
    }

    /// Creates a new metadata template that can be applied to
    /// files and folders.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createMetadataTemplate method
    ///   - headers: Headers of createMetadataTemplate method
    /// - Returns: The `MetadataTemplate`.
    /// - Throws: The `GeneralError`.
    public func createMetadataTemplate(requestBody: CreateMetadataTemplateRequestBodyArg, headers: CreateMetadataTemplateHeadersArg = CreateMetadataTemplateHeadersArg()) async throws -> MetadataTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/metadata_templates/schema")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try MetadataTemplate.deserialize(from: response.data)
    }

}
