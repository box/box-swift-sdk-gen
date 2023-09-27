import Foundation

public enum TemplateSignerRoleField: String, CodableStringEnum {
    case signer = "signer"
    case approver = "approver"
    case finalCopyReader = "final_copy_reader"
}
