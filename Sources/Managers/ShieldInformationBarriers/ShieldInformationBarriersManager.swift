import Foundation

public class ShieldInformationBarriersManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
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
    public func getShieldInformationBarrierById(shieldInformationBarrierId: String, headers: GetShieldInformationBarrierByIdHeaders = GetShieldInformationBarrierByIdHeaders()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/2.0/shield_information_barriers/")\(shieldInformationBarrierId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.data)
    }

    /// Change status of shield information barrier with the specified ID.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of updateShieldInformationBarrierStatus method
    ///   - headers: Headers of updateShieldInformationBarrierStatus method
    /// - Returns: The `ShieldInformationBarrier`.
    /// - Throws: The `GeneralError`.
    public func updateShieldInformationBarrierStatus(requestBody: UpdateShieldInformationBarrierStatusRequestBody, headers: UpdateShieldInformationBarrierStatusHeaders = UpdateShieldInformationBarrierStatusHeaders()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/2.0/shield_information_barriers/change_status")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.data)
    }

    /// Retrieves a list of shield information barrier objects
    /// for the enterprise of JWT.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getShieldInformationBarriers method
    ///   - headers: Headers of getShieldInformationBarriers method
    /// - Returns: The `ShieldInformationBarriers`.
    /// - Throws: The `GeneralError`.
    public func getShieldInformationBarriers(queryParams: GetShieldInformationBarriersQueryParams = GetShieldInformationBarriersQueryParams(), headers: GetShieldInformationBarriersHeaders = GetShieldInformationBarriersHeaders()) async throws -> ShieldInformationBarriers {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/2.0/shield_information_barriers")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarriers.deserialize(from: response.data)
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
    public func createShieldInformationBarrier(requestBody: CreateShieldInformationBarrierRequestBody, headers: CreateShieldInformationBarrierHeaders = CreateShieldInformationBarrierHeaders()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/2.0/shield_information_barriers")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.data)
    }

}
