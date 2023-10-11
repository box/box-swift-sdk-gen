import Foundation

public class TasksManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves a list of all the tasks for a file. This
    /// endpoint does not support pagination.
    ///
    /// - Parameters:
    ///   - fileId: The unique identifier that represents a file.
    ///     
    ///     The ID for any file can be determined
    ///     by visiting a file in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/files/123`
    ///     the `file_id` is `123`.
    ///     Example: "12345"
    ///   - headers: Headers of getFileTasks method
    /// - Returns: The `Tasks`.
    /// - Throws: The `GeneralError`.
    public func getFileTasks(fileId: String, headers: GetFileTasksHeadersArg = GetFileTasksHeadersArg()) async throws -> Tasks {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/tasks")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Tasks.deserialize(from: response.text)
    }

    /// Creates a single task on a file. This task is not assigned to any user and
    /// will need to be assigned separately.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createTask method
    ///   - headers: Headers of createTask method
    /// - Returns: The `Task`.
    /// - Throws: The `GeneralError`.
    public func createTask(requestBody: CreateTaskRequestBodyArg, headers: CreateTaskHeadersArg = CreateTaskHeadersArg()) async throws -> Task {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Task.deserialize(from: response.text)
    }

    /// Retrieves information about a specific task.
    ///
    /// - Parameters:
    ///   - taskId: The ID of the task.
    ///     Example: "12345"
    ///   - headers: Headers of getTaskById method
    /// - Returns: The `Task`.
    /// - Throws: The `GeneralError`.
    public func getTaskById(taskId: String, headers: GetTaskByIdHeadersArg = GetTaskByIdHeadersArg()) async throws -> Task {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks/")\(taskId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Task.deserialize(from: response.text)
    }

    /// Updates a task. This can be used to update a task's configuration, or to
    /// update its completion state.
    ///
    /// - Parameters:
    ///   - taskId: The ID of the task.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateTaskById method
    ///   - headers: Headers of updateTaskById method
    /// - Returns: The `Task`.
    /// - Throws: The `GeneralError`.
    public func updateTaskById(taskId: String, requestBody: UpdateTaskByIdRequestBodyArg = UpdateTaskByIdRequestBodyArg(), headers: UpdateTaskByIdHeadersArg = UpdateTaskByIdHeadersArg()) async throws -> Task {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks/")\(taskId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Task.deserialize(from: response.text)
    }

    /// Removes a task from a file.
    ///
    /// - Parameters:
    ///   - taskId: The ID of the task.
    ///     Example: "12345"
    ///   - headers: Headers of deleteTaskById method
    /// - Throws: The `GeneralError`.
    public func deleteTaskById(taskId: String, headers: DeleteTaskByIdHeadersArg = DeleteTaskByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks/")\(taskId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
