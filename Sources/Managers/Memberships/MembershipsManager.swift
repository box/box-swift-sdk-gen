import Foundation

public class MembershipsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getUserMemberships(userId: String, queryParams: GetUserMembershipsQueryParamsArg = GetUserMembershipsQueryParamsArg(), headers: GetUserMembershipsHeadersArg = GetUserMembershipsHeadersArg()) async throws -> GroupMemberships {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/memberships")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMemberships.deserialize(from: response.text)
    }

    public func getGroupMemberships(groupId: String, queryParams: GetGroupMembershipsQueryParamsArg = GetGroupMembershipsQueryParamsArg(), headers: GetGroupMembershipsHeadersArg = GetGroupMembershipsHeadersArg()) async throws -> GroupMemberships {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups/")\(groupId)\("/memberships")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMemberships.deserialize(from: response.text)
    }

    public func createGroupMembership(requestBody: CreateGroupMembershipRequestBodyArg, queryParams: CreateGroupMembershipQueryParamsArg = CreateGroupMembershipQueryParamsArg(), headers: CreateGroupMembershipHeadersArg = CreateGroupMembershipHeadersArg()) async throws -> GroupMembership {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/group_memberships")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMembership.deserialize(from: response.text)
    }

    public func getGroupMembershipById(groupMembershipId: String, queryParams: GetGroupMembershipByIdQueryParamsArg = GetGroupMembershipByIdQueryParamsArg(), headers: GetGroupMembershipByIdHeadersArg = GetGroupMembershipByIdHeadersArg()) async throws -> GroupMembership {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/group_memberships/")\(groupMembershipId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMembership.deserialize(from: response.text)
    }

    public func updateGroupMembershipById(groupMembershipId: String, requestBody: UpdateGroupMembershipByIdRequestBodyArg = UpdateGroupMembershipByIdRequestBodyArg(), queryParams: UpdateGroupMembershipByIdQueryParamsArg = UpdateGroupMembershipByIdQueryParamsArg(), headers: UpdateGroupMembershipByIdHeadersArg = UpdateGroupMembershipByIdHeadersArg()) async throws -> GroupMembership {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/group_memberships/")\(groupMembershipId)", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMembership.deserialize(from: response.text)
    }

    public func deleteGroupMembershipById(groupMembershipId: String, headers: DeleteGroupMembershipByIdHeadersArg = DeleteGroupMembershipByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/group_memberships/")\(groupMembershipId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
