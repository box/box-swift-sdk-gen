import Foundation

public enum CreateRetentionPolicyRequestBodyRetentionTypeField: String, CodableStringEnum {
    case modifiable
    case nonModifiable = "non_modifiable"
}
