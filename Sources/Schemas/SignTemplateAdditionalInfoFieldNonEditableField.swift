import Foundation

public enum SignTemplateAdditionalInfoFieldNonEditableField: String, CodableStringEnum {
    case emailSubject = "email_subject"
    case emailMessage = "email_message"
    case name = "name"
    case daysValid = "days_valid"
    case signers = "signers"
    case sourceFiles = "source_files"
}
