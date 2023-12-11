import Foundation

public class LegalHoldPolicyAssignmentsManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves a list of items a legal hold policy has been assigned to.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getLegalHoldPolicyAssignments method
    ///   - headers: Headers of getLegalHoldPolicyAssignments method
    /// - Returns: The `LegalHoldPolicyAssignments`.
    /// - Throws: The `GeneralError`.
    public func getLegalHoldPolicyAssignments(queryParams: GetLegalHoldPolicyAssignmentsQueryParamsArg, headers: GetLegalHoldPolicyAssignmentsHeadersArg = GetLegalHoldPolicyAssignmentsHeadersArg()) async throws -> LegalHoldPolicyAssignments {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["policy_id": Utils.Strings.toString(value: queryParams.policyId), "assign_to_type": Utils.Strings.toString(value: queryParams.assignToType), "assign_to_id": Utils.Strings.toString(value: queryParams.assignToId), "marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicyAssignments.deserialize(from: response.data)
    }

    /// Assign a legal hold to a file, file version, folder, or user.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createLegalHoldPolicyAssignment method
    ///   - headers: Headers of createLegalHoldPolicyAssignment method
    /// - Returns: The `LegalHoldPolicyAssignment`.
    /// - Throws: The `GeneralError`.
    public func createLegalHoldPolicyAssignment(requestBody: CreateLegalHoldPolicyAssignmentRequestBodyArg, headers: CreateLegalHoldPolicyAssignmentHeadersArg = CreateLegalHoldPolicyAssignmentHeadersArg()) async throws -> LegalHoldPolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicyAssignment.deserialize(from: response.data)
    }

    /// Retrieve a legal hold policy assignment.
    ///
    /// - Parameters:
    ///   - legalHoldPolicyAssignmentId: The ID of the legal hold policy assignment
    ///     Example: "753465"
    ///   - headers: Headers of getLegalHoldPolicyAssignmentById method
    /// - Returns: The `LegalHoldPolicyAssignment`.
    /// - Throws: The `GeneralError`.
    public func getLegalHoldPolicyAssignmentById(legalHoldPolicyAssignmentId: String, headers: GetLegalHoldPolicyAssignmentByIdHeadersArg = GetLegalHoldPolicyAssignmentByIdHeadersArg()) async throws -> LegalHoldPolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments/")\(legalHoldPolicyAssignmentId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try LegalHoldPolicyAssignment.deserialize(from: response.data)
    }

    /// Remove a legal hold from an item.
    /// 
    /// This is an asynchronous process. The policy will not be
    /// fully removed yet when the response returns.
    ///
    /// - Parameters:
    ///   - legalHoldPolicyAssignmentId: The ID of the legal hold policy assignment
    ///     Example: "753465"
    ///   - headers: Headers of deleteLegalHoldPolicyAssignmentById method
    /// - Throws: The `GeneralError`.
    public func deleteLegalHoldPolicyAssignmentById(legalHoldPolicyAssignmentId: String, headers: DeleteLegalHoldPolicyAssignmentByIdHeadersArg = DeleteLegalHoldPolicyAssignmentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments/")\(legalHoldPolicyAssignmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Get a list of current file versions for a legal hold
    /// assignment.
    /// 
    /// In some cases you may want to get previous file versions instead. In these
    /// cases, use the `GET  /legal_hold_policy_assignments/:id/file_versions_on_hold`
    /// API instead to return any previous versions of a file for this legal hold
    /// policy assignment.
    /// 
    /// Due to ongoing re-architecture efforts this API might not return all file
    /// versions held for this policy ID. Instead, this API will only return the
    /// latest file version held in the newly developed architecture. The `GET
    /// /file_version_legal_holds` API can be used to fetch current and past versions
    /// of files held within the legacy architecture.
    /// 
    /// The `GET /legal_hold_policy_assignments?policy_id={id}` API can be used to
    /// find a list of policy assignments for a given policy ID.
    ///
    /// - Parameters:
    ///   - legalHoldPolicyAssignmentId: The ID of the legal hold policy assignment
    ///     Example: "753465"
    ///   - queryParams: Query parameters of getLegalHoldPolicyAssignmentFileOnHold method
    ///   - headers: Headers of getLegalHoldPolicyAssignmentFileOnHold method
    /// - Returns: The `FileVersionLegalHolds`.
    /// - Throws: The `GeneralError`.
    public func getLegalHoldPolicyAssignmentFileOnHold(legalHoldPolicyAssignmentId: String, queryParams: GetLegalHoldPolicyAssignmentFileOnHoldQueryParamsArg = GetLegalHoldPolicyAssignmentFileOnHoldQueryParamsArg(), headers: GetLegalHoldPolicyAssignmentFileOnHoldHeadersArg = GetLegalHoldPolicyAssignmentFileOnHoldHeadersArg()) async throws -> FileVersionLegalHolds {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments/")\(legalHoldPolicyAssignmentId)\("/files_on_hold")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionLegalHolds.deserialize(from: response.data)
    }

    /// Get a list of previous file versions for a legal hold
    /// assignment.
    /// 
    /// In some cases you may only need the latest file versions instead. In these
    /// cases, use the `GET  /legal_hold_policy_assignments/:id/files_on_hold` API
    /// instead to return any current (latest) versions of a file for this legal hold
    /// policy assignment.
    /// 
    /// Due to ongoing re-architecture efforts this API might not return all files
    /// held for this policy ID. Instead, this API will only return past file versions
    /// held in the newly developed architecture. The `GET /file_version_legal_holds`
    /// API can be used to fetch current and past versions of files held within the
    /// legacy architecture.
    /// 
    /// The `GET /legal_hold_policy_assignments?policy_id={id}` API can be used to
    /// find a list of policy assignments for a given policy ID.
    ///
    /// - Parameters:
    ///   - legalHoldPolicyAssignmentId: The ID of the legal hold policy assignment
    ///     Example: "753465"
    ///   - queryParams: Query parameters of getLegalHoldPolicyAssignmentFileVersionOnHold method
    ///   - headers: Headers of getLegalHoldPolicyAssignmentFileVersionOnHold method
    /// - Returns: The `FileVersionLegalHolds`.
    /// - Throws: The `GeneralError`.
    public func getLegalHoldPolicyAssignmentFileVersionOnHold(legalHoldPolicyAssignmentId: String, queryParams: GetLegalHoldPolicyAssignmentFileVersionOnHoldQueryParamsArg = GetLegalHoldPolicyAssignmentFileVersionOnHoldQueryParamsArg(), headers: GetLegalHoldPolicyAssignmentFileVersionOnHoldHeadersArg = GetLegalHoldPolicyAssignmentFileVersionOnHoldHeadersArg()) async throws -> FileVersionLegalHolds {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "limit": Utils.Strings.toString(value: queryParams.limit), "fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/legal_hold_policy_assignments/")\(legalHoldPolicyAssignmentId)\("/file_versions_on_hold")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FileVersionLegalHolds.deserialize(from: response.data)
    }

}
