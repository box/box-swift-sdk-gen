import Foundation

public class ShieldInformationBarriersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getShieldInformationBarrierById(shieldInformationBarrierId: String, headers: GetShieldInformationBarrierByIdHeadersArg = GetShieldInformationBarrierByIdHeadersArg()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barriers/")\(shieldInformationBarrierId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.text)
    }

    public func createShieldInformationBarrierChangeStatus(requestBody: CreateShieldInformationBarrierChangeStatusRequestBodyArg, headers: CreateShieldInformationBarrierChangeStatusHeadersArg = CreateShieldInformationBarrierChangeStatusHeadersArg()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barriers/change_status")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.text)
    }

    public func getShieldInformationBarriers(queryParams: GetShieldInformationBarriersQueryParamsArg = GetShieldInformationBarriersQueryParamsArg(), headers: GetShieldInformationBarriersHeadersArg = GetShieldInformationBarriersHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barriers")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
    }

    public func createShieldInformationBarrier(requestBody: ShieldInformationBarrier, headers: CreateShieldInformationBarrierHeadersArg = CreateShieldInformationBarrierHeadersArg()) async throws -> ShieldInformationBarrier {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barriers")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrier.deserialize(from: response.text)
    }

}
