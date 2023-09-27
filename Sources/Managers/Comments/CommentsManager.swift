import Foundation

public class CommentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileComments(fileId: String, queryParams: GetFileCommentsQueryParamsArg = GetFileCommentsQueryParamsArg(), headers: GetFileCommentsHeadersArg = GetFileCommentsHeadersArg()) async throws -> Comments {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/comments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Comments.deserialize(from: response.text)
    }

    public func getCommentById(commentId: String, queryParams: GetCommentByIdQueryParamsArg = GetCommentByIdQueryParamsArg(), headers: GetCommentByIdHeadersArg = GetCommentByIdHeadersArg()) async throws -> CommentFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/comments/")\(commentId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CommentFull.deserialize(from: response.text)
    }

    public func updateCommentById(commentId: String, requestBody: UpdateCommentByIdRequestBodyArg = UpdateCommentByIdRequestBodyArg(), queryParams: UpdateCommentByIdQueryParamsArg = UpdateCommentByIdQueryParamsArg(), headers: UpdateCommentByIdHeadersArg = UpdateCommentByIdHeadersArg()) async throws -> CommentFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/comments/")\(commentId)", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CommentFull.deserialize(from: response.text)
    }

    public func deleteCommentById(commentId: String, headers: DeleteCommentByIdHeadersArg = DeleteCommentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/comments/")\(commentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func createComment(requestBody: CreateCommentRequestBodyArg, queryParams: CreateCommentQueryParamsArg = CreateCommentQueryParamsArg(), headers: CreateCommentHeadersArg = CreateCommentHeadersArg()) async throws -> Comment {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/comments")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Comment.deserialize(from: response.text)
    }

}
