import Foundation

public class ShieldInformationBarriersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Get shield information barrier based on provided ID.
    ///
    /// - Parameters:
    ///   - shieldInformationBarrierId: The ID of the shield information barrier.
    ///     Example: "1910967"
    ///   - headers: Headers of getShieldInformationBarrierById method
    /// - Returns: The `ShieldInformationBarrier`.
    /// - Throws: The `GeneralError`.
    public func getShieldInformationBarrierById(shieldInformationBarrierId: String, headers: GetShieldInformationBarrierByIdHeadersArg = GetShieldInformationBarrierByIdHeadersArg()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barriers/")\(shieldInformationBarrierId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.text)
    }

    /// Change status of shield information barrier with the specified ID.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createShieldInformationBarrierChangeStatus method
    ///   - headers: Headers of createShieldInformationBarrierChangeStatus method
    /// - Returns: The `ShieldInformationBarrier`.
    /// - Throws: The `GeneralError`.
    public func createShieldInformationBarrierChangeStatus(requestBody: CreateShieldInformationBarrierChangeStatusRequestBodyArg, headers: CreateShieldInformationBarrierChangeStatusHeadersArg = CreateShieldInformationBarrierChangeStatusHeadersArg()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barriers/change_status")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.text)
    }

    /// Retrieves a list of shield information barrier objects
    /// for the enterprise of JWT.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getShieldInformationBarriers method
    ///   - headers: Headers of getShieldInformationBarriers method
    /// - Returns: The `ShieldInformationBarriers`.
    /// - Throws: The `GeneralError`.
    public func getShieldInformationBarriers(queryParams: GetShieldInformationBarriersQueryParamsArg = GetShieldInformationBarriersQueryParamsArg(), headers: GetShieldInformationBarriersHeadersArg = GetShieldInformationBarriersHeadersArg()) async throws -> ShieldInformationBarriers {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barriers")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarriers.deserialize(from: response.text)
    }

    /// Creates a shield information barrier to
    /// separate individuals/groups within the same
    /// firm and prevents confidential information passing between them.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createShieldInformationBarrier method
    ///   - headers: Headers of createShieldInformationBarrier method
    /// - Returns: The `ShieldInformationBarrier`.
    /// - Throws: The `GeneralError`.
    public func createShieldInformationBarrier(requestBody: CreateShieldInformationBarrierRequestBodyArg, headers: CreateShieldInformationBarrierHeadersArg = CreateShieldInformationBarrierHeadersArg()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barriers")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.text)
    }

}
