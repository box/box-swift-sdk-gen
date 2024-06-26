import Foundation

public enum WebhookInvocationTriggerField: String, CodableStringEnum {
    case fIleUploaded = "FILE.UPLOADED"
    case fIlePreviewed = "FILE.PREVIEWED"
    case fIleDownloaded = "FILE.DOWNLOADED"
    case fIleTrashed = "FILE.TRASHED"
    case fIleDeleted = "FILE.DELETED"
    case fIleRestored = "FILE.RESTORED"
    case fIleCopied = "FILE.COPIED"
    case fIleMoved = "FILE.MOVED"
    case fIleLocked = "FILE.LOCKED"
    case fIleUnlocked = "FILE.UNLOCKED"
    case fIleRenamed = "FILE.RENAMED"
    case cOmmentCreated = "COMMENT.CREATED"
    case cOmmentUpdated = "COMMENT.UPDATED"
    case cOmmentDeleted = "COMMENT.DELETED"
    case tAskAssignmentCreated = "TASK_ASSIGNMENT.CREATED"
    case tAskAssignmentUpdated = "TASK_ASSIGNMENT.UPDATED"
    case mEtadataInstanceCreated = "METADATA_INSTANCE.CREATED"
    case mEtadataInstanceUpdated = "METADATA_INSTANCE.UPDATED"
    case mEtadataInstanceDeleted = "METADATA_INSTANCE.DELETED"
    case fOlderCreated = "FOLDER.CREATED"
    case fOlderRenamed = "FOLDER.RENAMED"
    case fOlderDownloaded = "FOLDER.DOWNLOADED"
    case fOlderRestored = "FOLDER.RESTORED"
    case fOlderDeleted = "FOLDER.DELETED"
    case fOlderCopied = "FOLDER.COPIED"
    case fOlderMoved = "FOLDER.MOVED"
    case fOlderTrashed = "FOLDER.TRASHED"
    case wEbhookDeleted = "WEBHOOK.DELETED"
    case cOllaborationCreated = "COLLABORATION.CREATED"
    case cOllaborationAccepted = "COLLABORATION.ACCEPTED"
    case cOllaborationRejected = "COLLABORATION.REJECTED"
    case cOllaborationRemoved = "COLLABORATION.REMOVED"
    case cOllaborationUpdated = "COLLABORATION.UPDATED"
    case sHaredLinkDeleted = "SHARED_LINK.DELETED"
    case sHaredLinkCreated = "SHARED_LINK.CREATED"
    case sHaredLinkUpdated = "SHARED_LINK.UPDATED"
    case sIgnRequestCompleted = "SIGN_REQUEST.COMPLETED"
    case sIgnRequestDeclined = "SIGN_REQUEST.DECLINED"
    case sIgnRequestExpired = "SIGN_REQUEST.EXPIRED"
    case sIgnRequestSignerEmailBounced = "SIGN_REQUEST.SIGNER_EMAIL_BOUNCED"
}
