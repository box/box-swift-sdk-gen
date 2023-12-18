import Foundation
import BoxSdkGen
import XCTest

class FileMetadataManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testFileMetadata() async throws {
        let file: FileFull = try await CommonsManager().uploadNewFile()
        let fileMetadata: Metadatas = try await client.fileMetadata.getFileMetadata(fileId: file.id)
        XCTAssertTrue(fileMetadata.entries!.count == 0)
        let createdMetadata: MetadataFull = try await client.fileMetadata.createFileMetadataById(fileId: file.id, scope: CreateFileMetadataByIdScope.global, templateKey: "properties", requestBody: ["abc": "xyz"])
        XCTAssertTrue(Utils.Strings.toString(value: createdMetadata.template) == "properties")
        XCTAssertTrue(Utils.Strings.toString(value: createdMetadata.scope) == "global")
        XCTAssertTrue(createdMetadata.version == 0)
        let receivedMetadata: MetadataFull = try await client.fileMetadata.getFileMetadataById(fileId: file.id, scope: GetFileMetadataByIdScope.global, templateKey: "properties")
        XCTAssertTrue(receivedMetadata.extraData!["abc"] == "xyz")
        let newValue: String = "bar"
        let updatedMetadata: MetadataFull = try await client.fileMetadata.updateFileMetadataById(fileId: file.id, scope: UpdateFileMetadataByIdScope.global, templateKey: "properties", requestBody: [UpdateFileMetadataByIdRequestBody(op: UpdateFileMetadataByIdRequestBodyOpField.replace, path: "/abc", value: newValue)])
        let receivedUpdatedMetadata: MetadataFull = try await client.fileMetadata.getFileMetadataById(fileId: file.id, scope: GetFileMetadataByIdScope.global, templateKey: "properties")
        XCTAssertTrue(receivedUpdatedMetadata.extraData!["abc"] == newValue)
        try await client.fileMetadata.deleteFileMetadataById(fileId: file.id, scope: DeleteFileMetadataByIdScope.global, templateKey: "properties")
        await XCTAssertThrowsErrorAsync(try await client.fileMetadata.getFileMetadataById(fileId: file.id, scope: GetFileMetadataByIdScope.global, templateKey: "properties"))
        try await client.files.deleteFileById(fileId: file.id)
    }
}
