import Foundation

public enum UpdateCollaborationByIdRequestBodyArgRoleField: String, CodableStringEnum {
    case editor
    case viewer
    case previewer
    case uploader
    case previeweruploader = "previewer uploader"
    case vieweruploader = "viewer uploader"
    case coOwner = "co-owner"
    case owner
}
