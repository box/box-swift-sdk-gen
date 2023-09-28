import Foundation

public class WebhooksManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getWebhooks(queryParams: GetWebhooksQueryParamsArg = GetWebhooksQueryParamsArg(), headers: GetWebhooksHeadersArg = GetWebhooksHeadersArg()) async throws -> Webhooks {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/webhooks")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Webhooks.deserialize(from: response.text)
    }

    public func createWebhook(requestBody: CreateWebhookRequestBodyArg, headers: CreateWebhookHeadersArg = CreateWebhookHeadersArg()) async throws -> Webhook {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/webhooks")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Webhook.deserialize(from: response.text)
    }

    public func getWebhookById(webhookId: String, headers: GetWebhookByIdHeadersArg = GetWebhookByIdHeadersArg()) async throws -> Webhook {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/webhooks/")\(webhookId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Webhook.deserialize(from: response.text)
    }

    public func updateWebhookById(webhookId: String, requestBody: UpdateWebhookByIdRequestBodyArg = UpdateWebhookByIdRequestBodyArg(), headers: UpdateWebhookByIdHeadersArg = UpdateWebhookByIdHeadersArg()) async throws -> Webhook {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/webhooks/")\(webhookId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Webhook.deserialize(from: response.text)
    }

    public func deleteWebhookById(webhookId: String, headers: DeleteWebhookByIdHeadersArg = DeleteWebhookByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/webhooks/")\(webhookId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
