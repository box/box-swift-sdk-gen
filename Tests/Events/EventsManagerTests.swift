import Foundation
import BoxSdkGen
import XCTest

class EventsManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testEvents() async throws {
        let events: Events = try await client.events.getEvents()
        XCTAssertTrue(events.entries!.count > 0)
        let firstEvent: Event = events.entries![0]
        XCTAssertTrue(Utils.Strings.toString(value: firstEvent.createdBy!.type) == "user")
        XCTAssertTrue(Utils.Strings.toString(value: firstEvent.eventType!) != "")
    }

    public func testEventUpload() async throws {
        let events: Events = try await client.events.getEvents(queryParams: GetEventsQueryParams(streamType: GetEventsQueryParamsStreamTypeField.adminLogs, eventType: [GetEventsQueryParamsEventTypeField.upload]))
        XCTAssertTrue(events.entries!.count > 0)
        let firstEvent: Event = events.entries![0]
        XCTAssertTrue(Utils.Strings.toString(value: firstEvent.eventType!) == "UPLOAD")
    }

    public func testEventDeleteUser() async throws {
        let events: Events = try await client.events.getEvents(queryParams: GetEventsQueryParams(streamType: GetEventsQueryParamsStreamTypeField.adminLogs, eventType: [GetEventsQueryParamsEventTypeField.deleteUser]))
        XCTAssertTrue(events.entries!.count > 0)
        let firstEvent: Event = events.entries![0]
        XCTAssertTrue(Utils.Strings.toString(value: firstEvent.eventType!) == "DELETE_USER")
    }

    public func testEventSourceFileOrFolder() async throws {
        let events: Events = try await client.events.getEvents(queryParams: GetEventsQueryParams(streamType: GetEventsQueryParamsStreamTypeField.changes))
        XCTAssertTrue(events.entries!.count > 0)
    }

    public func testGetEventsWithLongPolling() async throws {
        let servers: RealtimeServers = try await client.events.getEventsWithLongPolling()
        XCTAssertTrue(servers.entries!.count > 0)
        let server: RealtimeServer = servers.entries![0]
        XCTAssertTrue(Utils.Strings.toString(value: server.type!) == "realtime_server")
        XCTAssertTrue(server.url! != "")
    }

    public func testGetEventsWithDateFilters() async throws {
        let createdAfterDate: Date = try Utils.Dates.dateTimeFromString(dateTime: "2024-06-09T00:00:00Z")
        let createdBeforeDate: Date = try Utils.Dates.dateTimeFromString(dateTime: "2025-06-09T00:00:00Z")
        let servers: Events = try await client.events.getEvents(queryParams: GetEventsQueryParams(streamType: GetEventsQueryParamsStreamTypeField.adminLogs, limit: 1, createdAfter: createdAfterDate, createdBefore: createdBeforeDate))
        XCTAssertTrue(servers.entries!.count == 1)
    }
}
