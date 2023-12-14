import Foundation

public class TermsOfServiceUserStatusesManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves an overview of users and their status for a
    /// terms of service, including Whether they have accepted
    /// the terms and when.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getTermOfServiceUserStatuses method
    ///   - headers: Headers of getTermOfServiceUserStatuses method
    /// - Returns: The `TermsOfServiceUserStatuses`.
    /// - Throws: The `GeneralError`.
    public func getTermOfServiceUserStatuses(queryParams: GetTermOfServiceUserStatusesQueryParams, headers: GetTermOfServiceUserStatusesHeaders = GetTermOfServiceUserStatusesHeaders()) async throws -> TermsOfServiceUserStatuses {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["tos_id": Utils.Strings.toString(value: queryParams.tosId), "user_id": Utils.Strings.toString(value: queryParams.userId)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/terms_of_service_user_statuses")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfServiceUserStatuses.deserialize(from: response.data)
    }

    /// Sets the status for a terms of service for a user.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createTermOfServiceUserStatus method
    ///   - headers: Headers of createTermOfServiceUserStatus method
    /// - Returns: The `TermsOfServiceUserStatus`.
    /// - Throws: The `GeneralError`.
    public func createTermOfServiceUserStatus(requestBody: CreateTermOfServiceUserStatusRequestBody, headers: CreateTermOfServiceUserStatusHeaders = CreateTermOfServiceUserStatusHeaders()) async throws -> TermsOfServiceUserStatus {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/terms_of_service_user_statuses")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfServiceUserStatus.deserialize(from: response.data)
    }

    /// Updates the status for a terms of service for a user.
    ///
    /// - Parameters:
    ///   - termsOfServiceUserStatusId: The ID of the terms of service status.
    ///     Example: "324234"
    ///   - requestBody: Request body of updateTermOfServiceUserStatusById method
    ///   - headers: Headers of updateTermOfServiceUserStatusById method
    /// - Returns: The `TermsOfServiceUserStatus`.
    /// - Throws: The `GeneralError`.
    public func updateTermOfServiceUserStatusById(termsOfServiceUserStatusId: String, requestBody: UpdateTermOfServiceUserStatusByIdRequestBody, headers: UpdateTermOfServiceUserStatusByIdHeaders = UpdateTermOfServiceUserStatusByIdHeaders()) async throws -> TermsOfServiceUserStatus {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/terms_of_service_user_statuses/")\(termsOfServiceUserStatusId)", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfServiceUserStatus.deserialize(from: response.data)
    }

}
