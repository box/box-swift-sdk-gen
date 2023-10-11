import Foundation

public class ShieldInformationBarrierSegmentRestrictionsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves a shield information barrier segment
    /// restriction based on provided ID.
    ///
    /// - Parameters:
    ///   - shieldInformationBarrierSegmentRestrictionId: The ID of the shield information barrier segment Restriction.
    ///     Example: "4563"
    ///   - headers: Headers of getShieldInformationBarrierSegmentRestrictionById method
    /// - Returns: The `ShieldInformationBarrierSegmentRestriction`.
    /// - Throws: The `GeneralError`.
    public func getShieldInformationBarrierSegmentRestrictionById(shieldInformationBarrierSegmentRestrictionId: String, headers: GetShieldInformationBarrierSegmentRestrictionByIdHeadersArg = GetShieldInformationBarrierSegmentRestrictionByIdHeadersArg()) async throws -> ShieldInformationBarrierSegmentRestriction {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segment_restrictions/")\(shieldInformationBarrierSegmentRestrictionId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierSegmentRestriction.deserialize(from: response.text)
    }

    /// Delete shield information barrier segment restriction
    /// based on provided ID.
    ///
    /// - Parameters:
    ///   - shieldInformationBarrierSegmentRestrictionId: The ID of the shield information barrier segment Restriction.
    ///     Example: "4563"
    ///   - headers: Headers of deleteShieldInformationBarrierSegmentRestrictionById method
    /// - Throws: The `GeneralError`.
    public func deleteShieldInformationBarrierSegmentRestrictionById(shieldInformationBarrierSegmentRestrictionId: String, headers: DeleteShieldInformationBarrierSegmentRestrictionByIdHeadersArg = DeleteShieldInformationBarrierSegmentRestrictionByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segment_restrictions/")\(shieldInformationBarrierSegmentRestrictionId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Lists shield information barrier segment restrictions
    /// based on provided segment ID.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getShieldInformationBarrierSegmentRestrictions method
    ///   - headers: Headers of getShieldInformationBarrierSegmentRestrictions method
    /// - Throws: The `GeneralError`.
    public func getShieldInformationBarrierSegmentRestrictions(queryParams: GetShieldInformationBarrierSegmentRestrictionsQueryParamsArg, headers: GetShieldInformationBarrierSegmentRestrictionsHeadersArg = GetShieldInformationBarrierSegmentRestrictionsHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["shield_information_barrier_segment_id": Utils.Strings.toString(value: queryParams.shieldInformationBarrierSegmentId), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segment_restrictions")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
    }

    /// Creates a shield information barrier
    /// segment restriction object.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createShieldInformationBarrierSegmentRestriction method
    ///   - headers: Headers of createShieldInformationBarrierSegmentRestriction method
    /// - Returns: The `ShieldInformationBarrierSegmentRestriction`.
    /// - Throws: The `GeneralError`.
    public func createShieldInformationBarrierSegmentRestriction(requestBody: CreateShieldInformationBarrierSegmentRestrictionRequestBodyArg, headers: CreateShieldInformationBarrierSegmentRestrictionHeadersArg = CreateShieldInformationBarrierSegmentRestrictionHeadersArg()) async throws -> ShieldInformationBarrierSegmentRestriction {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segment_restrictions")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierSegmentRestriction.deserialize(from: response.text)
    }

}
