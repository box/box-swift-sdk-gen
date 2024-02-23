import Foundation

/// The underlying reason the error occurred.
public enum GeneralErrorFailureReason: LosslessStringConvertible {
    /// Could not authorize
    case authorizationInitialization(String)
    /// Unsuccessful token retrieval. Token not found
    case tokenRetrieval
    /// Unsuccessful refresh token retrieval. Refresh token was not found
    case refreshTokenNotFound
    /// The sent OAuth state does not match the received one
    case invalidOAuthState
    /// Couldn't obtain authorization code from OAuth web session result
    case invalidAuthorizationCode
    /// No response
    case noResponse(url: URL?)
    /// File was not downloaded
    case downloadFailed(url: URL?)
    /// Request has hit the maximum number of retries
    case rateLimitMaxRetries
    /// Could not move item from temporary download location to destination one
    case moveFileFailed(sourceUrl: URL, destinationUrl: URL)
    /// Could not decode or encode keychain data
    case keychainDataConversionError
    /// Unhandled keychain error
    case keychainUnhandledError(String)
    /// Couldn't serialize data
    case serializationError(String)
    /// Couldn't deserialize data
    case deserializationError(String)
    /// Custom error message
    case customValue(String)

    /// Initializer.
    ///
    /// - Parameter value: String representation of `GeneralErrorFailureReason`
    public init(_ value: String) {
        switch value {
        case "tokenRetrieval":
            self = .tokenRetrieval
        case "refreshTokenNotFound":
            self = .refreshTokenNotFound
        case "invalidOAuthState":
            self = .invalidOAuthState
        case "invalidAuthorizationCode":
            self = .invalidAuthorizationCode
        case "rateLimitMaxRetries":
            self = .rateLimitMaxRetries
        case "keychainDataConversionError":
            self = .keychainDataConversionError
        default:
            self = .customValue(value)
        }
    }

    /// Returns string representation of `GeneralErrorFailureReason`
    public var description: String {
        switch self {
        case let .authorizationInitialization(value):
            return value
        case .tokenRetrieval:
            return "Unsuccessful token retrieval. Token was not found."
        case .refreshTokenNotFound:
            return "Unsuccessful refresh token retrieval. Refresh token was not found."
        case .invalidOAuthState:
            return "The sent OAuth state does not match the received one."
        case .invalidAuthorizationCode:
            return "Couldn't obtain authorization code from OAuth web session result."
        case let .noResponse(url: url):
            return "No response \(url?.absoluteString ?? "")."
        case let .downloadFailed(url):
            return "File was not downloaded \(url?.absoluteString ?? "")."
        case let .moveFileFailed(sourceUrl, destinationUrl):
            return "Could not move item from temporary download location \(sourceUrl.absoluteString ) to download destination \(destinationUrl.absoluteString )."
        case .rateLimitMaxRetries:
            return "Request has hit the maximum number of retries."
        case let .keychainUnhandledError(message):
            return "Unhandled keychain error: \(message)"
        case .keychainDataConversionError:
            return "Could not decode or encode data for or from keychain"
        case let .serializationError(message):
            return "Could not serialize data: \(message)"
        case let .deserializationError(message):
            return "Could not deserialize data: \(message)"
        case let .customValue(value):
            return value
        }
    }
}
/// Extension for `ExpressibleByStringLiteral` conformance
extension GeneralErrorFailureReason: ExpressibleByStringLiteral {

    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral value: String) {
        self = GeneralErrorFailureReason(value)
    }
}

/// Describes general  errors
public class GeneralError: Error {

    /// Error message
    public var message: GeneralErrorFailureReason
    /// Type of error
    public var errorType: String
    /// Stack trace
    public var stackTrace: [String]
    /// The underlying error which caused this error
    public var error: Error?


    /// Initializer
    ///
    /// - Parameters:
    ///   - message: Error message
    ///   - error: The underlying error which caused this error, if any.
    init(message: GeneralErrorFailureReason = "Internal Error", error: Error? = nil) {
        self.errorType = "GeneralError"
        self.message = message
        self.stackTrace = Thread.callStackSymbols
        self.error = error
    }

    /// Gets a dictionary representing the GeneralError.
    ///
    /// - Returns: A dictionary representing the GeneralError.
    public func getDictionary() -> [String: Any] {
        var dict = [String: Any]()
        dict["errorType"] = errorType
        dict["message"] = message.description
        dict["stackTrace"] = stackTrace
        dict["error"] = error?.localizedDescription
        return dict
    }
}

/// Extension for `CustomStringConvertible` conformance
extension GeneralError: CustomStringConvertible {
    /// Provides error JSON string if found.
    public var description: String {
        guard
            let encodedData = try? JSONSerialization.data(withJSONObject: getDictionary(), options: [.prettyPrinted, .sortedKeys]),
            let JSONString = String(data: encodedData, encoding: .utf8)
        else {
            return "<Unparsed Error>"
        }
        return JSONString.replacingOccurrences(of: "\\", with: "")
    }
}

/// Extension for `LocalizedError` conformance
extension GeneralError: LocalizedError {

    /// A localized message describing what error occurred.
    public var errorDescription: String? {
        return message.description
    }
}
