import Foundation

public class DevicePinnersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getDevicePinnerById(devicePinnerId: String, headers: GetDevicePinnerByIdHeadersArg = GetDevicePinnerByIdHeadersArg()) async throws -> DevicePinner {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/device_pinners/")\(devicePinnerId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try DevicePinner.deserialize(from: response.text)
    }

    public func deleteDevicePinnerById(devicePinnerId: String, headers: DeleteDevicePinnerByIdHeadersArg = DeleteDevicePinnerByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/device_pinners/")\(devicePinnerId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getEnterpriseDevicePinners(enterpriseId: String, queryParams: GetEnterpriseDevicePinnersQueryParamsArg = GetEnterpriseDevicePinnersQueryParamsArg(), headers: GetEnterpriseDevicePinnersHeadersArg = GetEnterpriseDevicePinnersHeadersArg()) async throws -> DevicePinners {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "direction": Utils.Strings.toString(value: queryParams.direction)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/enterprises/")\(enterpriseId)\("/device_pinners")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try DevicePinners.deserialize(from: response.text)
    }

}
