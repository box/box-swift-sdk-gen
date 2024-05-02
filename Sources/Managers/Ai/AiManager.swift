import Foundation

public class AiManager {
    public let auth: Authentication?

    public let networkSession: NetworkSession

    public init(auth: Authentication? = nil, networkSession: NetworkSession = NetworkSession()) {
        self.auth = auth
        self.networkSession = networkSession
    }

    /// Sends an AI request to supported LLMs and returns an answer specifically focused on the user's question given the provided context.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createAiAsk method
    ///   - headers: Headers of createAiAsk method
    /// - Returns: The `AiResponse`.
    /// - Throws: The `GeneralError`.
    public func createAiAsk(requestBody: AiAsk, headers: CreateAiAskHeaders = CreateAiAskHeaders()) async throws -> AiResponse {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/v2/ai/ask")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try AiResponse.deserialize(from: response.data)
    }

    /// Sends an AI request to supported LLMs and returns an answer specifically focused on the creation of new text.
    ///
    /// - Parameters:
    ///   - requestBody: Request body of createAiTextGen method
    ///   - headers: Headers of createAiTextGen method
    /// - Returns: The `AiResponse`.
    /// - Throws: The `GeneralError`.
    public func createAiTextGen(requestBody: AiTextGen, headers: CreateAiTextGenHeaders = CreateAiTextGenHeaders()) async throws -> AiResponse {
        let headersMap: [String: String] = Utils.Dictionary.prepareParams(map: Utils.Dictionary.merge([:], headers.extraHeaders))
        let response: FetchResponse = try await NetworkClient.shared.fetch(url: "\(self.networkSession.baseUrls.baseUrl)\("/v2/ai/text_gen")", options: FetchOptions(method: "POST", headers: headersMap, data: try requestBody.serialize(), contentType: "application/json", responseFormat: "json", auth: self.auth, networkSession: self.networkSession))
        return try AiResponse.deserialize(from: response.data)
    }

}
