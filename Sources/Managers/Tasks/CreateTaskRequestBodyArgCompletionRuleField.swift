import Foundation

public enum CreateTaskRequestBodyArgCompletionRuleField: String, CodableStringEnum {
    case allAssignees = "all_assignees"
    case anyAssignee = "any_assignee"
}
