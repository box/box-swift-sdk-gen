import Foundation

public class IntegrationMappingsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getIntegrationMappingSlack(queryParams: GetIntegrationMappingSlackQueryParamsArg = GetIntegrationMappingSlackQueryParamsArg(), headers: GetIntegrationMappingSlackHeadersArg = GetIntegrationMappingSlackHeadersArg()) async throws -> IntegrationMappings {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "partner_item_type": Utils.Strings.toString(value: queryParams.partnerItemType), "partner_item_id": Utils.Strings.toString(value: queryParams.partnerItemId), "box_item_id": Utils.Strings.toString(value: queryParams.boxItemId), "box_item_type": Utils.Strings.toString(value: queryParams.boxItemType), "is_manually_created": Utils.Strings.toString(value: queryParams.isManuallyCreated)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/integration_mappings/slack")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try IntegrationMappings.deserialize(from: response.text)
    }

    public func createIntegrationMappingSlack(requestBody: IntegrationMappingSlackCreateRequest, headers: CreateIntegrationMappingSlackHeadersArg = CreateIntegrationMappingSlackHeadersArg()) async throws -> IntegrationMapping {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/integration_mappings/slack")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try IntegrationMapping.deserialize(from: response.text)
    }

    public func updateIntegrationMappingSlackById(integrationMappingId: String, requestBody: UpdateIntegrationMappingSlackByIdRequestBodyArg = UpdateIntegrationMappingSlackByIdRequestBodyArg(), headers: UpdateIntegrationMappingSlackByIdHeadersArg = UpdateIntegrationMappingSlackByIdHeadersArg()) async throws -> IntegrationMapping {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/integration_mappings/slack/")\(integrationMappingId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try IntegrationMapping.deserialize(from: response.text)
    }

    public func deleteIntegrationMappingSlackById(integrationMappingId: String, headers: DeleteIntegrationMappingSlackByIdHeadersArg = DeleteIntegrationMappingSlackByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/integration_mappings/slack/")\(integrationMappingId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
