import Foundation

public enum ZipDownloadStatusStateField: String, CodableStringEnum {
    case inProgress = "in_progress"
    case failed
    case succeeded
}
