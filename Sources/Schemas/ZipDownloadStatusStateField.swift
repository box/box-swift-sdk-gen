import Foundation

public enum ZipDownloadStatusStateField: String, CodableStringEnum {
    case inProgress = "in_progress"
    case failed = "failed"
    case success = "success"
}
