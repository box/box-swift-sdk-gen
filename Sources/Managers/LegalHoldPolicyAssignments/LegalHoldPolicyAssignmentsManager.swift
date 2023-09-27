import Foundation

public class LegalHoldPolicyAssignmentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getLegalHoldPolicyAssignments(queryParams: GetLegalHoldPolicyAssignmentsQueryParamsArg, headers: GetLegalHoldPolicyAssignmentsHeadersArg = GetLegalHoldPolicyAssignmentsHeadersArg()) async throws -> LegalHoldPolicyAssignments {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["policy_id": Utils.Strings.toString(value: queryParams.policyId), "assign_to_type": Utils.Strings.toString(value: queryParams.assignToType), "assign_to_id": Utils.Strings.toString(value: queryParams.assignToId), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicyAssignments.deserialize(from: response.text)
    }

    public func createLegalHoldPolicyAssignment(requestBody: CreateLegalHoldPolicyAssignmentRequestBodyArg, headers: CreateLegalHoldPolicyAssignmentHeadersArg = CreateLegalHoldPolicyAssignmentHeadersArg()) async throws -> LegalHoldPolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicyAssignment.deserialize(from: response.text)
    }

    public func getLegalHoldPolicyAssignmentById(legalHoldPolicyAssignmentId: String, headers: GetLegalHoldPolicyAssignmentByIdHeadersArg = GetLegalHoldPolicyAssignmentByIdHeadersArg()) async throws -> LegalHoldPolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments/")\(legalHoldPolicyAssignmentId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicyAssignment.deserialize(from: response.text)
    }

    public func deleteLegalHoldPolicyAssignmentById(legalHoldPolicyAssignmentId: String, headers: DeleteLegalHoldPolicyAssignmentByIdHeadersArg = DeleteLegalHoldPolicyAssignmentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments/")\(legalHoldPolicyAssignmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func getLegalHoldPolicyAssignmentFileOnHold(legalHoldPolicyAssignmentId: String, queryParams: GetLegalHoldPolicyAssignmentFileOnHoldQueryParamsArg = GetLegalHoldPolicyAssignmentFileOnHoldQueryParamsArg(), headers: GetLegalHoldPolicyAssignmentFileOnHoldHeadersArg = GetLegalHoldPolicyAssignmentFileOnHoldHeadersArg()) async throws -> FileVersionLegalHolds {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments/")\(legalHoldPolicyAssignmentId)\("/files_on_hold")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionLegalHolds.deserialize(from: response.text)
    }

    public func getLegalHoldPolicyAssignmentFileVersionOnHold(legalHoldPolicyAssignmentId: String, queryParams: GetLegalHoldPolicyAssignmentFileVersionOnHoldQueryParamsArg = GetLegalHoldPolicyAssignmentFileVersionOnHoldQueryParamsArg(), headers: GetLegalHoldPolicyAssignmentFileVersionOnHoldHeadersArg = GetLegalHoldPolicyAssignmentFileVersionOnHoldHeadersArg()) async throws -> FileVersionLegalHolds {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments/")\(legalHoldPolicyAssignmentId)\("/file_versions_on_hold")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionLegalHolds.deserialize(from: response.text)
    }

}
