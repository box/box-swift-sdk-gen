import Foundation

public class BoxAPIError: BoxSDKError {
    public let requestInfo: RequestInfo

    public let responseInfo: ResponseInfo

    public init(message: String, requestInfo: RequestInfo, responseInfo: ResponseInfo, timestamp: String? = nil, error: String? = nil, name: String = "BoxSDKError") {
        self.requestInfo = requestInfo
        self.responseInfo = responseInfo

        super.init(message: message, timestamp: timestamp, error: error, name: name)
    }

}
