import Foundation

public class IntegrationMappingsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Lists [Slack integration mappings](https://support.box.com/hc/en-us/articles/4415585987859-Box-as-the-Content-Layer-for-Slack) in a users' enterprise.
    /// 
    /// You need Admin or Co-Admin role to
    /// use this endpoint.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getIntegrationMappingSlack method
    ///   - headers: Headers of getIntegrationMappingSlack method
    /// - Returns: The `IntegrationMappings`.
    /// - Throws: The `GeneralError`.
    public func getIntegrationMappingSlack(queryParams: GetIntegrationMappingSlackQueryParamsArg = GetIntegrationMappingSlackQueryParamsArg(), headers: GetIntegrationMappingSlackHeadersArg = GetIntegrationMappingSlackHeadersArg()) async throws -> IntegrationMappings {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "partner_item_type": Utils.Strings.toString(value: queryParams.partnerItemType), "partner_item_id": Utils.Strings.toString(value: queryParams.partnerItemId), "box_item_id": Utils.Strings.toString(value: queryParams.boxItemId), "box_item_type": Utils.Strings.toString(value: queryParams.boxItemType), "is_manually_created": Utils.Strings.toString(value: queryParams.isManuallyCreated)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/integration_mappings/slack")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try IntegrationMappings.deserialize(from: response.text)
    }

    /// Creates a [Slack integration mapping](https://support.box.com/hc/en-us/articles/4415585987859-Box-as-the-Content-Layer-for-Slack)
    /// by mapping a Slack channel to a Box item.
    /// 
    /// You need Admin or Co-Admin role to
    /// use this endpoint.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createIntegrationMappingSlack method
    ///   - headers: Headers of createIntegrationMappingSlack method
    /// - Returns: The `IntegrationMapping`.
    /// - Throws: The `GeneralError`.
    public func createIntegrationMappingSlack(requestBody: IntegrationMappingSlackCreateRequest, headers: CreateIntegrationMappingSlackHeadersArg = CreateIntegrationMappingSlackHeadersArg()) async throws -> IntegrationMapping {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/integration_mappings/slack")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try IntegrationMapping.deserialize(from: response.text)
    }

    /// Updates a [Slack integration mapping](https://support.box.com/hc/en-us/articles/4415585987859-Box-as-the-Content-Layer-for-Slack).
    /// Supports updating the Box folder ID and options.
    /// 
    /// You need Admin or Co-Admin role to
    /// use this endpoint.
    ///
    /// - Parameters:
    ///   - integrationMappingId: An ID of an integration mapping
    ///     Example: "11235432"
    ///   - requestBody: Request body of updateIntegrationMappingSlackById method
    ///   - headers: Headers of updateIntegrationMappingSlackById method
    /// - Returns: The `IntegrationMapping`.
    /// - Throws: The `GeneralError`.
    public func updateIntegrationMappingSlackById(integrationMappingId: String, requestBody: UpdateIntegrationMappingSlackByIdRequestBodyArg = UpdateIntegrationMappingSlackByIdRequestBodyArg(), headers: UpdateIntegrationMappingSlackByIdHeadersArg = UpdateIntegrationMappingSlackByIdHeadersArg()) async throws -> IntegrationMapping {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/integration_mappings/slack/")\(integrationMappingId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try IntegrationMapping.deserialize(from: response.text)
    }

    /// Deletes a [Slack integration mapping](https://support.box.com/hc/en-us/articles/4415585987859-Box-as-the-Content-Layer-for-Slack).
    /// 
    /// 
    /// You need Admin or Co-Admin role to
    /// use this endpoint.
    ///
    /// - Parameters:
    ///   - integrationMappingId: An ID of an integration mapping
    ///     Example: "11235432"
    ///   - headers: Headers of deleteIntegrationMappingSlackById method
    /// - Throws: The `GeneralError`.
    public func deleteIntegrationMappingSlackById(integrationMappingId: String, headers: DeleteIntegrationMappingSlackByIdHeadersArg = DeleteIntegrationMappingSlackByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/integration_mappings/slack/")\(integrationMappingId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
