import Foundation

public class TaskAssignmentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getTaskAssignments(taskId: String, headers: GetTaskAssignmentsHeadersArg = GetTaskAssignmentsHeadersArg()) async throws -> TaskAssignments {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks/")\(taskId)\("/assignments")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TaskAssignments.deserialize(from: response.text)
    }

    public func createTaskAssignment(requestBody: CreateTaskAssignmentRequestBodyArg, headers: CreateTaskAssignmentHeadersArg = CreateTaskAssignmentHeadersArg()) async throws -> TaskAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/task_assignments")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TaskAssignment.deserialize(from: response.text)
    }

    public func getTaskAssignmentById(taskAssignmentId: String, headers: GetTaskAssignmentByIdHeadersArg = GetTaskAssignmentByIdHeadersArg()) async throws -> TaskAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/task_assignments/")\(taskAssignmentId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TaskAssignment.deserialize(from: response.text)
    }

    public func updateTaskAssignmentById(taskAssignmentId: String, requestBody: UpdateTaskAssignmentByIdRequestBodyArg = UpdateTaskAssignmentByIdRequestBodyArg(), headers: UpdateTaskAssignmentByIdHeadersArg = UpdateTaskAssignmentByIdHeadersArg()) async throws -> TaskAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/task_assignments/")\(taskAssignmentId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TaskAssignment.deserialize(from: response.text)
    }

    public func deleteTaskAssignmentById(taskAssignmentId: String, headers: DeleteTaskAssignmentByIdHeadersArg = DeleteTaskAssignmentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/task_assignments/")\(taskAssignmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
