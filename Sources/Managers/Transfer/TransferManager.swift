import Foundation

public class TransferManager {
    public let auth: Authentication?
    public let networkSession: NetworkSession?

    public init(auth: Authentication? = nil, networkSession: NetworkSession? = nil) {
        self.auth = auth
        self.networkSession = networkSession
    }

    public func transferOwnedFolder(userId: String, requestBody: TransferOwnedFolderRequestBodyArg, queryParams: TransferOwnedFolderQueryParamsArg = TransferOwnedFolderQueryParamsArg(), headers: TransferOwnedFolderHeadersArg = TransferOwnedFolderHeadersArg()) async throws -> FolderFull {
        let queryParamsMap: [String: String] = Utils.Dictionary.prepareParams(map: ["fields": Utils.Strings.toString(value: queryParams.fields), "notify": Utils.Strings.toString(value: queryParams.notify)])
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\("https://api.box.com/2.0/users/")\(userId)\("/folders/0")", options: FetchOptions(method: "PUT", params: queryParamsMap, headers: headersMap, body: requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try FolderFull.deserialize(from: response.text)
    }

}
