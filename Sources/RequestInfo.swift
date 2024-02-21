import Foundation

public class RequestInfo {
    public let method: String

    public let url: String

    public let queryParams: [String: String]

    public let headers: [String: String]

    public let body: String?

    public init(method: String, url: String, queryParams: [String: String], headers: [String: String], body: String? = nil) {
        self.method = method
        self.url = url
        self.queryParams = queryParams
        self.headers = headers
        self.body = body
    }

}
