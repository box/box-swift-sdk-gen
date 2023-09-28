import Foundation

public enum UpdateTaskByIdRequestBodyArgCompletionRuleField: String, CodableStringEnum {
    case allAssignees = "all_assignees"
    case anyAssignee = "any_assignee"
}
