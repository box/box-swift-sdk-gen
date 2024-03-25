import Foundation
import BoxSdkGen
import XCTest

class ClientManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testWithAsUserHeader() async throws {
        let userName: String = Utils.getUUID()
        let createdUser: UserFull = try await client.users.createUser(requestBody: CreateUserRequestBody(name: userName, isPlatformAccessOnly: true))
        let asUserClient: BoxClient = client.withAsUserHeader(userId: createdUser.id)
        let adminUser: UserFull = try await client.users.getUserMe()
        XCTAssertTrue(Utils.Strings.toString(value: adminUser.name) != userName)
        let appUser: UserFull = try await asUserClient.users.getUserMe()
        XCTAssertTrue(Utils.Strings.toString(value: appUser.name) == userName)
        try await client.users.deleteUserById(userId: createdUser.id)
    }

    public func testWithExtraHeaders() async throws {
        let userName: String = Utils.getUUID()
        let createdUser: UserFull = try await client.users.createUser(requestBody: CreateUserRequestBody(name: userName, isPlatformAccessOnly: true))
        let asUserClient: BoxClient = client.withExtraHeaders(extraHeaders: ["As-User": createdUser.id])
        let adminUser: UserFull = try await client.users.getUserMe()
        XCTAssertTrue(Utils.Strings.toString(value: adminUser.name) != userName)
        let appUser: UserFull = try await asUserClient.users.getUserMe()
        XCTAssertTrue(Utils.Strings.toString(value: appUser.name) == userName)
        try await client.users.deleteUserById(userId: createdUser.id)
    }

    public func testWithCustomBaseUrls() async throws {
        let newBaseUrls: BaseUrls = BaseUrls(baseUrl: "https://box.com/", uploadUrl: "https://box.com/", oauth2Url: "https://box.com/")
        let customBaseClient: BoxClient = client.withCustomBaseUrls(baseUrls: newBaseUrls)
        await XCTAssertThrowsErrorAsync(try await customBaseClient.users.getUserMe())
    }
}
