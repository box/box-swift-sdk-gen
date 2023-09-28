import Foundation

public class StoragePolicyAssignmentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getStoragePolicyAssignments(queryParams: GetStoragePolicyAssignmentsQueryParamsArg, headers: GetStoragePolicyAssignmentsHeadersArg = GetStoragePolicyAssignmentsHeadersArg()) async throws -> StoragePolicyAssignments {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["marker": Utils.Strings.toString(value: queryParams.marker), "resolved_for_type": Utils.Strings.toString(value: queryParams.resolvedForType), "resolved_for_id": Utils.Strings.toString(value: queryParams.resolvedForId)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicyAssignments.deserialize(from: response.text)
    }

    public func createStoragePolicyAssignment(requestBody: CreateStoragePolicyAssignmentRequestBodyArg, headers: CreateStoragePolicyAssignmentHeadersArg = CreateStoragePolicyAssignmentHeadersArg()) async throws -> StoragePolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicyAssignment.deserialize(from: response.text)
    }

    public func getStoragePolicyAssignmentById(storagePolicyAssignmentId: String, headers: GetStoragePolicyAssignmentByIdHeadersArg = GetStoragePolicyAssignmentByIdHeadersArg()) async throws -> StoragePolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments/")\(storagePolicyAssignmentId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicyAssignment.deserialize(from: response.text)
    }

    public func updateStoragePolicyAssignmentById(storagePolicyAssignmentId: String, requestBody: UpdateStoragePolicyAssignmentByIdRequestBodyArg, headers: UpdateStoragePolicyAssignmentByIdHeadersArg = UpdateStoragePolicyAssignmentByIdHeadersArg()) async throws -> StoragePolicyAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments/")\(storagePolicyAssignmentId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try StoragePolicyAssignment.deserialize(from: response.text)
    }

    public func deleteStoragePolicyAssignmentById(storagePolicyAssignmentId: String, headers: DeleteStoragePolicyAssignmentByIdHeadersArg = DeleteStoragePolicyAssignmentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/storage_policy_assignments/")\(storagePolicyAssignmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
