import Foundation

public enum SignTemplateAdditionalInfoNonEditableField: String, CodableStringEnum {
    case emailSubject = "email_subject"
    case emailMessage = "email_message"
    case name
    case daysValid = "days_valid"
    case signers
    case sourceFiles = "source_files"
}
