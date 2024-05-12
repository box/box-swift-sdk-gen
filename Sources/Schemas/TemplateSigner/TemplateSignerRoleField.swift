import Foundation

public enum TemplateSignerRoleField: String, CodableStringEnum {
    case signer
    case approver
    case finalCopyReader = "final_copy_reader"
}
