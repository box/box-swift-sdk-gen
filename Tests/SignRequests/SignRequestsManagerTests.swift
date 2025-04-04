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
        let createdSignRequest: SignRequest = try await client.signRequests.createSignRequest(requestBody: SignRequestCreateRequest(signers: [SignRequestCreateSigner(email: signerEmail, role: SignRequestCreateSignerRoleField.signer, isInPerson: false, embedUrlExternalUserId: "123", declinedRedirectUrl: "https://www.box.com", loginRequired: false, password: "password", suppressNotifications: true)], isDocumentPreparationNeeded: false, redirectUrl: "https://www.box.com", declinedRedirectUrl: "https://www.box.com", areTextSignaturesEnabled: true, emailSubject: "Sign this document", emailMessage: "Please sign this document", areRemindersEnabled: true, name: "Sign Request", prefillTags: [SignRequestPrefillTag(documentTagId: "0", dateValue: try Utils.Dates.dateFromString(date: "2035-01-01"))], daysValid: Int64(30), externalId: "123", externalSystemName: "BoxSignIntegration", sourceFiles: [FileBase(id: fileToSign.id)], parentFolder: FolderMini(id: destinationFolder.id)))
        XCTAssertTrue(createdSignRequest.areRemindersEnabled == true)
        XCTAssertTrue(createdSignRequest.areTextSignaturesEnabled == true)
        XCTAssertTrue(createdSignRequest.daysValid == 30)
        XCTAssertTrue(createdSignRequest.declinedRedirectUrl == "https://www.box.com")
        XCTAssertTrue(createdSignRequest.emailMessage == "Please sign this document")
        XCTAssertTrue(createdSignRequest.emailSubject == "Sign this document")
        XCTAssertTrue(createdSignRequest.externalId == "123")
        XCTAssertTrue(createdSignRequest.externalSystemName == "BoxSignIntegration")
        XCTAssertTrue(createdSignRequest.isDocumentPreparationNeeded == false)
        XCTAssertTrue(createdSignRequest.name == "Sign Request.pdf")
        XCTAssertTrue(createdSignRequest.redirectUrl == "https://www.box.com")
        XCTAssertTrue(createdSignRequest.signFiles!.files![0].name == createdSignRequest.name)
        XCTAssertTrue(createdSignRequest.signers![1].email == signerEmail)
        XCTAssertTrue(createdSignRequest.signers![1].suppressNotifications == true)
        XCTAssertTrue(createdSignRequest.signers![1].declinedRedirectUrl == "https://www.box.com")
        XCTAssertTrue(createdSignRequest.signers![1].embedUrlExternalUserId == "123")
        XCTAssertTrue(createdSignRequest.signers![1].isInPerson == false)
        XCTAssertTrue(createdSignRequest.signers![1].loginRequired == false)
        XCTAssertTrue(Utils.Strings.toString(value: createdSignRequest.signers![1].role) == "signer")
        XCTAssertTrue(createdSignRequest.parentFolder!.id == destinationFolder.id)
        XCTAssertTrue(Utils.Dates.dateToString(date: createdSignRequest.prefillTags![0].dateValue!) == "2035-01-01")
        let newSignRequest: SignRequest = try await client.signRequests.getSignRequestById(signRequestId: createdSignRequest.id!)
        XCTAssertTrue(newSignRequest.signFiles!.files![0].name == createdSignRequest.name)
        XCTAssertTrue(newSignRequest.signers![1].email == signerEmail)
        XCTAssertTrue(newSignRequest.parentFolder!.id == destinationFolder.id)
        let cancelledSignRequest: SignRequest = try await client.signRequests.cancelSignRequest(signRequestId: createdSignRequest.id!)
        XCTAssertTrue(Utils.Strings.toString(value: cancelledSignRequest.status) == "cancelled")
        let signRequests: SignRequests = try await client.signRequests.getSignRequests()
        XCTAssertTrue(Utils.Strings.toString(value: signRequests.entries![0].type!) == "sign-request")
        try await client.folders.deleteFolderById(folderId: destinationFolder.id, queryParams: DeleteFolderByIdQueryParams(recursive: true))
        try await client.files.deleteFileById(fileId: fileToSign.id)
    }

    public func testCreateSignRequestWithSignerGroupId() async throws {
        let signer1Email: String = "\(Utils.getUUID())\("@box.com")"
        let signer2Email: String = "\(Utils.getUUID())\("@box.com")"
        let fileToSign: FileFull = try await CommonsManager().uploadNewFile()
        let destinationFolder: FolderFull = try await CommonsManager().createNewFolder()
        let createdSignRequest: SignRequest = try await client.signRequests.createSignRequest(requestBody: SignRequestCreateRequest(signers: [SignRequestCreateSigner(email: signer1Email, signerGroupId: "user"), SignRequestCreateSigner(email: signer2Email, signerGroupId: "user")], sourceFiles: [FileBase(id: fileToSign.id)], parentFolder: FolderMini(id: destinationFolder.id)))
        XCTAssertTrue(createdSignRequest.signers!.count == 3)
        XCTAssertTrue(createdSignRequest.signers![1].signerGroupId != nil)
        XCTAssertTrue(createdSignRequest.signers![1].signerGroupId == createdSignRequest.signers![2].signerGroupId)
        try await client.folders.deleteFolderById(folderId: destinationFolder.id, queryParams: DeleteFolderByIdQueryParams(recursive: true))
        try await client.files.deleteFileById(fileId: fileToSign.id)
    }
}
