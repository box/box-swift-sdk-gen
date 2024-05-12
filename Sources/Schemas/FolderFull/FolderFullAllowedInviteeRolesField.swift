import Foundation

public enum FolderFullAllowedInviteeRolesField: String, CodableStringEnum {
    case editor
    case viewer
    case previewer
    case uploader
    case previeweruploader = "previewer uploader"
    case vieweruploader = "viewer uploader"
    case coOwner = "co-owner"
}
