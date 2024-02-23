import Foundation

public class ResponseInfo: Error {
    public let statusCode: Int

    public let headers: [String: String]

    public let body: SerializedData?

    public let rawBody: String?

    public init(statusCode: Int, headers: [String: String], body: SerializedData? = nil, rawBody: String? = nil) {
        self.statusCode = statusCode
        self.headers = headers
        self.body = body
        self.rawBody = rawBody
    }

}
