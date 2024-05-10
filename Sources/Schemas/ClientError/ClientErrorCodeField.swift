import Foundation

public enum ClientErrorCodeField: String, CodableStringEnum {
    case created
    case accepted
    case noContent = "no_content"
    case redirect
    case notModified = "not_modified"
    case badRequest = "bad_request"
    case unauthorized
    case forbidden
    case notFound = "not_found"
    case methodNotAllowed = "method_not_allowed"
    case conflict
    case preconditionFailed = "precondition_failed"
    case tooManyRequests = "too_many_requests"
    case internalServerError = "internal_server_error"
    case unavailable
    case itemNameInvalid = "item_name_invalid"
    case insufficientScope = "insufficient_scope"
}
