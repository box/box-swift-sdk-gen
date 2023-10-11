import Foundation

public enum UpdateFolderByIdRequestBodyArgSyncStateField: String, CodableStringEnum {
    case synced
    case notSynced = "not_synced"
    case partiallySynced = "partially_synced"
}
