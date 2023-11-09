import Foundation

public class TermsOfServicesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Returns the current terms of service text and settings
    /// for the enterprise.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getTermOfServices method
    ///   - headers: Headers of getTermOfServices method
    /// - Returns: The `TermsOfServices`.
    /// - Throws: The `GeneralError`.
    public func getTermOfServices(queryParams: GetTermOfServicesQueryParamsArg = GetTermOfServicesQueryParamsArg(), headers: GetTermOfServicesHeadersArg = GetTermOfServicesHeadersArg()) async throws -> TermsOfServices {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["tos_type": Utils.Strings.toString(value: queryParams.tosType)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_services")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfServices.deserialize(from: response.data)
    }

    /// Creates a terms of service for a given enterprise
    /// and type of user.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createTermOfService method
    ///   - headers: Headers of createTermOfService method
    /// - Returns: The `Task`.
    /// - Throws: The `GeneralError`.
    public func createTermOfService(requestBody: CreateTermOfServiceRequestBodyArg, headers: CreateTermOfServiceHeadersArg = CreateTermOfServiceHeadersArg()) async throws -> Task {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_services")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Task.deserialize(from: response.data)
    }

    /// Fetches a specific terms of service.
    ///
    /// - Parameters:
    ///   - termsOfServiceId: The ID of the terms of service.
    ///     Example: "324234"
    ///   - headers: Headers of getTermOfServiceById method
    /// - Returns: The `TermsOfService`.
    /// - Throws: The `GeneralError`.
    public func getTermOfServiceById(termsOfServiceId: String, headers: GetTermOfServiceByIdHeadersArg = GetTermOfServiceByIdHeadersArg()) async throws -> TermsOfService {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_services/")\(termsOfServiceId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfService.deserialize(from: response.data)
    }

    /// Updates a specific terms of service.
    ///
    /// - Parameters:
    ///   - termsOfServiceId: The ID of the terms of service.
    ///     Example: "324234"
    ///   - requestBody: Request body of updateTermOfServiceById method
    ///   - headers: Headers of updateTermOfServiceById method
    /// - Returns: The `TermsOfService`.
    /// - Throws: The `GeneralError`.
    public func updateTermOfServiceById(termsOfServiceId: String, requestBody: UpdateTermOfServiceByIdRequestBodyArg, headers: UpdateTermOfServiceByIdHeadersArg = UpdateTermOfServiceByIdHeadersArg()) async throws -> TermsOfService {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_services/")\(termsOfServiceId)", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfService.deserialize(from: response.data)
    }

}
