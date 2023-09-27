import Foundation

public class SkillsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getFileMetadataGlobalBoxSkillsCards(fileId: String, headers: GetFileMetadataGlobalBoxSkillsCardsHeadersArg = GetFileMetadataGlobalBoxSkillsCardsHeadersArg()) async throws -> SkillCardsMetadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/global/boxSkillsCards")", options: FetchOptions(method: "GET", headers: headersMap, responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SkillCardsMetadata.deserialize(from: response.text)
    }

    public func createFileMetadataGlobalBoxSkillsCard(fileId: String, requestBody: CreateFileMetadataGlobalBoxSkillsCardRequestBodyArg, headers: CreateFileMetadataGlobalBoxSkillsCardHeadersArg = CreateFileMetadataGlobalBoxSkillsCardHeadersArg()) async throws -> SkillCardsMetadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/global/boxSkillsCards")", options: FetchOptions(method: "POST", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SkillCardsMetadata.deserialize(from: response.text)
    }

    public func updateFileMetadataGlobalBoxSkillsCard(fileId: String, requestBody: [UpdateFileMetadataGlobalBoxSkillsCardRequestBodyArg], headers: UpdateFileMetadataGlobalBoxSkillsCardHeadersArg = UpdateFileMetadataGlobalBoxSkillsCardHeadersArg()) async throws -> SkillCardsMetadata {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/global/boxSkillsCards")", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json-patch+json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try SkillCardsMetadata.deserialize(from: response.text)
    }

    public func deleteFileMetadataGlobalBoxSkillsCard(fileId: String, headers: DeleteFileMetadataGlobalBoxSkillsCardHeadersArg = DeleteFileMetadataGlobalBoxSkillsCardHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/files/")\(fileId)\("/metadata/global/boxSkillsCards")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

    public func updateSkillInvocationById(skillId: String, requestBody: UpdateSkillInvocationByIdRequestBodyArg, headers: UpdateSkillInvocationByIdHeadersArg = UpdateSkillInvocationByIdHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/skill_invocations/")\(skillId)", options: FetchOptions(method: "PUT", headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
