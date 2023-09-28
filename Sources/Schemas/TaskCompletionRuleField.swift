import Foundation

public enum TaskCompletionRuleField: String, CodableStringEnum {
    case allAssignees = "all_assignees"
    case anyAssignee = "any_assignee"
}
