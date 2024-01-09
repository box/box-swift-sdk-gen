import Foundation
import BoxSdkGen
import XCTest

class TermsOfServicesManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testGetTermsOfServices() async throws {
        let tos: TermsOfService = try await CommonsManager().getOrCreateTermsOfServices()
        let updatedTos1: TermsOfService = try await client.termsOfServices.updateTermsOfServiceById(termsOfServiceId: tos.id, requestBody: UpdateTermsOfServiceByIdRequestBody(status: UpdateTermsOfServiceByIdRequestBodyStatusField.enabled, text: "Enabled TOS"))
        XCTAssertTrue(Utils.Strings.toString(value: updatedTos1.status) == "enabled")
        XCTAssertTrue(updatedTos1.text == "Enabled TOS")
        let updatedTos2: TermsOfService = try await client.termsOfServices.updateTermsOfServiceById(termsOfServiceId: tos.id, requestBody: UpdateTermsOfServiceByIdRequestBody(status: UpdateTermsOfServiceByIdRequestBodyStatusField.disabled, text: "Disabled TOS"))
        XCTAssertTrue(Utils.Strings.toString(value: updatedTos2.status) == "disabled")
        XCTAssertTrue(updatedTos2.text == "Disabled TOS")
        let listTos: TermsOfServices = try await client.termsOfServices.getTermsOfService()
        XCTAssertTrue(listTos.totalCount! > 0)
    }
}
