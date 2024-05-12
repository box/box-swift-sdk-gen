import Foundation

public enum FileFullLockAppTypeField: String, CodableStringEnum {
    case gsuite
    case officeWopi = "office_wopi"
    case officeWopiplus = "office_wopiplus"
    case other
}
