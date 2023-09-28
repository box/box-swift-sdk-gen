import Foundation

public class TasksManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileTasks(fileId: String, headers: GetFileTasksHeadersArg = GetFileTasksHeadersArg()) async throws -> Tasks {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/tasks")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Tasks.deserialize(from: response.text)
    }

    public func createTask(requestBody: CreateTaskRequestBodyArg, headers: CreateTaskHeadersArg = CreateTaskHeadersArg()) async throws -> Task {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Task.deserialize(from: response.text)
    }

    public func getTaskById(taskId: String, headers: GetTaskByIdHeadersArg = GetTaskByIdHeadersArg()) async throws -> Task {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks/")\(taskId)", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Task.deserialize(from: response.text)
    }

    public func updateTaskById(taskId: String, requestBody: UpdateTaskByIdRequestBodyArg = UpdateTaskByIdRequestBodyArg(), headers: UpdateTaskByIdHeadersArg = UpdateTaskByIdHeadersArg()) async throws -> Task {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks/")\(taskId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Task.deserialize(from: response.text)
    }

    public func deleteTaskById(taskId: String, headers: DeleteTaskByIdHeadersArg = DeleteTaskByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/tasks/")\(taskId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
