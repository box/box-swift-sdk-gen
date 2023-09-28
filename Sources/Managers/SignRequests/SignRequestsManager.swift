import Foundation

public class SignRequestsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func cancelSignRequest(signRequestId: String, headers: CancelSignRequestHeadersArg = CancelSignRequestHeadersArg()) async throws -> SignRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests/")\(signRequestId)\("/cancel")", options: FetchOptions(method: "POST", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignRequest.deserialize(from: response.text)
    }

    public func resendSignRequest(signRequestId: String, headers: ResendSignRequestHeadersArg = ResendSignRequestHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests/")\(signRequestId)\("/resend")", options: FetchOptions(method: "POST", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getSignRequestById(signRequestId: String, headers: GetSignRequestByIdHeadersArg = GetSignRequestByIdHeadersArg()) async throws -> SignRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests/")\(signRequestId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignRequest.deserialize(from: response.text)
    }

    public func getSignRequests(queryParams: GetSignRequestsQueryParamsArg = GetSignRequestsQueryParamsArg(), headers: GetSignRequestsHeadersArg = GetSignRequestsHeadersArg()) async throws -> SignRequests {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignRequests.deserialize(from: response.text)
    }

    public func createSignRequest(requestBody: SignRequestCreateRequest, headers: CreateSignRequestHeadersArg = CreateSignRequestHeadersArg()) async throws -> SignRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignRequest.deserialize(from: response.text)
    }

}
