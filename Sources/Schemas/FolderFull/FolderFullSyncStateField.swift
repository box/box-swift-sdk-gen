import Foundation

public enum FolderFullSyncStateField: String, CodableStringEnum {
    case synced
    case notSynced = "not_synced"
    case partiallySynced = "partially_synced"
}
