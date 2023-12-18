import Foundation

public enum CreateTaskRequestBodyCompletionRuleField: String, CodableStringEnum {
    case allAssignees = "all_assignees"
    case anyAssignee = "any_assignee"
}
