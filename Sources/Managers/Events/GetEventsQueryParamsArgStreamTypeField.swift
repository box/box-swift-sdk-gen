import Foundation

public enum GetEventsQueryParamsArgStreamTypeField: String, CodableStringEnum {
    case all
    case changes
    case sync
    case adminLogs = "admin_logs"
    case adminLogsStreaming = "admin_logs_streaming"
}
