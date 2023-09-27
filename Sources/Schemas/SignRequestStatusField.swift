import Foundation

public enum SignRequestStatusField: String, CodableStringEnum {
    case converting = "converting"
    case created = "created"
    case sent = "sent"
    case viewed = "viewed"
    case signed = "signed"
    case cancelled = "cancelled"
    case declined = "declined"
    case errorConverting = "error_converting"
    case errorSending = "error_sending"
    case expired = "expired"
    case finalizing = "finalizing"
    case errorFinalizing = "error_finalizing"
}
