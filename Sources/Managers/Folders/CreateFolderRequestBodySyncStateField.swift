import Foundation

public enum CreateFolderRequestBodySyncStateField: String, CodableStringEnum {
    case synced
    case notSynced = "not_synced"
    case partiallySynced = "partially_synced"
}
