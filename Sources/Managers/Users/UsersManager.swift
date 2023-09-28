import Foundation

public class UsersManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getUsers(queryParams: GetUsersQueryParamsArg = GetUsersQueryParamsArg(), headers: GetUsersHeadersArg = GetUsersHeadersArg()) async throws -> Users {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["filter_term": Utils.Strings.toString(value: queryParams.filterTerm), "user_type": Utils.Strings.toString(value: queryParams.userType), "external_app_user_id": Utils.Strings.toString(value: queryParams.externalAppUserId), "fields": Utils.Strings.toString(value: queryParams.fields), "offset": Utils.Strings.toString(value: queryParams.offset), "limit": Utils.Strings.toString(value: queryParams.limit), "usemarker": Utils.Strings.toString(value: queryParams.usemarker), "marker": Utils.Strings.toString(value: queryParams.marker)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Users.deserialize(from: response.text)
    }

    public func createUser(requestBody: CreateUserRequestBodyArg, queryParams: CreateUserQueryParamsArg = CreateUserQueryParamsArg(), headers: CreateUserHeadersArg = CreateUserHeadersArg()) async throws -> User {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try User.deserialize(from: response.text)
    }

    public func getUserMe(queryParams: GetUserMeQueryParamsArg = GetUserMeQueryParamsArg(), headers: GetUserMeHeadersArg = GetUserMeHeadersArg()) async throws -> UserFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/me")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UserFull.deserialize(from: response.text)
    }

    public func getUserById(userId: String, queryParams: GetUserByIdQueryParamsArg = GetUserByIdQueryParamsArg(), headers: GetUserByIdHeadersArg = GetUserByIdHeadersArg()) async throws -> UserFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UserFull.deserialize(from: response.text)
    }

    public func updateUserById(userId: String, requestBody: UpdateUserByIdRequestBodyArg = UpdateUserByIdRequestBodyArg(), queryParams: UpdateUserByIdQueryParamsArg = UpdateUserByIdQueryParamsArg(), headers: UpdateUserByIdHeadersArg = UpdateUserByIdHeadersArg()) async throws -> UserFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UserFull.deserialize(from: response.text)
    }

    public func deleteUserById(userId: String, queryParams: DeleteUserByIdQueryParamsArg = DeleteUserByIdQueryParamsArg(), headers: DeleteUserByIdHeadersArg = DeleteUserByIdHeadersArg()) async throws {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["notify": Utils.Strings.toString(value: queryParams.notify), "force": Utils.Strings.toString(value: queryParams.force)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)", options: FetchOptions(method: "DELETE", params: queryParamsMap, headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
