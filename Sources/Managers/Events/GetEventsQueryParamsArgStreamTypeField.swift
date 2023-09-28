import Foundation

public enum GetEventsQueryParamsArgStreamTypeField: String, CodableStringEnum {
    case all = "all"
    case changes = "changes"
    case sync = "sync"
    case adminLogs = "admin_logs"
    case adminLogsStreaming = "admin_logs_streaming"
}
