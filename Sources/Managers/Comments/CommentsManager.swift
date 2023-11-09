import Foundation

public class CommentsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves a list of comments for a file.
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
    ///   - queryParams: Query parameters of getFileComments method
    ///   - headers: Headers of getFileComments method
    /// - Returns: The `Comments`.
    /// - Throws: The `GeneralError`.
    public func getFileComments(fileId: String, queryParams: GetFileCommentsQueryParamsArg = GetFileCommentsQueryParamsArg(), headers: GetFileCommentsHeadersArg = GetFileCommentsHeadersArg()) async throws -> Comments {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/comments")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Comments.deserialize(from: response.data)
    }

    /// Retrieves the message and metadata for a specific comment, as well
    /// as information on the user who created the comment.
    ///
    /// - Parameters:
    ///   - commentId: The ID of the comment.
    ///     Example: "12345"
    ///   - queryParams: Query parameters of getCommentById method
    ///   - headers: Headers of getCommentById method
    /// - Returns: The `CommentFull`.
    /// - Throws: The `GeneralError`.
    public func getCommentById(commentId: String, queryParams: GetCommentByIdQueryParamsArg = GetCommentByIdQueryParamsArg(), headers: GetCommentByIdHeadersArg = GetCommentByIdHeadersArg()) async throws -> CommentFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/comments/")\(commentId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CommentFull.deserialize(from: response.data)
    }

    /// Update the message of a comment.
    ///
    /// - Parameters:
    ///   - commentId: The ID of the comment.
    ///     Example: "12345"
    ///   - requestBody: Request body of updateCommentById method
    ///   - queryParams: Query parameters of updateCommentById method
    ///   - headers: Headers of updateCommentById method
    /// - Returns: The `CommentFull`.
    /// - Throws: The `GeneralError`.
    public func updateCommentById(commentId: String, requestBody: UpdateCommentByIdRequestBodyArg = UpdateCommentByIdRequestBodyArg(), queryParams: UpdateCommentByIdQueryParamsArg = UpdateCommentByIdQueryParamsArg(), headers: UpdateCommentByIdHeadersArg = UpdateCommentByIdHeadersArg()) async throws -> CommentFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/comments/")\(commentId)", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try CommentFull.deserialize(from: response.data)
    }

    /// Permanently deletes a comment.
    ///
    /// - Parameters:
    ///   - commentId: The ID of the comment.
    ///     Example: "12345"
    ///   - headers: Headers of deleteCommentById method
    /// - Throws: The `GeneralError`.
    public func deleteCommentById(commentId: String, headers: DeleteCommentByIdHeadersArg = DeleteCommentByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/comments/")\(commentId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    /// Adds a comment by the user to a specific file, or
    /// as a reply to an other comment.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createComment method
    ///   - queryParams: Query parameters of createComment method
    ///   - headers: Headers of createComment method
    /// - Returns: The `Comment`.
    /// - Throws: The `GeneralError`.
    public func createComment(requestBody: CreateCommentRequestBodyArg, queryParams: CreateCommentQueryParamsArg = CreateCommentQueryParamsArg(), headers: CreateCommentHeadersArg = CreateCommentHeadersArg()) async throws -> Comment {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/comments")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Comment.deserialize(from: response.data)
    }

}
