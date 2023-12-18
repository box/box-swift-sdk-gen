import Foundation

public enum UpdateTaskByIdRequestBodyCompletionRuleField: String, CodableStringEnum {
    case allAssignees = "all_assignees"
    case anyAssignee = "any_assignee"
}
