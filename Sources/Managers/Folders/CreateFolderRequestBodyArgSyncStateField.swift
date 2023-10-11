import Foundation

public enum CreateFolderRequestBodyArgSyncStateField: String, CodableStringEnum {
    case synced
    case notSynced = "not_synced"
    case partiallySynced = "partially_synced"
}
