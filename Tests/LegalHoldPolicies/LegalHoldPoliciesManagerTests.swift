import Foundation
import BoxSdkGen
import XCTest

class LegalHoldPoliciesManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testCreateUpdateGetDeleteLegalHoldPolicy() async throws {
        let legalHoldPolicyName: String = Utils.getUUID()
        let legalHoldDescription: String = "test description"
        let legalHoldPolicy: LegalHoldPolicy = try await client.legalHoldPolicies.createLegalHoldPolicy(requestBody: CreateLegalHoldPolicyRequestBody(policyName: legalHoldPolicyName, description: legalHoldDescription, isOngoing: true))
        XCTAssertTrue(legalHoldPolicy.policyName == legalHoldPolicyName)
        XCTAssertTrue(legalHoldPolicy.description == legalHoldDescription)
        let legalHoldPolicyId: String = legalHoldPolicy.id
        let legalHoldPolicyById: LegalHoldPolicy = try await client.legalHoldPolicies.getLegalHoldPolicyById(legalHoldPolicyId: legalHoldPolicyId)
        XCTAssertTrue(legalHoldPolicyById.id == legalHoldPolicyId)
        let legalHoldPolicies: LegalHoldPolicies = try await client.legalHoldPolicies.getLegalHoldPolicies()
        XCTAssertTrue(legalHoldPolicies.entries!.count > 0)
        let updatedLegalHoldPolicyName: String = Utils.getUUID()
        let updatedLegalHoldPolicy: LegalHoldPolicy = try await client.legalHoldPolicies.updateLegalHoldPolicyById(legalHoldPolicyId: legalHoldPolicyId, requestBody: UpdateLegalHoldPolicyByIdRequestBody(policyName: updatedLegalHoldPolicyName))
        XCTAssertTrue(updatedLegalHoldPolicy.policyName == updatedLegalHoldPolicyName)
        try await client.legalHoldPolicies.deleteLegalHoldPolicyById(legalHoldPolicyId: legalHoldPolicyId)
    }
}