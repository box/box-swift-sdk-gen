import Foundation

public enum ClientErrorCodeField: String, CodableStringEnum {
    case created = "created"
    case accepted = "accepted"
    case noContent = "no_content"
    case redirect = "redirect"
    case notModified = "not_modified"
    case badRequest = "bad_request"
    case unauthorized = "unauthorized"
    case forbidden = "forbidden"
    case notFound = "not_found"
    case methodNotAllowed = "method_not_allowed"
    case conflict = "conflict"
    case preconditionFailed = "precondition_failed"
    case tooManyRequests = "too_many_requests"
    case internalServerError = "internal_server_error"
    case unavailable = "unavailable"
    case itemNameInvalid = "item_name_invalid"
    case insufficientScope = "insufficient_scope"
}
