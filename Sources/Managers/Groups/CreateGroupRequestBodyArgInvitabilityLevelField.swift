import Foundation

public enum CreateGroupRequestBodyArgInvitabilityLevelField: String, CodableStringEnum {
    case adminsOnly = "admins_only"
    case adminsAndMembers = "admins_and_members"
    case allManagedUsers = "all_managed_users"
}
