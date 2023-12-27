import Foundation
import BoxSdkGen
import XCTest

class IntegrationMappingsManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testIntegrationMappings() async throws {
        let folder: FolderFull = try await client.folders.createFolder(requestBody: CreateFolderRequestBody(name: Utils.getUUID(), parent: CreateFolderRequestBodyParentField(id: "0")))
        let slackOrgId: String = "1"
        let partnerItemId: String = "1"
        let userId: String = Utils.getEnvironmentVariable(name: "USER_ID")
        let userClient: BoxClient = try await CommonsManager().getDefaultClientAsUser(userId: userId)
        await XCTAssertThrowsErrorAsync(try await userClient.integrationMappings.createSlackIntegrationMapping(requestBody: IntegrationMappingSlackCreateRequest(partnerItem: IntegrationMappingPartnerItemSlack(type: IntegrationMappingPartnerItemSlackTypeField.channel, id: partnerItemId, slackOrgId: slackOrgId), boxItem: IntegrationMappingBoxItemSlack(type: IntegrationMappingBoxItemSlackTypeField.folder, id: folder.id))))
        let integrationMappings: IntegrationMappings = try await userClient.integrationMappings.getSlackIntegrationMapping()
        XCTAssertTrue(integrationMappings.entries!.count == 0)
        try await client.folders.deleteFolderById(folderId: folder.id)
    }
}
