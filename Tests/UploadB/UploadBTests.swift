import Foundation
import BoxSdkGen
import XCTest

class MainTests: XCTestCase {
    var tempFolder: String = "./tmp"

    @discardableResult
    func shell(_ args: String...) -> Int32 {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }

    public func getBoxClient() -> BoxClient {
        let ccgClientId = "t1pjt4q1f9lnw4mj0kbvz4hdvzeep05k"
        let ccgClientSecret = "PsIFkmZNEcG4GaDoRbFzkDZBKc7BmOiS"
        let ccgEnterpriseId = "119037266"
        let ccgUserId = "6743333202"

        let config = CCGConfig(clientId: ccgClientId, clientSecret: ccgClientSecret, enterpriseId: ccgEnterpriseId, userId: ccgUserId)
        let auth = BoxCCGAuth(config: config)
        let client = BoxClient(auth: auth)
        return client
    }

    public func testUploadLargeFile() async throws {
        let client = getBoxClient()
        let randomInt = Int.random(in: 1...10000)
        let fileSize = 1 * 1024 * 1024 * 1024 - randomInt
        if !FileManager.default.fileExists(atPath: tempFolder) {
            try! FileManager.default.createDirectory(atPath: tempFolder, withIntermediateDirectories: true, attributes: nil)
        }
        let randomFileName = "500gb-\(UUID().uuidString).bin"
        let filePath = URL(fileURLWithPath: tempFolder).appendingPathComponent(randomFileName).path

        // Running the command truncate -s +{file_size} {file_path} to create a file with the specified size
        shell("truncate", "-s", "+\(fileSize)", filePath)

        let stream = InputStream(fileAtPath: filePath)!

        let uploadedFile = try await client.chunkedUploads.uploadBigFile(file: stream, fileName: randomFileName, fileSize: Int64(fileSize), parentFolderId: "0")
        print("File \"\(uploadedFile.name!)\" uploaded to Box with file ID \(uploadedFile.id)")
        XCTAssertEqual(uploadedFile.size, Int64(fileSize))
        try await client.files.deleteFileById(fileId: uploadedFile.id)
        try FileManager.default.removeItem(atPath: filePath)
    }
}
