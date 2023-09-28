import Foundation

public class TermsOfServicesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getTermOfServices(queryParams: GetTermOfServicesQueryParamsArg = GetTermOfServicesQueryParamsArg(), headers: GetTermOfServicesHeadersArg = GetTermOfServicesHeadersArg()) async throws -> TermsOfServices {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["tos_type": Utils.Strings.toString(value: queryParams.tosType)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_services")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfServices.deserialize(from: response.text)
    }

    public func createTermOfService(requestBody: CreateTermOfServiceRequestBodyArg, headers: CreateTermOfServiceHeadersArg = CreateTermOfServiceHeadersArg()) async throws -> Task {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_services")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Task.deserialize(from: response.text)
    }

    public func getTermOfServiceById(termsOfServiceId: String, headers: GetTermOfServiceByIdHeadersArg = GetTermOfServiceByIdHeadersArg()) async throws -> TermsOfService {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_services/")\(termsOfServiceId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfService.deserialize(from: response.text)
    }

    public func updateTermOfServiceById(termsOfServiceId: String, requestBody: UpdateTermOfServiceByIdRequestBodyArg, headers: UpdateTermOfServiceByIdHeadersArg = UpdateTermOfServiceByIdHeadersArg()) async throws -> TermsOfService {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_services/")\(termsOfServiceId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfService.deserialize(from: response.text)
    }

}
