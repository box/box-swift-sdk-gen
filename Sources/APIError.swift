import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// The components that make up a description of a Response
public struct ResponseDescription {
    /// The HTTP status code of the response
    public var statusCode: Int
    /// The HTTP headers of the response
    public var headers: [String:String]?
    /// The body component of the response
    public var body: [String: Any]?

    /// Initializer
    ///
    /// - Parameters:
    ///   - fromConversation: Represents a data combined with the request and the corresponding response.
    init(fromConversation conversation: FetchConversation) {
        self.statusCode = conversation.urlResponse.statusCode
        self.headers = conversation.urlResponse.allHeaderFields as? [String: String]

        if case let .data(data) = conversation.responseType {
            body = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        }
    }

    /// Get a dictionary representing a `ResponseDescription`.
    ///
    /// - Returns: A dictionary representing a `ResponseDescription`..
    func getDictionary() -> [String: Any] {
        var dict = [String: Any]()
        dict["statusCode"] = statusCode
        dict["headers"] = headers
        dict["body"] = body
        return dict
    }
}

/// The components that make up a description of a Request
public struct RequestDescription {
    /// The HTTP method for the Request
    public var method: String
    /// The URL the Request is sent to
    public var url: String
    /// The HTTP headers sent in the Request
    public var headers: [String: String]
    /// The optional body of the Request
    public var body: String?

    /// Initializer
    ///
    /// - Parameters:
    ///   - fromConversation: Represents a data combined with the request and the corresponding response.
    init(fromConversation conversation: FetchConversation) {
        self.method = conversation.options.method.rawValue
        self.url = conversation.urlRequest.url?.absoluteString ?? conversation.url
        self.headers = conversation.options.headers.compactMapValues { $0?.paramValue }
        self.body = conversation.options.body
    }

    /// Get a dictionary representing a `RequestDescription`.
    ///
    /// - Returns: A dictionary representing a `RequestDescription`..
    func getDictionary() -> [String: Any] {
        var dict = [String: Any]()
        dict["method"] = method
        dict["url"] = url
        dict["headers"] = headers
        dict["body"] = body
        return dict
    }
}

/// Describes API request related errors.
public class APIError: GeneralError {
    /// The components that make up a description of a Request
    public var request: RequestDescription?
    /// The components that make up a description of a Response
    public var response: ResponseDescription?

    /// Initializer
    ///
    /// - Parameters:
    ///   - message: Error message
    ///   - conversation: Represents a data combined with the request and the corresponding response.
    ///   - error: The underlying error which caused this error, if any.
    init(message: GeneralErrorFailureReason? = nil, conversation: FetchConversation? = nil, error: Error? = nil) {
        super.init(error: error)
        errorType = "APIError"

        if let conversation {
            self.request = RequestDescription(fromConversation: conversation)
            self.response = ResponseDescription(fromConversation: conversation)
        }

        if let message {
            self.message = message
        } else {
            self.message = GeneralErrorFailureReason.customValue(Self.getFormattedMessage(fromResponse: self.response))
        }
    }

    /// Gets a formatted user-friendly message based on the `ResponseDescription`
    ///
    /// - Returns: Formatted user-friendly message based on the `ResponseDescription`
    static func getFormattedMessage(fromResponse response: ResponseDescription? = nil) -> String {
        var message = "The API returned an unexpected response: "

        guard let response else {
            return message
        }

        message += "[\(response.statusCode) \(HTTPURLResponse.localizedString(forStatusCode: response.statusCode).capitalized)"

        var bodyRequestID = ""
        if let responseBodyDict = response.body, let requestId = responseBodyDict["request_id"] as? String {
            bodyRequestID = requestId
        }

        if !bodyRequestID.isEmpty {
            message += " | \(bodyRequestID)] "
        }
        else {
            message += "] "
        }

        if let responseBody = response.body {
            if let code = responseBody["code"] as? String, let detailedMessage = responseBody["message"] as? String {
                message += "\(code) - \(detailedMessage)"
            }
            // Some authentication errors have different format
            else if let error = responseBody["error"] as? String, let errorDescription = responseBody["error_description"] as? String {
                message += "\(error) - \(errorDescription)"
            }
        }

        return message
    }

    /// Gets a dictionary representing the APIError.
    ///
    /// - Returns: A dictionary representing the APIError.
    override public func getDictionary() -> [String: Any] {
        var dict = super.getDictionary()
        dict["request"] = request?.getDictionary()
        dict["response"] = response?.getDictionary()
        return dict
    }
}
