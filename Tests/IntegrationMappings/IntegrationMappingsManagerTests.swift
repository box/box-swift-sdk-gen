import Foundation
import BoxSdkGen
import XCTest

class IntegrationMappingsManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testSlackIntegrationMappings() async throws {
        let folder: FolderFull = try await client.folders.createFolder(requestBody: CreateFolderRequestBody(name: Utils.getUUID(), parent: CreateFolderRequestBodyParentField(id: "0")))
        let slackOrgId: String = "1"
        let partnerItemId: String = "1"
        let userId: String = Utils.getEnvironmentVariable(name: "USER_ID")
        let userClient: BoxClient = CommonsManager().getDefaultClientWithUserSubject(userId: userId)
        await XCTAssertThrowsErrorAsync(try await userClient.integrationMappings.createSlackIntegrationMapping(requestBody: IntegrationMappingSlackCreateRequest(partnerItem: IntegrationMappingPartnerItemSlack(id: partnerItemId, slackOrgId: .value(slackOrgId)), boxItem: IntegrationMappingBoxItemSlack(id: folder.id))))
        let integrationMappings: IntegrationMappings = try await userClient.integrationMappings.getSlackIntegrationMapping()
        XCTAssertTrue(integrationMappings.entries!.count == 0)
        let integrationMappingId: String = "123456"
        await XCTAssertThrowsErrorAsync(try await userClient.integrationMappings.updateSlackIntegrationMappingById(integrationMappingId: integrationMappingId, requestBody: UpdateSlackIntegrationMappingByIdRequestBody(boxItem: IntegrationMappingBoxItemSlack(id: "1234567"))))
        await XCTAssertThrowsErrorAsync(try await userClient.integrationMappings.deleteSlackIntegrationMappingById(integrationMappingId: integrationMappingId))
        try await client.folders.deleteFolderById(folderId: folder.id)
    }

    public func testTeamsIntegrationMappings() async throws {
        let folder: FolderFull = try await client.folders.createFolder(requestBody: CreateFolderRequestBody(name: Utils.getUUID(), parent: CreateFolderRequestBodyParentField(id: "0")))
        let tenantId: String = "1"
        let teamId: String = "2"
        let partnerItemId: String = "3"
        let userId: String = Utils.getEnvironmentVariable(name: "USER_ID")
        let userClient: BoxClient = CommonsManager().getDefaultClientWithUserSubject(userId: userId)
        await XCTAssertThrowsErrorAsync(try await userClient.integrationMappings.createTeamsIntegrationMapping(requestBody: IntegrationMappingTeamsCreateRequest(partnerItem: IntegrationMappingPartnerItemTeamsCreateRequest(type: IntegrationMappingPartnerItemTeamsCreateRequestTypeField.channel, id: partnerItemId, tenantId: tenantId, teamId: teamId), boxItem: FolderReference(id: folder.id))))
        await XCTAssertThrowsErrorAsync(try await userClient.integrationMappings.getTeamsIntegrationMapping())
        let integrationMappingId: String = "123456"
        await XCTAssertThrowsErrorAsync(try await userClient.integrationMappings.updateTeamsIntegrationMappingById(integrationMappingId: integrationMappingId, requestBody: UpdateTeamsIntegrationMappingByIdRequestBody(boxItem: FolderReference(id: "1234567"))))
        await XCTAssertThrowsErrorAsync(try await userClient.integrationMappings.deleteTeamsIntegrationMappingById(integrationMappingId: integrationMappingId))
        try await client.folders.deleteFolderById(folderId: folder.id)
    }
}
