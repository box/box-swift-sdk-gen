import Foundation

public class ShieldInformationBarrierSegmentMembersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getShieldInformationBarrierSegmentMemberById(shieldInformationBarrierSegmentMemberId: String, headers: GetShieldInformationBarrierSegmentMemberByIdHeadersArg = GetShieldInformationBarrierSegmentMemberByIdHeadersArg()) async throws -> ShieldInformationBarrierSegmentMember {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segment_members/")\(shieldInformationBarrierSegmentMemberId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierSegmentMember.deserialize(from: response.text)
    }

    public func deleteShieldInformationBarrierSegmentMemberById(shieldInformationBarrierSegmentMemberId: String, headers: DeleteShieldInformationBarrierSegmentMemberByIdHeadersArg = DeleteShieldInformationBarrierSegmentMemberByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segment_members/")\(shieldInformationBarrierSegmentMemberId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getShieldInformationBarrierSegmentMembers(queryParams: GetShieldInformationBarrierSegmentMembersQueryParamsArg, headers: GetShieldInformationBarrierSegmentMembersHeadersArg = GetShieldInformationBarrierSegmentMembersHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["shield_information_barrier_segment_id": Utils.Strings.toString(value: queryParams.shieldInformationBarrierSegmentId), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segment_members")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
    }

    public func createShieldInformationBarrierSegmentMember(requestBody: CreateShieldInformationBarrierSegmentMemberRequestBodyArg, headers: CreateShieldInformationBarrierSegmentMemberHeadersArg = CreateShieldInformationBarrierSegmentMemberHeadersArg()) async throws -> ShieldInformationBarrierSegmentMember {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_segment_members")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierSegmentMember.deserialize(from: response.text)
    }

}
