import Foundation
import BoxSdkGen
import XCTest

class HubsManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClientWithUserSubject(userId: Utils.getEnvironmentVariable(name: "USER_ID"))
    }

    public func testGetAndDeleteHubs() async throws {
        let userHubs: HubsV2025R0 = try await client.hubs.getHubsV2025R0(queryParams: GetHubsV2025R0QueryParams(scope: "all", sort: "name", direction: GetHubsV2025R0QueryParamsDirectionField.asc))
        XCTAssertTrue(userHubs.entries!.count > 0)
        let userHub: HubV2025R0 = userHubs.entries![0]
        XCTAssertTrue(userHub.title != "")
        XCTAssertTrue(userHub.id != "")
        XCTAssertTrue(Utils.Strings.toString(value: userHub.type) == "hubs")
        let enterpriseHubs: HubsV2025R0 = try await client.hubs.getEnterpriseHubsV2025R0(queryParams: GetEnterpriseHubsV2025R0QueryParams(sort: "name", direction: GetEnterpriseHubsV2025R0QueryParamsDirectionField.asc))
        XCTAssertTrue(enterpriseHubs.entries!.count > 0)
        let enterpriseHub: HubV2025R0 = enterpriseHubs.entries![0]
        XCTAssertTrue(enterpriseHub.title != "")
        XCTAssertTrue(enterpriseHub.id != "")
        XCTAssertTrue(Utils.Strings.toString(value: enterpriseHub.type) == "hubs")
        let hub: HubV2025R0 = try await client.hubs.getHubByIdV2025R0(hubId: userHub.id)
        XCTAssertTrue(hub.title != "")
        XCTAssertTrue(hub.id != "")
        XCTAssertTrue(Utils.Strings.toString(value: hub.type) == "hubs")
        if enterpriseHubs.entries!.count > 10 {
            try await client.hubs.deleteHubByIdV2025R0(hubId: hub.id)
        }

    }
}
