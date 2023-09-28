import Foundation

public class TermsOfServiceUserStatusesManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getTermOfServiceUserStatuses(queryParams: GetTermOfServiceUserStatusesQueryParamsArg, headers: GetTermOfServiceUserStatusesHeadersArg = GetTermOfServiceUserStatusesHeadersArg()) async throws -> TermsOfServiceUserStatuses {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["tos_id": Utils.Strings.toString(value: queryParams.tosId), "user_id": Utils.Strings.toString(value: queryParams.userId)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_service_user_statuses")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfServiceUserStatuses.deserialize(from: response.text)
    }

    public func createTermOfServiceUserStatus(requestBody: CreateTermOfServiceUserStatusRequestBodyArg, headers: CreateTermOfServiceUserStatusHeadersArg = CreateTermOfServiceUserStatusHeadersArg()) async throws -> TermsOfServiceUserStatus {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_service_user_statuses")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfServiceUserStatus.deserialize(from: response.text)
    }

    public func updateTermOfServiceUserStatusById(termsOfServiceUserStatusId: String, requestBody: UpdateTermOfServiceUserStatusByIdRequestBodyArg, headers: UpdateTermOfServiceUserStatusByIdHeadersArg = UpdateTermOfServiceUserStatusByIdHeadersArg()) async throws -> TermsOfServiceUserStatus {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/terms_of_service_user_statuses/")\(termsOfServiceUserStatusId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TermsOfServiceUserStatus.deserialize(from: response.text)
    }

}
