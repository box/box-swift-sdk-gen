import Foundation
import BoxSdkGen
import XCTest

class UploadsManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testUploadFileAndFileVersion() async throws {
        let newFileName: String = Utils.getUUID()
        let fileContentStream: InputStream = Utils.generateByteStream(size: 1024 * 1024)
        let uploadedFiles: Files = try await client.uploads.uploadFile(requestBody: UploadFileRequestBody(attributes: UploadFileRequestBodyAttributesField(name: newFileName, parent: UploadFileRequestBodyAttributesParentField(id: "0")), file: fileContentStream))
        let uploadedFile: FileFull = uploadedFiles.entries![0]
        XCTAssertTrue(uploadedFile.name == newFileName)
        let newFileVersionName: String = Utils.getUUID()
        let newFileContentStream: InputStream = Utils.generateByteStream(size: 1024 * 1024)
        let uploadedFilesVersion: Files = try await client.uploads.uploadFileVersion(fileId: uploadedFile.id, requestBody: UploadFileVersionRequestBody(attributes: UploadFileVersionRequestBodyAttributesField(name: newFileVersionName), file: newFileContentStream))
        let newFileVersion: FileFull = uploadedFilesVersion.entries![0]
        XCTAssertTrue(newFileVersion.name == newFileVersionName)
        try await client.files.deleteFileById(fileId: newFileVersion.id)
    }
}
