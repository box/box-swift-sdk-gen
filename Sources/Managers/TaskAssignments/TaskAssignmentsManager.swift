import Foundation

public class TaskAssignmentsManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Lists all of the assignments for a given task.
    ///
    /// - Parameters:
    ///   - taskId: The ID of the task.
    ///     Example: "12345"
    ///   - headers: Headers of getTaskAssignments method
    /// - Returns: The `TaskAssignments`.
    /// - Throws: The `GeneralError`.
    public func getTaskAssignments(taskId: String, headers: GetTaskAssignmentsHeaders = GetTaskAssignmentsHeaders()) async throws -> TaskAssignments {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/tasks/")\(taskId)\("/assignments")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TaskAssignments.deserialize(from: response.data)
    }

    /// Assigns a task to a user.
    /// 
    /// A task can be assigned to more than one user by creating multiple
    /// assignments.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createTaskAssignment method
    ///   - headers: Headers of createTaskAssignment method
    /// - Returns: The `TaskAssignment`.
    /// - Throws: The `GeneralError`.
    public func createTaskAssignment(requestBody: CreateTaskAssignmentRequestBody, headers: CreateTaskAssignmentHeaders = CreateTaskAssignmentHeaders()) async throws -> TaskAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/task_assignments")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TaskAssignment.deserialize(from: response.data)
    }

    /// Retrieves information about a task assignment.
    ///
    /// - Parameters:
    ///   - taskAssignmentId: The ID of the task assignment.
    ///     Example: "12345"
    ///   - headers: Headers of getTaskAssignmentById method
    /// - Returns: The `TaskAssignment`.
    /// - Throws: The `GeneralError`.
    public func getTaskAssignmentById(taskAssignmentId: String, headers: GetTaskAssignmentByIdHeaders = GetTaskAssignmentByIdHeaders()) async throws -> TaskAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/task_assignments/")\(taskAssignmentId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TaskAssignment.deserialize(from: response.data)
    }

    /// Updates a task assignment. This endpoint can be
    /// used to update the state of a task assigned to a user.
    ///
    /// - Parameters:
    ///   - taskAssignmentId: The ID of the task assignment.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateTaskAssignmentById method
    ///   - headers: Headers of updateTaskAssignmentById method
    /// - Returns: The `TaskAssignment`.
    /// - Throws: The `GeneralError`.
    public func updateTaskAssignmentById(taskAssignmentId: String, requestBody: UpdateTaskAssignmentByIdRequestBody = UpdateTaskAssignmentByIdRequestBody(), headers: UpdateTaskAssignmentByIdHeaders = UpdateTaskAssignmentByIdHeaders()) async throws -> TaskAssignment {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/task_assignments/")\(taskAssignmentId)", options: FetchOptions(method: "PUT", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try TaskAssignment.deserialize(from: response.data)
    }

    /// Deletes a specific task assignment.
    ///
    /// - Parameters:
    ///   - taskAssignmentId: The ID of the task assignment.
    ///     Example: "12345"
    ///   - headers: Headers of deleteTaskAssignmentById method
    /// - Throws: The `GeneralError`.
    public func deleteTaskAssignmentById(taskAssignmentId: String, headers: DeleteTaskAssignmentByIdHeaders = DeleteTaskAssignmentByIdHeaders()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/task_assignments/")\(taskAssignmentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
