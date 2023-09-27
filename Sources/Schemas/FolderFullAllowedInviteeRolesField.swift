import Foundation

public enum FolderFullAllowedInviteeRolesField: String, CodableStringEnum {
    case editor = "editor"
    case viewer = "viewer"
    case previewer = "previewer"
    case uploader = "uploader"
    case previeweruploader = "previewer uploader"
    case vieweruploader = "viewer uploader"
    case coOwner = "co-owner"
}
