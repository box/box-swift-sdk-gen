import Foundation

public class EventsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getEvents(queryParams: GetEventsQueryParamsArg = GetEventsQueryParamsArg(), headers: GetEventsHeadersArg = GetEventsHeadersArg()) async throws -> Events {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["stream_type": Utils.Strings.toString(value: queryParams.streamType), "stream_position": Utils.Strings.toString(value: queryParams.streamPosition), "limit": Utils.Strings.toString(value: queryParams.limit), "event_type": Utils.Strings.toString(value: queryParams.eventType), "created_after": Utils.Strings.toString(value: queryParams.createdAfter), "created_before": Utils.Strings.toString(value: queryParams.createdBefore)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/events")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Events.deserialize(from: response.text)
    }

    public func getEventsWithLongPolling(headers: GetEventsWithLongPollingHeadersArg = GetEventsWithLongPollingHeadersArg()) async throws -> RealtimeServers {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/events")", options: FetchOptions(method: "OPTIONS", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try RealtimeServers.deserialize(from: response.text)
    }

}
