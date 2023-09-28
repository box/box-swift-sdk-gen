import Foundation

public class GroupsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getGroups(queryParams: GetGroupsQueryParamsArg = GetGroupsQueryParamsArg(), headers: GetGroupsHeadersArg = GetGroupsHeadersArg()) async throws -> Groups {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["filter_term": Utils.Strings.toString(value: queryParams.filterTerm), "fields": Utils.Strings.toString(value: queryParams.fields), "limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Groups.deserialize(from: response.text)
    }

    public func createGroup(requestBody: CreateGroupRequestBodyArg, queryParams: CreateGroupQueryParamsArg = CreateGroupQueryParamsArg(), headers: CreateGroupHeadersArg = CreateGroupHeadersArg()) async throws -> Group {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Group.deserialize(from: response.text)
    }

    public func getGroupById(groupId: String, queryParams: GetGroupByIdQueryParamsArg = GetGroupByIdQueryParamsArg(), headers: GetGroupByIdHeadersArg = GetGroupByIdHeadersArg()) async throws -> GroupFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups/")\(groupId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupFull.deserialize(from: response.text)
    }

    public func updateGroupById(groupId: String, requestBody: UpdateGroupByIdRequestBodyArg = UpdateGroupByIdRequestBodyArg(), queryParams: UpdateGroupByIdQueryParamsArg = UpdateGroupByIdQueryParamsArg(), headers: UpdateGroupByIdHeadersArg = UpdateGroupByIdHeadersArg()) async throws -> GroupFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups/")\(groupId)", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupFull.deserialize(from: response.text)
    }

    public func deleteGroupById(groupId: String, headers: DeleteGroupByIdHeadersArg = DeleteGroupByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups/")\(groupId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
