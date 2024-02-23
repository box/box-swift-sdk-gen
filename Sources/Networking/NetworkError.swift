import Foundation

/// Describes network related errors.
public class NetworkError: GeneralError {

    /// Initializer
    ///
    /// - Parameters:
    ///   - message: Error message
    ///   - error: The underlying error which caused this error, if any.
    override init(message: GeneralErrorFailureReason = "Error with the network", error: Error? = nil) {
        super.init(message: message, error: error)
        errorType = "NetworkError"
    }
}
