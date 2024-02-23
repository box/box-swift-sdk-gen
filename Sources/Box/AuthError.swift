import Foundation

/// Describes authentication errors.
public class AuthError: GeneralError {

    /// Initializer
    ///
    /// - Parameters:
    ///   - message: Error message
    ///   - error: The underlying error which caused this error, if any.
    override init(message: GeneralErrorFailureReason = "Error when authenticating", error: Error? = nil) {
        super.init(message: message, error: error)
        errorType = "AuthError"
    }
}
