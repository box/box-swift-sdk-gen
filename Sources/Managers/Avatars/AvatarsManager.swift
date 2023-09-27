import Foundation

public class AvatarsManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func getUserAvatar(userId: String, downloadDestinationURL: URL, headers: GetUserAvatarHeadersArg = GetUserAvatarHeadersArg()) async throws -> URL {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/avatar")", options: FetchOptions(method: "GET", headers: headersMap, downloadDestinationURL: downloadDestinationURL, responseFormat: "binary", auth: self.auth, networkSession: self.networkSession))
        return response.downloadDestinationURL!
    }

    public func createUserAvatar(userId: String, requestBody: CreateUserAvatarRequestBodyArg, headers: CreateUserAvatarHeadersArg = CreateUserAvatarHeadersArg()) async throws -> UserAvatar {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/avatar")", options: FetchOptions(method: "POST", headers: headersMap, multipartData: [MultipartItem(partName: "pic", fileStream: requestBody.pic, fileName: requestBody.picFileName, contentType: requestBody.picContentType)], contentType: "multipart/form-data", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try UserAvatar.deserialize(from: response.text)
    }

    public func deleteUserAvatar(userId: String, headers: DeleteUserAvatarHeadersArg = DeleteUserAvatarHeadersArg()) async throws {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/avatar")", options: FetchOptions(method: "DELETE", headers: headersMap, responseFormat: nil, auth: self.auth, networkSession: self.networkSession))
    }

}
