import Foundation
import BoxSdkGen
import XCTest

class RecentItemsManagerTests: XCTestCase {

    public func testRecentItems() async throws {
        let client: BoxClient = try await CommonsManager().getDefaultClientWithUserSubject(userId: Utils.getEnvironmentVariable(name: "USER_ID"))
        let recentItems: RecentItems = try await client.recentItems.getRecentItems()
        XCTAssertTrue(recentItems.entries!.count >= 0)
    }
}
