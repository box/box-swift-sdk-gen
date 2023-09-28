import Foundation

public class ShieldInformationBarrierReportsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getShieldInformationBarrierReports(queryParams: GetShieldInformationBarrierReportsQueryParamsArg, headers: GetShieldInformationBarrierReportsHeadersArg = GetShieldInformationBarrierReportsHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["shield_information_barrier_id": Utils.Strings.toString(value: queryParams.shieldInformationBarrierId), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_reports")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
    }

    public func createShieldInformationBarrierReport(requestBody: ShieldInformationBarrierReference, headers: CreateShieldInformationBarrierReportHeadersArg = CreateShieldInformationBarrierReportHeadersArg()) async throws -> ShieldInformationBarrierReport {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_reports")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierReport.deserialize(from: response.text)
    }

    public func getShieldInformationBarrierReportById(shieldInformationBarrierReportId: String, headers: GetShieldInformationBarrierReportByIdHeadersArg = GetShieldInformationBarrierReportByIdHeadersArg()) async throws -> ShieldInformationBarrierReport {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/shield_information_barrier_reports/")\(shieldInformationBarrierReportId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try ShieldInformationBarrierReport.deserialize(from: response.text)
    }

}
