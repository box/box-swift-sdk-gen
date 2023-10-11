import Foundation

public enum SignRequestCreateSignerRoleField: String, CodableStringEnum {
    case signer
    case approver
    case finalCopyReader = "final_copy_reader"
}
