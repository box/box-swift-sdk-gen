import Foundation

public class MembershipsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Retrieves all the groups for a user. Only members of this
    /// group or users with admin-level permissions will be able to
    /// use this API.
    ///
    /// - Parameters:
    ///   - userId: The ID of the user.
    ///     Example: "12345"
    ///   - queryParams: Query parameters of getUserMemberships method
    ///   - headers: Headers of getUserMemberships method
    /// - Returns: The `GroupMemberships`.
    /// - Throws: The `GeneralError`.
    public func getUserMemberships(userId: String, queryParams: GetUserMembershipsQueryParamsArg = GetUserMembershipsQueryParamsArg(), headers: GetUserMembershipsHeadersArg = GetUserMembershipsHeadersArg()) async throws -> GroupMemberships {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/memberships")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMemberships.deserialize(from: response.text)
    }

    /// Retrieves all the members for a group. Only members of this
    /// group or users with admin-level permissions will be able to
    /// use this API.
    ///
    /// - Parameters:
    ///   - groupId: The ID of the group.
    ///     Example: "57645"
    ///   - queryParams: Query parameters of getGroupMemberships method
    ///   - headers: Headers of getGroupMemberships method
    /// - Returns: The `GroupMemberships`.
    /// - Throws: The `GeneralError`.
    public func getGroupMemberships(groupId: String, queryParams: GetGroupMembershipsQueryParamsArg = GetGroupMembershipsQueryParamsArg(), headers: GetGroupMembershipsHeadersArg = GetGroupMembershipsHeadersArg()) async throws -> GroupMemberships {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups/")\(groupId)\("/memberships")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMemberships.deserialize(from: response.text)
    }

    /// Creates a group membership. Only users with
    /// admin-level permissions will be able to use this API.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createGroupMembership method
    ///   - queryParams: Query parameters of createGroupMembership method
    ///   - headers: Headers of createGroupMembership method
    /// - Returns: The `GroupMembership`.
    /// - Throws: The `GeneralError`.
    public func createGroupMembership(requestBody: CreateGroupMembershipRequestBodyArg, queryParams: CreateGroupMembershipQueryParamsArg = CreateGroupMembershipQueryParamsArg(), headers: CreateGroupMembershipHeadersArg = CreateGroupMembershipHeadersArg()) async throws -> GroupMembership {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/group_memberships")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMembership.deserialize(from: response.text)
    }

    /// Retrieves a specific group membership. Only admins of this
    /// group or users with admin-level permissions will be able to
    /// use this API.
    ///
    /// - Parameters:
    ///   - groupMembershipId: The ID of the group membership.
    ///     Example: "434534"
    ///   - queryParams: Query parameters of getGroupMembershipById method
    ///   - headers: Headers of getGroupMembershipById method
    /// - Returns: The `GroupMembership`.
    /// - Throws: The `GeneralError`.
    public func getGroupMembershipById(groupMembershipId: String, queryParams: GetGroupMembershipByIdQueryParamsArg = GetGroupMembershipByIdQueryParamsArg(), headers: GetGroupMembershipByIdHeadersArg = GetGroupMembershipByIdHeadersArg()) async throws -> GroupMembership {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/group_memberships/")\(groupMembershipId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMembership.deserialize(from: response.text)
    }

    /// Updates a user's group membership. Only admins of this
    /// group or users with admin-level permissions will be able to
    /// use this API.
    ///
    /// - Parameters:
    ///   - groupMembershipId: The ID of the group membership.
    ///     Example: "434534"
    ///   - requestBody: Request body of updateGroupMembershipById method
    ///   - queryParams: Query parameters of updateGroupMembershipById method
    ///   - headers: Headers of updateGroupMembershipById method
    /// - Returns: The `GroupMembership`.
    /// - Throws: The `GeneralError`.
    public func updateGroupMembershipById(groupMembershipId: String, requestBody: UpdateGroupMembershipByIdRequestBodyArg = UpdateGroupMembershipByIdRequestBodyArg(), queryParams: UpdateGroupMembershipByIdQueryParamsArg = UpdateGroupMembershipByIdQueryParamsArg(), headers: UpdateGroupMembershipByIdHeadersArg = UpdateGroupMembershipByIdHeadersArg()) async throws -> GroupMembership {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/group_memberships/")\(groupMembershipId)", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try GroupMembership.deserialize(from: response.text)
    }

    /// Deletes a specific group membership. Only admins of this
    /// group or users with admin-level permissions will be able to
    /// use this API.
    ///
    /// - Parameters:
    ///   - groupMembershipId: The ID of the group membership.
    ///     Example: "434534"
    ///   - headers: Headers of deleteGroupMembershipById method
    /// - Throws: The `GeneralError`.
    public func deleteGroupMembershipById(groupMembershipId: String, headers: DeleteGroupMembershipByIdHeadersArg = DeleteGroupMembershipByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/group_memberships/")\(groupMembershipId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
