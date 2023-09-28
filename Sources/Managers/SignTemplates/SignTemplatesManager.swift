import Foundation

public class SignTemplatesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getSignTemplates(queryParams: GetSignTemplatesQueryParamsArg = GetSignTemplatesQueryParamsArg(), headers: GetSignTemplatesHeadersArg = GetSignTemplatesHeadersArg()) async throws -> SignTemplates {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_templates")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignTemplates.deserialize(from: response.text)
    }

    public func getSignTemplateById(templateId: String, headers: GetSignTemplateByIdHeadersArg = GetSignTemplateByIdHeadersArg()) async throws -> SignTemplate {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_templates/")\(templateId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignTemplate.deserialize(from: response.text)
    }

}
