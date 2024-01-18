import Foundation
import BoxSdkGen
import XCTest

class SignRequestsManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testCreateGetCancelAndListSignRequest() async throws {
        let signerEmail: String = "\(Utils.getUUID())\("@box.com")"
        let fileToSign: FileFull = try await CommonsManager().uploadNewFile()
        let destinationFolder: FolderFull = try await CommonsManager().createNewFolder()
        let createdSignRequest: SignRequest = try await client.signRequests.createSignRequest(requestBody: SignRequestCreateRequest(parentFolder: FolderMini(id: destinationFolder.id, type: FolderBaseTypeField.folder), signers: [SignRequestCreateSigner(email: signerEmail)], sourceFiles: [FileBase(id: fileToSign.id, type: FileBaseTypeField.file)]))
        XCTAssertTrue(createdSignRequest.signFiles!.files![0].name == fileToSign.name)
        XCTAssertTrue(createdSignRequest.signers![1].email == signerEmail)
        XCTAssertTrue(createdSignRequest.parentFolder.id == destinationFolder.id)
        let newSignRequest: SignRequest = try await client.signRequests.getSignRequestById(signRequestId: createdSignRequest.id!)
        XCTAssertTrue(newSignRequest.signFiles!.files![0].name == fileToSign.name)
        XCTAssertTrue(newSignRequest.signers![1].email == signerEmail)
        XCTAssertTrue(newSignRequest.parentFolder.id == destinationFolder.id)
        let cancelledSignRequest: SignRequest = try await client.signRequests.cancelSignRequest(signRequestId: createdSignRequest.id!)
        XCTAssertTrue(Utils.Strings.toString(value: cancelledSignRequest.status) == "cancelled")
        let signRequests: SignRequests = try await client.signRequests.getSignRequests()
        XCTAssertTrue(Utils.Strings.toString(value: signRequests.entries![0].type!) == "sign-request")
        try await client.folders.deleteFolderById(folderId: destinationFolder.id, queryParams: DeleteFolderByIdQueryParams(recursive: true))
        try await client.files.deleteFileById(fileId: fileToSign.id)
    }
}