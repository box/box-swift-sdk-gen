import Foundation

public class BoxSDKError: Error {
    public let message: String

    public let timestamp: String?

    public let error: String?

    public let name: String

    public init(message: String, timestamp: String? = nil, error: String? = nil, name: String = "BoxSDKError") {
        self.message = message
        self.timestamp = timestamp
        self.error = error
        self.name = name
    }

}
