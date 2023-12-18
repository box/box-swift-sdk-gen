import Foundation

public enum UpdateFolderByIdRequestBodySyncStateField: String, CodableStringEnum {
    case synced
    case notSynced = "not_synced"
    case partiallySynced = "partially_synced"
}
