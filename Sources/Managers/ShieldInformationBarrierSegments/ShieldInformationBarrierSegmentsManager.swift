import Foundation

public class ShieldInformationBarrierSegmentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getShieldInformationBarrierSegmentById(shieldInformationBarrierSegmentId: String, headers: GetShieldInformationBarrierSegmentByIdHeadersArg = GetShieldInformationBarrierSegmentByIdHeadersArg()) async throws -> ShieldInformationBarrierSegment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segments/")\(shieldInformationBarrierSegmentId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierSegment.deserialize(from: response.text)
    }

    public func updateShieldInformationBarrierSegmentById(shieldInformationBarrierSegmentId: String, requestBody: UpdateShieldInformationBarrierSegmentByIdRequestBodyArg = UpdateShieldInformationBarrierSegmentByIdRequestBodyArg(), headers: UpdateShieldInformationBarrierSegmentByIdHeadersArg = UpdateShieldInformationBarrierSegmentByIdHeadersArg()) async throws -> ShieldInformationBarrierSegment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segments/")\(shieldInformationBarrierSegmentId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierSegment.deserialize(from: response.text)
    }

    public func deleteShieldInformationBarrierSegmentById(shieldInformationBarrierSegmentId: String, headers: DeleteShieldInformationBarrierSegmentByIdHeadersArg = DeleteShieldInformationBarrierSegmentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segments/")\(shieldInformationBarrierSegmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getShieldInformationBarrierSegments(queryParams: GetShieldInformationBarrierSegmentsQueryParamsArg, headers: GetShieldInformationBarrierSegmentsHeadersArg = GetShieldInformationBarrierSegmentsHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["shield_information_barrier_id": Utils.Strings.toString(value: queryParams.shieldInformationBarrierId), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
    }

    public func createShieldInformationBarrierSegment(requestBody: CreateShieldInformationBarrierSegmentRequestBodyArg, headers: CreateShieldInformationBarrierSegmentHeadersArg = CreateShieldInformationBarrierSegmentHeadersArg()) async throws -> ShieldInformationBarrierSegment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segments")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierSegment.deserialize(from: response.text)
    }

}
