import Foundation

public class ListCollaborationsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileCollaborations(fileId: String, queryParams: GetFileCollaborationsQueryParamsArg = GetFileCollaborationsQueryParamsArg(), headers: GetFileCollaborationsHeadersArg = GetFileCollaborationsHeadersArg()) async throws -> Collaborations {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "limit": Utils.Strings.toString(value: queryParams.limit), "marker": Utils.Strings.toString(value: queryParams.marker)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/collaborations")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Collaborations.deserialize(from: response.text)
    }

    public func getFolderCollaborations(folderId: String, queryParams: GetFolderCollaborationsQueryParamsArg = GetFolderCollaborationsQueryParamsArg(), headers: GetFolderCollaborationsHeadersArg = GetFolderCollaborationsHeadersArg()) async throws -> Collaborations {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/folders/")\(folderId)\("/collaborations")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Collaborations.deserialize(from: response.text)
    }

    public func getCollaborations(queryParams: GetCollaborationsQueryParamsArg, headers: GetCollaborationsHeadersArg = GetCollaborationsHeadersArg()) async throws -> Collaborations {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["status": Utils.Strings.toString(value: queryParams.status), "fields": Utils.Strings.toString(value: queryParams.fields), "offset": Utils.Strings.toString(value: queryParams.offset), "limit": Utils.Strings.toString(value: queryParams.limit)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaborations")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Collaborations.deserialize(from: response.text)
    }

    public func getGroupCollaborations(groupId: String, queryParams: GetGroupCollaborationsQueryParamsArg = GetGroupCollaborationsQueryParamsArg(), headers: GetGroupCollaborationsHeadersArg = GetGroupCollaborationsHeadersArg()) async throws -> Collaborations {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["limit": Utils.Strings.toString(value: queryParams.limit), "offset": Utils.Strings.toString(value: queryParams.offset)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/groups/")\(groupId)\("/collaborations")", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Collaborations.deserialize(from: response.text)
    }

}
