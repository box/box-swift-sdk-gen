import Foundation

public enum GetEventsQueryParamsEventTypeField: String, CodableStringEnum {
    case aCcessGranted = "ACCESS_GRANTED"
    case aCcessRevoked = "ACCESS_REVOKED"
    case aDdDeviceAssociation = "ADD_DEVICE_ASSOCIATION"
    case aDdLoginActivityDevice = "ADD_LOGIN_ACTIVITY_DEVICE"
    case aDminLogin = "ADMIN_LOGIN"
    case aPplicationCreated = "APPLICATION_CREATED"
    case aPplicationPublicKeyAdded = "APPLICATION_PUBLIC_KEY_ADDED"
    case aPplicationPublicKeyDeleted = "APPLICATION_PUBLIC_KEY_DELETED"
    case cHangeAdminRole = "CHANGE_ADMIN_ROLE"
    case cHangeFolderPermission = "CHANGE_FOLDER_PERMISSION"
    case cOllaborationAccept = "COLLABORATION_ACCEPT"
    case cOllaborationExpiration = "COLLABORATION_EXPIRATION"
    case cOllaborationInvite = "COLLABORATION_INVITE"
    case cOllaborationRemove = "COLLABORATION_REMOVE"
    case cOllaborationRoleChange = "COLLABORATION_ROLE_CHANGE"
    case cOmmentCreate = "COMMENT_CREATE"
    case cOmmentDelete = "COMMENT_DELETE"
    case cOntentWorkflowAbnormalDownloadActivity = "CONTENT_WORKFLOW_ABNORMAL_DOWNLOAD_ACTIVITY"
    case cOntentWorkflowAutomationAdd = "CONTENT_WORKFLOW_AUTOMATION_ADD"
    case cOntentWorkflowAutomationDelete = "CONTENT_WORKFLOW_AUTOMATION_DELETE"
    case cOntentWorkflowPolicyAdd = "CONTENT_WORKFLOW_POLICY_ADD"
    case cOntentWorkflowSharingPolicyViolation = "CONTENT_WORKFLOW_SHARING_POLICY_VIOLATION"
    case cOntentWorkflowUploadPolicyViolation = "CONTENT_WORKFLOW_UPLOAD_POLICY_VIOLATION"
    case cOpy = "COPY"
    case dAtaRetentionCreateRetention = "DATA_RETENTION_CREATE_RETENTION"
    case dAtaRetentionRemoveRetention = "DATA_RETENTION_REMOVE_RETENTION"
    case dElete = "DELETE"
    case dEleteUser = "DELETE_USER"
    case dEviceTrustCheckFailed = "DEVICE_TRUST_CHECK_FAILED"
    case dOwnload = "DOWNLOAD"
    case eDit = "EDIT"
    case eDitUser = "EDIT_USER"
    case eMailAliasConfirm = "EMAIL_ALIAS_CONFIRM"
    case eMailAliasRemove = "EMAIL_ALIAS_REMOVE"
    case eNterpriseAppAuthorizationUpdate = "ENTERPRISE_APP_AUTHORIZATION_UPDATE"
    case eXternalCollabSecuritySettings = "EXTERNAL_COLLAB_SECURITY_SETTINGS"
    case fAiledLogin = "FAILED_LOGIN"
    case fIleMarkedMalicious = "FILE_MARKED_MALICIOUS"
    case fIleWatermarkedDownload = "FILE_WATERMARKED_DOWNLOAD"
    case gRoupAddItem = "GROUP_ADD_ITEM"
    case gRoupAddUser = "GROUP_ADD_USER"
    case gRoupCreation = "GROUP_CREATION"
    case gRoupDeletion = "GROUP_DELETION"
    case gRoupEdited = "GROUP_EDITED"
    case gRoupRemoveItem = "GROUP_REMOVE_ITEM"
    case gRoupRemoveUser = "GROUP_REMOVE_USER"
    case iTemEmailSend = "ITEM_EMAIL_SEND"
    case iTemModify = "ITEM_MODIFY"
    case iTemOpen = "ITEM_OPEN"
    case iTemSharedUpdate = "ITEM_SHARED_UPDATE"
    case iTemSync = "ITEM_SYNC"
    case iTemUnsync = "ITEM_UNSYNC"
    case lEgalHoldAssignmentCreate = "LEGAL_HOLD_ASSIGNMENT_CREATE"
    case lEgalHoldAssignmentDelete = "LEGAL_HOLD_ASSIGNMENT_DELETE"
    case lEgalHoldPolicyCreate = "LEGAL_HOLD_POLICY_CREATE"
    case lEgalHoldPolicyDelete = "LEGAL_HOLD_POLICY_DELETE"
    case lEgalHoldPolicyUpdate = "LEGAL_HOLD_POLICY_UPDATE"
    case lOck = "LOCK"
    case lOgin = "LOGIN"
    case mEtadataInstanceCreate = "METADATA_INSTANCE_CREATE"
    case mEtadataInstanceDelete = "METADATA_INSTANCE_DELETE"
    case mEtadataInstanceUpdate = "METADATA_INSTANCE_UPDATE"
    case mEtadataTemplateCreate = "METADATA_TEMPLATE_CREATE"
    case mEtadataTemplateDelete = "METADATA_TEMPLATE_DELETE"
    case mEtadataTemplateUpdate = "METADATA_TEMPLATE_UPDATE"
    case mOve = "MOVE"
    case nEwUser = "NEW_USER"
    case oAuth2AccessTokenRevoke = "OAUTH2_ACCESS_TOKEN_REVOKE"
    case pReview = "PREVIEW"
    case rEmoveDeviceAssociation = "REMOVE_DEVICE_ASSOCIATION"
    case rEmoveLoginActivityDevice = "REMOVE_LOGIN_ACTIVITY_DEVICE"
    case rEname = "RENAME"
    case rEtentionPolicyAssignmentAdd = "RETENTION_POLICY_ASSIGNMENT_ADD"
    case sHare = "SHARE"
    case sHaredLinkSend = "SHARED_LINK_SEND"
    case sHareExpiration = "SHARE_EXPIRATION"
    case sHieldAlert = "SHIELD_ALERT"
    case sHieldExternalCollabAccessBlocked = "SHIELD_EXTERNAL_COLLAB_ACCESS_BLOCKED"
    case sHieldExternalCollabAccessBlockedMissingJustification = "SHIELD_EXTERNAL_COLLAB_ACCESS_BLOCKED_MISSING_JUSTIFICATION"
    case sHieldExternalCollabInviteBlocked = "SHIELD_EXTERNAL_COLLAB_INVITE_BLOCKED"
    case sHieldExternalCollabInviteBlockedMissingJustification = "SHIELD_EXTERNAL_COLLAB_INVITE_BLOCKED_MISSING_JUSTIFICATION"
    case sHieldJustificationApproval = "SHIELD_JUSTIFICATION_APPROVAL"
    case sHieldSharedLinkAccessBlocked = "SHIELD_SHARED_LINK_ACCESS_BLOCKED"
    case sHieldSharedLinkStatusRestrictedOnCreate = "SHIELD_SHARED_LINK_STATUS_RESTRICTED_ON_CREATE"
    case sHieldSharedLinkStatusRestrictedOnUpdate = "SHIELD_SHARED_LINK_STATUS_RESTRICTED_ON_UPDATE"
    case sIgnDocumentAssigned = "SIGN_DOCUMENT_ASSIGNED"
    case sIgnDocumentCancelled = "SIGN_DOCUMENT_CANCELLED"
    case sIgnDocumentCompleted = "SIGN_DOCUMENT_COMPLETED"
    case sIgnDocumentConverted = "SIGN_DOCUMENT_CONVERTED"
    case sIgnDocumentCreated = "SIGN_DOCUMENT_CREATED"
    case sIgnDocumentDeclined = "SIGN_DOCUMENT_DECLINED"
    case sIgnDocumentExpired = "SIGN_DOCUMENT_EXPIRED"
    case sIgnDocumentSigned = "SIGN_DOCUMENT_SIGNED"
    case sIgnDocumentViewedBySigned = "SIGN_DOCUMENT_VIEWED_BY_SIGNED"
    case sIgnerDownloaded = "SIGNER_DOWNLOADED"
    case sIgnerForwarded = "SIGNER_FORWARDED"
    case sTorageExpiration = "STORAGE_EXPIRATION"
    case tAskAssignmentCreate = "TASK_ASSIGNMENT_CREATE"
    case tAskAssignmentDelete = "TASK_ASSIGNMENT_DELETE"
    case tAskAssignmentUpdate = "TASK_ASSIGNMENT_UPDATE"
    case tAskCreate = "TASK_CREATE"
    case tAskUpdate = "TASK_UPDATE"
    case tErmsOfServiceAccept = "TERMS_OF_SERVICE_ACCEPT"
    case tErmsOfServiceReject = "TERMS_OF_SERVICE_REJECT"
    case uNdelete = "UNDELETE"
    case uNlock = "UNLOCK"
    case uNshare = "UNSHARE"
    case uPdateCollaborationExpiration = "UPDATE_COLLABORATION_EXPIRATION"
    case uPdateShareExpiration = "UPDATE_SHARE_EXPIRATION"
    case uPload = "UPLOAD"
    case uSerAuthenticateOauth2AccessTokenCreate = "USER_AUTHENTICATE_OAUTH2_ACCESS_TOKEN_CREATE"
    case wAtermarkLabelCreate = "WATERMARK_LABEL_CREATE"
    case wAtermarkLabelDelete = "WATERMARK_LABEL_DELETE"
}
