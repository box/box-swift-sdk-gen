import Foundation

public class StoragePolicyAssignmentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Fetches all the storage policy assignment for an enterprise or user.
    /// Only a Primary Admin can access this endpoint. The user
    /// needs to generate a token for an account to authenticate this request.
    ///
    /// - Parameters:
    ///   - queryParams: Query parameters of getStoragePolicyAssignments method
    ///   - headers: Headers of getStoragePolicyAssignments method
    /// - Returns: The `StoragePolicyAssignments`.
    /// - Throws: The `GeneralError`.
    public func getStoragePolicyAssignments(queryParams: GetStoragePolicyAssignmentsQueryParamsArg, headers: GetStoragePolicyAssignmentsHeadersArg = GetStoragePolicyAssignmentsHeadersArg()) async throws -> StoragePolicyAssignments {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "resolved_for_type": Utils.Strings.toString(value: queryParams.resolvedForType), "resolved_for_id": Utils.Strings.toString(value: queryParams.resolvedForId)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicyAssignments.deserialize(from: response.text)
    }

    /// Creates a storage policy assignment for an enterprise or user.
    /// Only a Primary Admin can access this endpoint. The user
    /// needs to generate a token for an account to authenticate this request.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createStoragePolicyAssignment method
    ///   - headers: Headers of createStoragePolicyAssignment method
    /// - Returns: The `StoragePolicyAssignment`.
    /// - Throws: The `GeneralError`.
    public func createStoragePolicyAssignment(requestBody: CreateStoragePolicyAssignmentRequestBodyArg, headers: CreateStoragePolicyAssignmentHeadersArg = CreateStoragePolicyAssignmentHeadersArg()) async throws -> StoragePolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicyAssignment.deserialize(from: response.text)
    }

    /// Fetches a specific storage policy assignment. Only a Primary Admin can access this endpoint. The user needs to generate a token for an account to authenticate this request.
    ///
    /// - Parameters:
    ///   - storagePolicyAssignmentId: The ID of the storage policy assignment.
    ///     Example: "932483"
    ///   - headers: Headers of getStoragePolicyAssignmentById method
    /// - Returns: The `StoragePolicyAssignment`.
    /// - Throws: The `GeneralError`.
    public func getStoragePolicyAssignmentById(storagePolicyAssignmentId: String, headers: GetStoragePolicyAssignmentByIdHeadersArg = GetStoragePolicyAssignmentByIdHeadersArg()) async throws -> StoragePolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments/")\(storagePolicyAssignmentId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicyAssignment.deserialize(from: response.text)
    }

    /// Updates a specific storage policy assignment. Only a Primary Admin can access this endpoint. The user needs to generate a token for an account to authenticate this request.
    ///
    /// - Parameters:
    ///   - storagePolicyAssignmentId: The ID of the storage policy assignment.
    ///     Example: "932483"
    ///   - requestBody: Request body of updateStoragePolicyAssignmentById method
    ///   - headers: Headers of updateStoragePolicyAssignmentById method
    /// - Returns: The `StoragePolicyAssignment`.
    /// - Throws: The `GeneralError`.
    public func updateStoragePolicyAssignmentById(storagePolicyAssignmentId: String, requestBody: UpdateStoragePolicyAssignmentByIdRequestBodyArg, headers: UpdateStoragePolicyAssignmentByIdHeadersArg = UpdateStoragePolicyAssignmentByIdHeadersArg()) async throws -> StoragePolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments/")\(storagePolicyAssignmentId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicyAssignment.deserialize(from: response.text)
    }

    /// Delete a storage policy assignment.
    /// 
    /// Deleting a storage policy assignment on a user
    /// will have the user inherit the enterprise's default
    /// storage policy.
    /// 
    /// There is a rate limit for calling this endpoint of only
    /// twice per user in a 24 hour time frame.
    /// 
    /// Only a Primary Admin can access this endpoint. The user
    /// needs to generate a token for an account to authenticate this request.
    ///
    /// - Parameters:
    ///   - storagePolicyAssignmentId: The ID of the storage policy assignment.
    ///     Example: "932483"
    ///   - headers: Headers of deleteStoragePolicyAssignmentById method
    /// - Throws: The `GeneralError`.
    public func deleteStoragePolicyAssignmentById(storagePolicyAssignmentId: String, headers: DeleteStoragePolicyAssignmentByIdHeadersArg = DeleteStoragePolicyAssignmentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments/")\(storagePolicyAssignmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
