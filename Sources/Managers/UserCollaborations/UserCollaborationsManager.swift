import Foundation

public class UserCollaborationsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getCollaborationById(collaborationId: String, queryParams: GetCollaborationByIdQueryParamsArg = GetCollaborationByIdQueryParamsArg(), headers: GetCollaborationByIdHeadersArg = GetCollaborationByIdHeadersArg()) async throws -> Collaboration {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaborations/")\(collaborationId)", options: FetchOptions(method: "GET", params: queryParamsMap, headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Collaboration.deserialize(from: response.text)
    }

    public func updateCollaborationById(collaborationId: String, requestBody: UpdateCollaborationByIdRequestBodyArg, headers: UpdateCollaborationByIdHeadersArg = UpdateCollaborationByIdHeadersArg()) async throws -> Collaboration {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaborations/")\(collaborationId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Collaboration.deserialize(from: response.text)
    }

    public func deleteCollaborationById(collaborationId: String, headers: DeleteCollaborationByIdHeadersArg = DeleteCollaborationByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaborations/")\(collaborationId)", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func createCollaboration(requestBody: CreateCollaborationRequestBodyArg, queryParams: CreateCollaborationQueryParamsArg = CreateCollaborationQueryParamsArg(), headers: CreateCollaborationHeadersArg = CreateCollaborationHeadersArg()) async throws -> Collaboration {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "notify": Utils.Strings.toString(value: queryParams.notify)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/collaborations")", options: FetchOptions(method: "POST", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try Collaboration.deserialize(from: response.text)
    }

}
