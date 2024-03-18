import Foundation
import BoxSdkGen
import XCTest

class FolderMetadataManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testGlobalFolderMetadata() async throws {
        let folder: FolderFull = try await CommonsManager().createNewFolder()
        let folderMetadata: Metadatas = try await client.folderMetadata.getFolderMetadata(folderId: folder.id)
        XCTAssertTrue(folderMetadata.entries!.count == 0)
        let createdMetadata: MetadataFull = try await client.folderMetadata.createFolderMetadataById(folderId: folder.id, scope: CreateFolderMetadataByIdScope.global, templateKey: "properties", requestBody: ["abc": "xyz"])
        XCTAssertTrue(Utils.Strings.toString(value: createdMetadata.template) == "properties")
        XCTAssertTrue(Utils.Strings.toString(value: createdMetadata.scope) == "global")
        XCTAssertTrue(createdMetadata.version == 0)
        let receivedMetadata: MetadataFull = try await client.folderMetadata.getFolderMetadataById(folderId: folder.id, scope: GetFolderMetadataByIdScope.global, templateKey: "properties")
        XCTAssertTrue(receivedMetadata.extraData!["abc"] == "xyz")
        let newValue: String = "bar"
        let updatedMetadata: MetadataFull = try await client.folderMetadata.updateFolderMetadataById(folderId: folder.id, scope: UpdateFolderMetadataByIdScope.global, templateKey: "properties", requestBody: [UpdateFolderMetadataByIdRequestBody(op: UpdateFolderMetadataByIdRequestBodyOpField.replace, path: "/abc", value: newValue)])
        let receivedUpdatedMetadata: MetadataFull = try await client.folderMetadata.getFolderMetadataById(folderId: folder.id, scope: GetFolderMetadataByIdScope.global, templateKey: "properties")
        XCTAssertTrue(receivedUpdatedMetadata.extraData!["abc"] == newValue)
        try await client.folderMetadata.deleteFolderMetadataById(folderId: folder.id, scope: DeleteFolderMetadataByIdScope.global, templateKey: "properties")
        await XCTAssertThrowsErrorAsync(try await client.folderMetadata.getFolderMetadataById(folderId: folder.id, scope: GetFolderMetadataByIdScope.global, templateKey: "properties"))
        try await client.folders.deleteFolderById(folderId: folder.id)
    }
}
