import Foundation
import BoxSdkGen
import XCTest

class ChunkedUploadsManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testChunkedUpload() async throws {
        let fileSize: Int = 20 * 1024 * 1024
        let fileByteStream: InputStream = Utils.generateByteStream(size: fileSize)
        let fileName: String = Utils.getUUID()
        let parentFolderId: String = "0"
        let uploadedFile: File = try await client.chunkedUploads.uploadBigFile(file: fileByteStream, fileName: fileName, fileSize: Int64(fileSize), parentFolderId: parentFolderId)
        XCTAssertTrue(uploadedFile.name! == fileName)
        XCTAssertTrue(uploadedFile.size! == fileSize)
        XCTAssertTrue(uploadedFile.parent!.id == parentFolderId)
        try await client.files.deleteFileById(fileId: uploadedFile.id)
    }
}
