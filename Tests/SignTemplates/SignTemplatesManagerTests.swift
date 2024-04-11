import Foundation
import BoxSdkGen
import XCTest

class SignTemplatesManagerTests: XCTestCase {

    public func testGetSignTemplates() async throws {
        let client: BoxClient = CommonsManager().getDefaultClientWithUserSubject(userId: Utils.getEnvironmentVariable(name: "USER_ID"))
        let signTemplates: SignTemplates = try await client.signTemplates.getSignTemplates(queryParams: GetSignTemplatesQueryParams(limit: 2))
        XCTAssertTrue(signTemplates.entries!.count >= 0)
    }

    public func testGetSignTemplate() async throws {
        let client: BoxClient = CommonsManager().getDefaultClientWithUserSubject(userId: Utils.getEnvironmentVariable(name: "USER_ID"))
        let signTemplates: SignTemplates = try await client.signTemplates.getSignTemplates(queryParams: GetSignTemplatesQueryParams(limit: 2))
        XCTAssertTrue(signTemplates.entries!.count >= 0)
        if signTemplates.entries!.count > 0 {
            let signTemplate: SignTemplate = try await client.signTemplates.getSignTemplateById(templateId: signTemplates.entries![0].id!)
            XCTAssertTrue(signTemplate.id == signTemplates.entries![0].id)
            XCTAssertTrue(signTemplate.sourceFiles!.count > 0)
            XCTAssertTrue(signTemplate.name != "")
            XCTAssertTrue(signTemplate.parentFolder!.id != "")
        }

    }
}
