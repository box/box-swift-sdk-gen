import Foundation

public enum SignRequestStatusField: String, CodableStringEnum {
    case converting
    case created
    case sent
    case viewed
    case signed
    case cancelled
    case declined
    case errorConverting = "error_converting"
    case errorSending = "error_sending"
    case expired
    case finalizing
    case errorFinalizing = "error_finalizing"
}
