import Foundation

public class SignRequestsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Cancels a sign request.
    ///
    /// - Parameters:
    ///   - signRequestId: The ID of the sign request
    ///     Example: "33243242"
    ///   - headers: Headers of cancelSignRequest method
    /// - Returns: The `SignRequest`.
    /// - Throws: The `GeneralError`.
    public func cancelSignRequest(signRequestId: String, headers: CancelSignRequestHeadersArg = CancelSignRequestHeadersArg()) async throws -> SignRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests/")\(signRequestId)\("/cancel")", options: FetchOptions(method: "POST", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignRequest.deserialize(from: response.text)
    }

    /// Resends a sign request email to all outstanding signers.
    ///
    /// - Parameters:
    ///   - signRequestId: The ID of the sign request
    ///     Example: "33243242"
    ///   - headers: Headers of resendSignRequest method
    /// - Throws: The `GeneralError`.
    public func resendSignRequest(signRequestId: String, headers: ResendSignRequestHeadersArg = ResendSignRequestHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests/")\(signRequestId)\("/resend")", options: FetchOptions(method: "POST", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Gets a sign request by ID.
    ///
    /// - Parameters:
    ///   - signRequestId: The ID of the sign request
    ///     Example: "33243242"
    ///   - headers: Headers of getSignRequestById method
    /// - Returns: The `SignRequest`.
    /// - Throws: The `GeneralError`.
    public func getSignRequestById(signRequestId: String, headers: GetSignRequestByIdHeadersArg = GetSignRequestByIdHeadersArg()) async throws -> SignRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests/")\(signRequestId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignRequest.deserialize(from: response.text)
    }

    /// Gets sign requests created by a user. If the `sign_files` and/or
    /// `parent_folder` are deleted, the sign request will not return in the list.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getSignRequests method
    ///   - headers: Headers of getSignRequests method
    /// - Returns: The `SignRequests`.
    /// - Throws: The `GeneralError`.
    public func getSignRequests(queryParams: GetSignRequestsQueryParamsArg = GetSignRequestsQueryParamsArg(), headers: GetSignRequestsHeadersArg = GetSignRequestsHeadersArg()) async throws -> SignRequests {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignRequests.deserialize(from: response.text)
    }

    /// Creates a sign request. This involves preparing a document for signing and
    /// sending the sign request to signers.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createSignRequest method
    ///   - headers: Headers of createSignRequest method
    /// - Returns: The `SignRequest`.
    /// - Throws: The `GeneralError`.
    public func createSignRequest(requestBody: SignRequestCreateRequest, headers: CreateSignRequestHeadersArg = CreateSignRequestHeadersArg()) async throws -> SignRequest {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/sign_requests")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SignRequest.deserialize(from: response.text)
    }

}
