import Foundation

public enum SignRequestCreateSignerRoleField: String, CodableStringEnum {
    case signer = "signer"
    case approver = "approver"
    case finalCopyReader = "final_copy_reader"
}
