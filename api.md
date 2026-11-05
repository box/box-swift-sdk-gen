# API Reference

> [!CAUTION]
> **`box-swift-sdk-gen` is deprecated and no longer maintained.** As of September 17, 2025, it receives no new features, bug fixes, or security patches. Do not use it for new projects.
>
> Use [`box-ios-sdk`](https://github.com/box/box-ios-sdk) v10+ instead: add `https://github.com/box/box-ios-sdk.git` with Swift Package Manager, or `pod 'BoxSDK', '>= 10.0.0'` with CocoaPods. `box-ios-sdk` v10 includes every manager listed below, plus newer ones.
> To migrate existing code, see the [migration guide](https://github.com/box/box-ios-sdk/blob/main/migration-guides/from-box-swift-sdk-gen-v0-to-box-ios-sdk.md).

This file lists every manager and method exposed on `BoxClient`. For setup, authentication, and usage examples, see [README.md](README.md). Each section links to a page in [docs/](docs/README.md) with code samples. Parameters marked `?` are optional.

# Client

See [docs/Client.md](docs/Client.md) and [docs/Configuration.md](docs/Configuration.md).

Methods:

- <code>client.<a href="./Sources/Client/BoxClient.swift">makeRequest</a>(fetchOptions) -> FetchResponse</code>
- <code>client.<a href="./Sources/Client/BoxClient.swift">withAsUserHeader</a>(userId) -> BoxClient</code>
- <code>client.<a href="./Sources/Client/BoxClient.swift">withSuppressedNotifications</a>() -> BoxClient</code>
- <code>client.<a href="./Sources/Client/BoxClient.swift">withExtraHeaders</a>(extraHeaders?) -> BoxClient</code>
- <code>client.<a href="./Sources/Client/BoxClient.swift">withCustomBaseUrls</a>(baseUrls) -> BoxClient</code>

# Authorization

Examples: [docs/Authorization.md](docs/Authorization.md)

Methods:

- <code title="get /authorize">client.authorization.<a href="./Sources/Managers/Authorization/AuthorizationManager.swift">authorizeUser</a>(queryParams, headers?) -> Void</code>
- <code title="post /oauth2/token">client.authorization.<a href="./Sources/Managers/Authorization/AuthorizationManager.swift">requestAccessToken</a>(requestBody, headers?) -> AccessToken</code>
- <code title="post /oauth2/token">client.authorization.<a href="./Sources/Managers/Authorization/AuthorizationManager.swift">refreshAccessToken</a>(requestBody, headers?) -> AccessToken</code>
- <code title="post /oauth2/revoke">client.authorization.<a href="./Sources/Managers/Authorization/AuthorizationManager.swift">revokeAccessToken</a>(requestBody, headers?) -> Void</code>

# Files

Examples: [docs/Files.md](docs/Files.md)

Methods:

- <code title="get /2.0/files/{fileId}">client.files.<a href="./Sources/Managers/Files/FilesManager.swift">getFileById</a>(fileId, queryParams?, headers?) -> FileFull</code>
- <code title="put /2.0/files/{fileId}">client.files.<a href="./Sources/Managers/Files/FilesManager.swift">updateFileById</a>(fileId, requestBody?, queryParams?, headers?) -> FileFull</code>
- <code title="delete /2.0/files/{fileId}">client.files.<a href="./Sources/Managers/Files/FilesManager.swift">deleteFileById</a>(fileId, headers?) -> Void</code>
- <code title="post /2.0/files/{fileId}/copy">client.files.<a href="./Sources/Managers/Files/FilesManager.swift">copyFile</a>(fileId, requestBody, queryParams?, headers?) -> FileFull</code>
- <code title="get /2.0/files/{fileId}/thumbnail.{extension_}">client.files.<a href="./Sources/Managers/Files/FilesManager.swift">getFileThumbnailUrl</a>(fileId, extension_, queryParams?, headers?) -> String</code>
- <code title="get /2.0/files/{fileId}/thumbnail.{extension_}">client.files.<a href="./Sources/Managers/Files/FilesManager.swift">getFileThumbnailById</a>(fileId, extension_, downloadDestinationUrl, queryParams?, headers?) -> URL?</code>

# Trashed files

Examples: [docs/TrashedFiles.md](docs/TrashedFiles.md)

Methods:

- <code title="post /2.0/files/{fileId}">client.trashedFiles.<a href="./Sources/Managers/TrashedFiles/TrashedFilesManager.swift">restoreFileFromTrash</a>(fileId, requestBody?, queryParams?, headers?) -> TrashFileRestored</code>
- <code title="get /2.0/files/{fileId}/trash">client.trashedFiles.<a href="./Sources/Managers/TrashedFiles/TrashedFilesManager.swift">getTrashedFileById</a>(fileId, queryParams?, headers?) -> TrashFile</code>
- <code title="delete /2.0/files/{fileId}/trash">client.trashedFiles.<a href="./Sources/Managers/TrashedFiles/TrashedFilesManager.swift">deleteTrashedFileById</a>(fileId, headers?) -> Void</code>

# App item associations

Examples: [docs/AppItemAssociations.md](docs/AppItemAssociations.md)

Methods:

- <code title="get /2.0/files/{fileId}/app_item_associations">client.appItemAssociations.<a href="./Sources/Managers/AppItemAssociations/AppItemAssociationsManager.swift">getFileAppItemAssociations</a>(fileId, queryParams?, headers?) -> AppItemAssociations</code>
- <code title="get /2.0/folders/{folderId}/app_item_associations">client.appItemAssociations.<a href="./Sources/Managers/AppItemAssociations/AppItemAssociationsManager.swift">getFolderAppItemAssociations</a>(folderId, queryParams?, headers?) -> AppItemAssociations</code>

# Downloads

Methods:

- <code title="get /2.0/files/{fileId}/content">client.downloads.<a href="./Sources/Managers/Downloads/DownloadsManager.swift">getDownloadFileUrl</a>(fileId, queryParams?, headers?) -> String</code>
- <code title="get /2.0/files/{fileId}/content">client.downloads.<a href="./Sources/Managers/Downloads/DownloadsManager.swift">downloadFile</a>(fileId, downloadDestinationUrl, queryParams?, headers?) -> URL?</code>

# Uploads

Methods:

- <code title="post /2.0/files/{fileId}/content">client.uploads.<a href="./Sources/Managers/Uploads/UploadsManager.swift">uploadFileVersion</a>(fileId, requestBody, queryParams?, headers?) -> Files</code>
- <code title="options /2.0/files/content">client.uploads.<a href="./Sources/Managers/Uploads/UploadsManager.swift">preflightFileUploadCheck</a>(requestBody?, headers?) -> UploadUrl</code>
- <code title="post /2.0/files/content">client.uploads.<a href="./Sources/Managers/Uploads/UploadsManager.swift">uploadFile</a>(requestBody, queryParams?, headers?) -> Files</code>
- <code>client.uploads.<a href="./Sources/Managers/Uploads/UploadsManager.swift">uploadWithPreflightCheck</a>(requestBody, queryParams?, headers?) -> Files</code>

# Chunked uploads

Examples: [docs/ChunkedUploads.md](docs/ChunkedUploads.md)

Methods:

- <code title="post /2.0/files/upload_sessions">client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">createFileUploadSession</a>(requestBody, headers?) -> UploadSession</code>
- <code title="post /2.0/files/{fileId}/upload_sessions">client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">createFileUploadSessionForExistingFile</a>(fileId, requestBody, headers?) -> UploadSession</code>
- <code>client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">getFileUploadSessionByUrl</a>(url, headers?) -> UploadSession</code>
- <code title="get /2.0/files/upload_sessions/{uploadSessionId}">client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">getFileUploadSessionById</a>(uploadSessionId, headers?) -> UploadSession</code>
- <code>client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">uploadFilePartByUrl</a>(url, requestBody, headers) -> UploadedPart</code>
- <code title="put /2.0/files/upload_sessions/{uploadSessionId}">client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">uploadFilePart</a>(uploadSessionId, requestBody, headers) -> UploadedPart</code>
- <code>client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">deleteFileUploadSessionByUrl</a>(url, headers?) -> Void</code>
- <code title="delete /2.0/files/upload_sessions/{uploadSessionId}">client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">deleteFileUploadSessionById</a>(uploadSessionId, headers?) -> Void</code>
- <code>client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">getFileUploadSessionPartsByUrl</a>(url, queryParams?, headers?) -> UploadParts</code>
- <code title="get /2.0/files/upload_sessions/{uploadSessionId}/parts">client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">getFileUploadSessionParts</a>(uploadSessionId, queryParams?, headers?) -> UploadParts</code>
- <code>client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">createFileUploadSessionCommitByUrl</a>(url, requestBody, headers) -> Files?</code>
- <code title="post /2.0/files/upload_sessions/{uploadSessionId}/commit">client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">createFileUploadSessionCommit</a>(uploadSessionId, requestBody, headers) -> Files?</code>
- <code>client.chunkedUploads.<a href="./Sources/Managers/ChunkedUploads/ChunkedUploadsManager.swift">uploadBigFile</a>(file, fileName, fileSize, parentFolderId) -> FileFull</code>

# List collaborations

Examples: [docs/ListCollaborations.md](docs/ListCollaborations.md)

Methods:

- <code title="get /2.0/files/{fileId}/collaborations">client.listCollaborations.<a href="./Sources/Managers/ListCollaborations/ListCollaborationsManager.swift">getFileCollaborations</a>(fileId, queryParams?, headers?) -> Collaborations</code>
- <code title="get /2.0/folders/{folderId}/collaborations">client.listCollaborations.<a href="./Sources/Managers/ListCollaborations/ListCollaborationsManager.swift">getFolderCollaborations</a>(folderId, queryParams?, headers?) -> Collaborations</code>
- <code title="get /2.0/collaborations">client.listCollaborations.<a href="./Sources/Managers/ListCollaborations/ListCollaborationsManager.swift">getCollaborations</a>(queryParams, headers?) -> CollaborationsOffsetPaginated</code>
- <code title="get /2.0/groups/{groupId}/collaborations">client.listCollaborations.<a href="./Sources/Managers/ListCollaborations/ListCollaborationsManager.swift">getGroupCollaborations</a>(groupId, queryParams?, headers?) -> CollaborationsOffsetPaginated</code>

# Comments

Examples: [docs/Comments.md](docs/Comments.md)

Methods:

- <code title="get /2.0/files/{fileId}/comments">client.comments.<a href="./Sources/Managers/Comments/CommentsManager.swift">getFileComments</a>(fileId, queryParams?, headers?) -> Comments</code>
- <code title="get /2.0/comments/{commentId}">client.comments.<a href="./Sources/Managers/Comments/CommentsManager.swift">getCommentById</a>(commentId, queryParams?, headers?) -> CommentFull</code>
- <code title="put /2.0/comments/{commentId}">client.comments.<a href="./Sources/Managers/Comments/CommentsManager.swift">updateCommentById</a>(commentId, requestBody?, queryParams?, headers?) -> CommentFull</code>
- <code title="delete /2.0/comments/{commentId}">client.comments.<a href="./Sources/Managers/Comments/CommentsManager.swift">deleteCommentById</a>(commentId, headers?) -> Void</code>
- <code title="post /2.0/comments">client.comments.<a href="./Sources/Managers/Comments/CommentsManager.swift">createComment</a>(requestBody, queryParams?, headers?) -> CommentFull</code>

# Tasks

Examples: [docs/Tasks.md](docs/Tasks.md)

Methods:

- <code title="get /2.0/files/{fileId}/tasks">client.tasks.<a href="./Sources/Managers/Tasks/TasksManager.swift">getFileTasks</a>(fileId, headers?) -> Tasks</code>
- <code title="post /2.0/tasks">client.tasks.<a href="./Sources/Managers/Tasks/TasksManager.swift">createTask</a>(requestBody, headers?) -> Task</code>
- <code title="get /2.0/tasks/{taskId}">client.tasks.<a href="./Sources/Managers/Tasks/TasksManager.swift">getTaskById</a>(taskId, headers?) -> Task</code>
- <code title="put /2.0/tasks/{taskId}">client.tasks.<a href="./Sources/Managers/Tasks/TasksManager.swift">updateTaskById</a>(taskId, requestBody?, headers?) -> Task</code>
- <code title="delete /2.0/tasks/{taskId}">client.tasks.<a href="./Sources/Managers/Tasks/TasksManager.swift">deleteTaskById</a>(taskId, headers?) -> Void</code>

# File versions

Examples: [docs/FileVersions.md](docs/FileVersions.md)

Methods:

- <code title="get /2.0/files/{fileId}/versions">client.fileVersions.<a href="./Sources/Managers/FileVersions/FileVersionsManager.swift">getFileVersions</a>(fileId, queryParams?, headers?) -> FileVersions</code>
- <code title="get /2.0/files/{fileId}/versions/{fileVersionId}">client.fileVersions.<a href="./Sources/Managers/FileVersions/FileVersionsManager.swift">getFileVersionById</a>(fileId, fileVersionId, queryParams?, headers?) -> FileVersionFull</code>
- <code title="delete /2.0/files/{fileId}/versions/{fileVersionId}">client.fileVersions.<a href="./Sources/Managers/FileVersions/FileVersionsManager.swift">deleteFileVersionById</a>(fileId, fileVersionId, headers?) -> Void</code>
- <code title="put /2.0/files/{fileId}/versions/{fileVersionId}">client.fileVersions.<a href="./Sources/Managers/FileVersions/FileVersionsManager.swift">updateFileVersionById</a>(fileId, fileVersionId, requestBody?, headers?) -> FileVersionFull</code>
- <code title="post /2.0/files/{fileId}/versions/current">client.fileVersions.<a href="./Sources/Managers/FileVersions/FileVersionsManager.swift">promoteFileVersion</a>(fileId, requestBody?, queryParams?, headers?) -> FileVersionFull</code>

# File metadata

Examples: [docs/FileMetadata.md](docs/FileMetadata.md)

Methods:

- <code title="get /2.0/files/{fileId}/metadata">client.fileMetadata.<a href="./Sources/Managers/FileMetadata/FileMetadataManager.swift">getFileMetadata</a>(fileId, headers?) -> Metadatas</code>
- <code title="get /2.0/files/{fileId}/metadata/{scope}/{templateKey}">client.fileMetadata.<a href="./Sources/Managers/FileMetadata/FileMetadataManager.swift">getFileMetadataById</a>(fileId, scope, templateKey, headers?) -> MetadataFull</code>
- <code title="post /2.0/files/{fileId}/metadata/{scope}/{templateKey}">client.fileMetadata.<a href="./Sources/Managers/FileMetadata/FileMetadataManager.swift">createFileMetadataById</a>(fileId, scope, templateKey, requestBody, headers?) -> MetadataFull</code>
- <code title="put /2.0/files/{fileId}/metadata/{scope}/{templateKey}">client.fileMetadata.<a href="./Sources/Managers/FileMetadata/FileMetadataManager.swift">updateFileMetadataById</a>(fileId, scope, templateKey, requestBody, headers?) -> MetadataFull</code>
- <code title="delete /2.0/files/{fileId}/metadata/{scope}/{templateKey}">client.fileMetadata.<a href="./Sources/Managers/FileMetadata/FileMetadataManager.swift">deleteFileMetadataById</a>(fileId, scope, templateKey, headers?) -> Void</code>

# File classifications

Examples: [docs/FileClassifications.md](docs/FileClassifications.md)

Methods:

- <code title="get /2.0/files/{fileId}/metadata/enterprise/securityClassification-6VMVochwUWo">client.fileClassifications.<a href="./Sources/Managers/FileClassifications/FileClassificationsManager.swift">getClassificationOnFile</a>(fileId, headers?) -> Classification</code>
- <code title="post /2.0/files/{fileId}/metadata/enterprise/securityClassification-6VMVochwUWo">client.fileClassifications.<a href="./Sources/Managers/FileClassifications/FileClassificationsManager.swift">addClassificationToFile</a>(fileId, requestBody?, headers?) -> Classification</code>
- <code title="put /2.0/files/{fileId}/metadata/enterprise/securityClassification-6VMVochwUWo">client.fileClassifications.<a href="./Sources/Managers/FileClassifications/FileClassificationsManager.swift">updateClassificationOnFile</a>(fileId, requestBody, headers?) -> Classification</code>
- <code title="delete /2.0/files/{fileId}/metadata/enterprise/securityClassification-6VMVochwUWo">client.fileClassifications.<a href="./Sources/Managers/FileClassifications/FileClassificationsManager.swift">deleteClassificationFromFile</a>(fileId, headers?) -> Void</code>

# Skills

Examples: [docs/Skills.md](docs/Skills.md)

Methods:

- <code title="get /2.0/files/{fileId}/metadata/global/boxSkillsCards">client.skills.<a href="./Sources/Managers/Skills/SkillsManager.swift">getBoxSkillCardsOnFile</a>(fileId, headers?) -> SkillCardsMetadata</code>
- <code title="post /2.0/files/{fileId}/metadata/global/boxSkillsCards">client.skills.<a href="./Sources/Managers/Skills/SkillsManager.swift">createBoxSkillCardsOnFile</a>(fileId, requestBody, headers?) -> SkillCardsMetadata</code>
- <code title="put /2.0/files/{fileId}/metadata/global/boxSkillsCards">client.skills.<a href="./Sources/Managers/Skills/SkillsManager.swift">updateBoxSkillCardsOnFile</a>(fileId, requestBody, headers?) -> SkillCardsMetadata</code>
- <code title="delete /2.0/files/{fileId}/metadata/global/boxSkillsCards">client.skills.<a href="./Sources/Managers/Skills/SkillsManager.swift">deleteBoxSkillCardsFromFile</a>(fileId, headers?) -> Void</code>
- <code title="put /2.0/skill_invocations/{skillId}">client.skills.<a href="./Sources/Managers/Skills/SkillsManager.swift">updateAllSkillCardsOnFile</a>(skillId, requestBody, headers?) -> Void</code>

# File watermarks

Examples: [docs/FileWatermarks.md](docs/FileWatermarks.md)

Methods:

- <code title="get /2.0/files/{fileId}/watermark">client.fileWatermarks.<a href="./Sources/Managers/FileWatermarks/FileWatermarksManager.swift">getFileWatermark</a>(fileId, headers?) -> Watermark</code>
- <code title="put /2.0/files/{fileId}/watermark">client.fileWatermarks.<a href="./Sources/Managers/FileWatermarks/FileWatermarksManager.swift">updateFileWatermark</a>(fileId, requestBody, headers?) -> Watermark</code>
- <code title="delete /2.0/files/{fileId}/watermark">client.fileWatermarks.<a href="./Sources/Managers/FileWatermarks/FileWatermarksManager.swift">deleteFileWatermark</a>(fileId, headers?) -> Void</code>

# File requests

Examples: [docs/FileRequests.md](docs/FileRequests.md)

Methods:

- <code title="get /2.0/file_requests/{fileRequestId}">client.fileRequests.<a href="./Sources/Managers/FileRequests/FileRequestsManager.swift">getFileRequestById</a>(fileRequestId, headers?) -> FileRequest</code>
- <code title="put /2.0/file_requests/{fileRequestId}">client.fileRequests.<a href="./Sources/Managers/FileRequests/FileRequestsManager.swift">updateFileRequestById</a>(fileRequestId, requestBody, headers?) -> FileRequest</code>
- <code title="delete /2.0/file_requests/{fileRequestId}">client.fileRequests.<a href="./Sources/Managers/FileRequests/FileRequestsManager.swift">deleteFileRequestById</a>(fileRequestId, headers?) -> Void</code>
- <code title="post /2.0/file_requests/{fileRequestId}/copy">client.fileRequests.<a href="./Sources/Managers/FileRequests/FileRequestsManager.swift">createFileRequestCopy</a>(fileRequestId, requestBody, headers?) -> FileRequest</code>

# Folders

Examples: [docs/Folders.md](docs/Folders.md)

Methods:

- <code title="get /2.0/folders/{folderId}">client.folders.<a href="./Sources/Managers/Folders/FoldersManager.swift">getFolderById</a>(folderId, queryParams?, headers?) -> FolderFull</code>
- <code title="put /2.0/folders/{folderId}">client.folders.<a href="./Sources/Managers/Folders/FoldersManager.swift">updateFolderById</a>(folderId, requestBody?, queryParams?, headers?) -> FolderFull</code>
- <code title="delete /2.0/folders/{folderId}">client.folders.<a href="./Sources/Managers/Folders/FoldersManager.swift">deleteFolderById</a>(folderId, queryParams?, headers?) -> Void</code>
- <code title="get /2.0/folders/{folderId}/items">client.folders.<a href="./Sources/Managers/Folders/FoldersManager.swift">getFolderItems</a>(folderId, queryParams?, headers?) -> Items</code>
- <code title="post /2.0/folders">client.folders.<a href="./Sources/Managers/Folders/FoldersManager.swift">createFolder</a>(requestBody, queryParams?, headers?) -> FolderFull</code>
- <code title="post /2.0/folders/{folderId}/copy">client.folders.<a href="./Sources/Managers/Folders/FoldersManager.swift">copyFolder</a>(folderId, requestBody, queryParams?, headers?) -> FolderFull</code>

# Trashed folders

Examples: [docs/TrashedFolders.md](docs/TrashedFolders.md)

Methods:

- <code title="post /2.0/folders/{folderId}">client.trashedFolders.<a href="./Sources/Managers/TrashedFolders/TrashedFoldersManager.swift">restoreFolderFromTrash</a>(folderId, requestBody?, queryParams?, headers?) -> TrashFolderRestored</code>
- <code title="get /2.0/folders/{folderId}/trash">client.trashedFolders.<a href="./Sources/Managers/TrashedFolders/TrashedFoldersManager.swift">getTrashedFolderById</a>(folderId, queryParams?, headers?) -> TrashFolder</code>
- <code title="delete /2.0/folders/{folderId}/trash">client.trashedFolders.<a href="./Sources/Managers/TrashedFolders/TrashedFoldersManager.swift">deleteTrashedFolderById</a>(folderId, headers?) -> Void</code>

# Folder metadata

Examples: [docs/FolderMetadata.md](docs/FolderMetadata.md)

Methods:

- <code title="get /2.0/folders/{folderId}/metadata">client.folderMetadata.<a href="./Sources/Managers/FolderMetadata/FolderMetadataManager.swift">getFolderMetadata</a>(folderId, headers?) -> Metadatas</code>
- <code title="get /2.0/folders/{folderId}/metadata/{scope}/{templateKey}">client.folderMetadata.<a href="./Sources/Managers/FolderMetadata/FolderMetadataManager.swift">getFolderMetadataById</a>(folderId, scope, templateKey, headers?) -> MetadataFull</code>
- <code title="post /2.0/folders/{folderId}/metadata/{scope}/{templateKey}">client.folderMetadata.<a href="./Sources/Managers/FolderMetadata/FolderMetadataManager.swift">createFolderMetadataById</a>(folderId, scope, templateKey, requestBody, headers?) -> MetadataFull</code>
- <code title="put /2.0/folders/{folderId}/metadata/{scope}/{templateKey}">client.folderMetadata.<a href="./Sources/Managers/FolderMetadata/FolderMetadataManager.swift">updateFolderMetadataById</a>(folderId, scope, templateKey, requestBody, headers?) -> MetadataFull</code>
- <code title="delete /2.0/folders/{folderId}/metadata/{scope}/{templateKey}">client.folderMetadata.<a href="./Sources/Managers/FolderMetadata/FolderMetadataManager.swift">deleteFolderMetadataById</a>(folderId, scope, templateKey, headers?) -> Void</code>

# Folder classifications

Examples: [docs/FolderClassifications.md](docs/FolderClassifications.md)

Methods:

- <code title="get /2.0/folders/{folderId}/metadata/enterprise/securityClassification-6VMVochwUWo">client.folderClassifications.<a href="./Sources/Managers/FolderClassifications/FolderClassificationsManager.swift">getClassificationOnFolder</a>(folderId, headers?) -> Classification</code>
- <code title="post /2.0/folders/{folderId}/metadata/enterprise/securityClassification-6VMVochwUWo">client.folderClassifications.<a href="./Sources/Managers/FolderClassifications/FolderClassificationsManager.swift">addClassificationToFolder</a>(folderId, requestBody?, headers?) -> Classification</code>
- <code title="put /2.0/folders/{folderId}/metadata/enterprise/securityClassification-6VMVochwUWo">client.folderClassifications.<a href="./Sources/Managers/FolderClassifications/FolderClassificationsManager.swift">updateClassificationOnFolder</a>(folderId, requestBody, headers?) -> Classification</code>
- <code title="delete /2.0/folders/{folderId}/metadata/enterprise/securityClassification-6VMVochwUWo">client.folderClassifications.<a href="./Sources/Managers/FolderClassifications/FolderClassificationsManager.swift">deleteClassificationFromFolder</a>(folderId, headers?) -> Void</code>

# Trashed items

Examples: [docs/TrashedItems.md](docs/TrashedItems.md)

Methods:

- <code title="get /2.0/folders/trash/items">client.trashedItems.<a href="./Sources/Managers/TrashedItems/TrashedItemsManager.swift">getTrashedItems</a>(queryParams?, headers?) -> Items</code>

# Folder watermarks

Examples: [docs/FolderWatermarks.md](docs/FolderWatermarks.md)

Methods:

- <code title="get /2.0/folders/{folderId}/watermark">client.folderWatermarks.<a href="./Sources/Managers/FolderWatermarks/FolderWatermarksManager.swift">getFolderWatermark</a>(folderId, headers?) -> Watermark</code>
- <code title="put /2.0/folders/{folderId}/watermark">client.folderWatermarks.<a href="./Sources/Managers/FolderWatermarks/FolderWatermarksManager.swift">updateFolderWatermark</a>(folderId, requestBody, headers?) -> Watermark</code>
- <code title="delete /2.0/folders/{folderId}/watermark">client.folderWatermarks.<a href="./Sources/Managers/FolderWatermarks/FolderWatermarksManager.swift">deleteFolderWatermark</a>(folderId, headers?) -> Void</code>

# Folder locks

Examples: [docs/FolderLocks.md](docs/FolderLocks.md)

Methods:

- <code title="get /2.0/folder_locks">client.folderLocks.<a href="./Sources/Managers/FolderLocks/FolderLocksManager.swift">getFolderLocks</a>(queryParams, headers?) -> FolderLocks</code>
- <code title="post /2.0/folder_locks">client.folderLocks.<a href="./Sources/Managers/FolderLocks/FolderLocksManager.swift">createFolderLock</a>(requestBody, headers?) -> FolderLock</code>
- <code title="delete /2.0/folder_locks/{folderLockId}">client.folderLocks.<a href="./Sources/Managers/FolderLocks/FolderLocksManager.swift">deleteFolderLockById</a>(folderLockId, headers?) -> Void</code>

# Metadata templates

Examples: [docs/MetadataTemplates.md](docs/MetadataTemplates.md)

Methods:

- <code title="get /2.0/metadata_templates">client.metadataTemplates.<a href="./Sources/Managers/MetadataTemplates/MetadataTemplatesManager.swift">getMetadataTemplatesByInstanceId</a>(queryParams, headers?) -> MetadataTemplates</code>
- <code title="get /2.0/metadata_templates/{scope}/{templateKey}/schema">client.metadataTemplates.<a href="./Sources/Managers/MetadataTemplates/MetadataTemplatesManager.swift">getMetadataTemplate</a>(scope, templateKey, headers?) -> MetadataTemplate</code>
- <code title="put /2.0/metadata_templates/{scope}/{templateKey}/schema">client.metadataTemplates.<a href="./Sources/Managers/MetadataTemplates/MetadataTemplatesManager.swift">updateMetadataTemplate</a>(scope, templateKey, requestBody, headers?) -> MetadataTemplate</code>
- <code title="delete /2.0/metadata_templates/{scope}/{templateKey}/schema">client.metadataTemplates.<a href="./Sources/Managers/MetadataTemplates/MetadataTemplatesManager.swift">deleteMetadataTemplate</a>(scope, templateKey, headers?) -> Void</code>
- <code title="get /2.0/metadata_templates/{templateId}">client.metadataTemplates.<a href="./Sources/Managers/MetadataTemplates/MetadataTemplatesManager.swift">getMetadataTemplateById</a>(templateId, headers?) -> MetadataTemplate</code>
- <code title="get /2.0/metadata_templates/global">client.metadataTemplates.<a href="./Sources/Managers/MetadataTemplates/MetadataTemplatesManager.swift">getGlobalMetadataTemplates</a>(queryParams?, headers?) -> MetadataTemplates</code>
- <code title="get /2.0/metadata_templates/enterprise">client.metadataTemplates.<a href="./Sources/Managers/MetadataTemplates/MetadataTemplatesManager.swift">getEnterpriseMetadataTemplates</a>(queryParams?, headers?) -> MetadataTemplates</code>
- <code title="post /2.0/metadata_templates/schema">client.metadataTemplates.<a href="./Sources/Managers/MetadataTemplates/MetadataTemplatesManager.swift">createMetadataTemplate</a>(requestBody, headers?) -> MetadataTemplate</code>

# Classifications

Examples: [docs/Classifications.md](docs/Classifications.md)

Methods:

- <code title="get /2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema">client.classifications.<a href="./Sources/Managers/Classifications/ClassificationsManager.swift">getClassificationTemplate</a>(headers?) -> ClassificationTemplate</code>
- <code title="put /2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema">client.classifications.<a href="./Sources/Managers/Classifications/ClassificationsManager.swift">addClassification</a>(requestBody, headers?) -> ClassificationTemplate</code>
- <code title="put /2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema">client.classifications.<a href="./Sources/Managers/Classifications/ClassificationsManager.swift">updateClassification</a>(requestBody, headers?) -> ClassificationTemplate</code>
- <code title="post /2.0/metadata_templates/schema">client.classifications.<a href="./Sources/Managers/Classifications/ClassificationsManager.swift">createClassificationTemplate</a>(requestBody, headers?) -> ClassificationTemplate</code>

# Metadata cascade policies

Examples: [docs/MetadataCascadePolicies.md](docs/MetadataCascadePolicies.md)

Methods:

- <code title="get /2.0/metadata_cascade_policies">client.metadataCascadePolicies.<a href="./Sources/Managers/MetadataCascadePolicies/MetadataCascadePoliciesManager.swift">getMetadataCascadePolicies</a>(queryParams, headers?) -> MetadataCascadePolicies</code>
- <code title="post /2.0/metadata_cascade_policies">client.metadataCascadePolicies.<a href="./Sources/Managers/MetadataCascadePolicies/MetadataCascadePoliciesManager.swift">createMetadataCascadePolicy</a>(requestBody, headers?) -> MetadataCascadePolicy</code>
- <code title="get /2.0/metadata_cascade_policies/{metadataCascadePolicyId}">client.metadataCascadePolicies.<a href="./Sources/Managers/MetadataCascadePolicies/MetadataCascadePoliciesManager.swift">getMetadataCascadePolicyById</a>(metadataCascadePolicyId, headers?) -> MetadataCascadePolicy</code>
- <code title="delete /2.0/metadata_cascade_policies/{metadataCascadePolicyId}">client.metadataCascadePolicies.<a href="./Sources/Managers/MetadataCascadePolicies/MetadataCascadePoliciesManager.swift">deleteMetadataCascadePolicyById</a>(metadataCascadePolicyId, headers?) -> Void</code>
- <code title="post /2.0/metadata_cascade_policies/{metadataCascadePolicyId}/apply">client.metadataCascadePolicies.<a href="./Sources/Managers/MetadataCascadePolicies/MetadataCascadePoliciesManager.swift">applyMetadataCascadePolicy</a>(metadataCascadePolicyId, requestBody, headers?) -> Void</code>

# Search

Examples: [docs/Search.md](docs/Search.md)

Methods:

- <code title="post /2.0/metadata_queries/execute_read">client.search.<a href="./Sources/Managers/Search/SearchManager.swift">searchByMetadataQuery</a>(requestBody, headers?) -> MetadataQueryResults</code>
- <code title="get /2.0/search">client.search.<a href="./Sources/Managers/Search/SearchManager.swift">searchForContent</a>(queryParams?, headers?) -> SearchResultsOrSearchResultsWithSharedLinks</code>

# User collaborations

Examples: [docs/UserCollaborations.md](docs/UserCollaborations.md)

Methods:

- <code title="get /2.0/collaborations/{collaborationId}">client.userCollaborations.<a href="./Sources/Managers/UserCollaborations/UserCollaborationsManager.swift">getCollaborationById</a>(collaborationId, queryParams?, headers?) -> Collaboration</code>
- <code title="put /2.0/collaborations/{collaborationId}">client.userCollaborations.<a href="./Sources/Managers/UserCollaborations/UserCollaborationsManager.swift">updateCollaborationById</a>(collaborationId, requestBody, headers?) -> Collaboration?</code>
- <code title="delete /2.0/collaborations/{collaborationId}">client.userCollaborations.<a href="./Sources/Managers/UserCollaborations/UserCollaborationsManager.swift">deleteCollaborationById</a>(collaborationId, headers?) -> Void</code>
- <code title="post /2.0/collaborations">client.userCollaborations.<a href="./Sources/Managers/UserCollaborations/UserCollaborationsManager.swift">createCollaboration</a>(requestBody, queryParams?, headers?) -> Collaboration</code>

# Task assignments

Examples: [docs/TaskAssignments.md](docs/TaskAssignments.md)

Methods:

- <code title="get /2.0/tasks/{taskId}/assignments">client.taskAssignments.<a href="./Sources/Managers/TaskAssignments/TaskAssignmentsManager.swift">getTaskAssignments</a>(taskId, headers?) -> TaskAssignments</code>
- <code title="post /2.0/task_assignments">client.taskAssignments.<a href="./Sources/Managers/TaskAssignments/TaskAssignmentsManager.swift">createTaskAssignment</a>(requestBody, headers?) -> TaskAssignment</code>
- <code title="get /2.0/task_assignments/{taskAssignmentId}">client.taskAssignments.<a href="./Sources/Managers/TaskAssignments/TaskAssignmentsManager.swift">getTaskAssignmentById</a>(taskAssignmentId, headers?) -> TaskAssignment</code>
- <code title="put /2.0/task_assignments/{taskAssignmentId}">client.taskAssignments.<a href="./Sources/Managers/TaskAssignments/TaskAssignmentsManager.swift">updateTaskAssignmentById</a>(taskAssignmentId, requestBody?, headers?) -> TaskAssignment</code>
- <code title="delete /2.0/task_assignments/{taskAssignmentId}">client.taskAssignments.<a href="./Sources/Managers/TaskAssignments/TaskAssignmentsManager.swift">deleteTaskAssignmentById</a>(taskAssignmentId, headers?) -> Void</code>

# Shared links files

Examples: [docs/SharedLinksFiles.md](docs/SharedLinksFiles.md)

Methods:

- <code title="get /2.0/shared_items">client.sharedLinksFiles.<a href="./Sources/Managers/SharedLinksFiles/SharedLinksFilesManager.swift">findFileForSharedLink</a>(queryParams?, headers) -> FileFull</code>
- <code title="get /2.0/files/{fileId}">client.sharedLinksFiles.<a href="./Sources/Managers/SharedLinksFiles/SharedLinksFilesManager.swift">getSharedLinkForFile</a>(fileId, queryParams, headers?) -> FileFull</code>
- <code title="put /2.0/files/{fileId}">client.sharedLinksFiles.<a href="./Sources/Managers/SharedLinksFiles/SharedLinksFilesManager.swift">addShareLinkToFile</a>(fileId, requestBody?, queryParams, headers?) -> FileFull</code>
- <code title="put /2.0/files/{fileId}">client.sharedLinksFiles.<a href="./Sources/Managers/SharedLinksFiles/SharedLinksFilesManager.swift">updateSharedLinkOnFile</a>(fileId, requestBody?, queryParams, headers?) -> FileFull</code>
- <code title="put /2.0/files/{fileId}">client.sharedLinksFiles.<a href="./Sources/Managers/SharedLinksFiles/SharedLinksFilesManager.swift">removeSharedLinkFromFile</a>(fileId, requestBody?, queryParams, headers?) -> FileFull</code>

# Shared links folders

Examples: [docs/SharedLinksFolders.md](docs/SharedLinksFolders.md)

Methods:

- <code title="get /2.0/shared_items">client.sharedLinksFolders.<a href="./Sources/Managers/SharedLinksFolders/SharedLinksFoldersManager.swift">findFolderForSharedLink</a>(queryParams?, headers) -> FolderFull</code>
- <code title="get /2.0/folders/{folderId}">client.sharedLinksFolders.<a href="./Sources/Managers/SharedLinksFolders/SharedLinksFoldersManager.swift">getSharedLinkForFolder</a>(folderId, queryParams, headers?) -> FolderFull</code>
- <code title="put /2.0/folders/{folderId}">client.sharedLinksFolders.<a href="./Sources/Managers/SharedLinksFolders/SharedLinksFoldersManager.swift">addShareLinkToFolder</a>(folderId, requestBody?, queryParams, headers?) -> FolderFull</code>
- <code title="put /2.0/folders/{folderId}">client.sharedLinksFolders.<a href="./Sources/Managers/SharedLinksFolders/SharedLinksFoldersManager.swift">updateSharedLinkOnFolder</a>(folderId, requestBody?, queryParams, headers?) -> FolderFull</code>
- <code title="put /2.0/folders/{folderId}">client.sharedLinksFolders.<a href="./Sources/Managers/SharedLinksFolders/SharedLinksFoldersManager.swift">removeSharedLinkFromFolder</a>(folderId, requestBody?, queryParams, headers?) -> FolderFull</code>

# Web links

Examples: [docs/WebLinks.md](docs/WebLinks.md)

Methods:

- <code title="post /2.0/web_links">client.webLinks.<a href="./Sources/Managers/WebLinks/WebLinksManager.swift">createWebLink</a>(requestBody, headers?) -> WebLink</code>
- <code title="get /2.0/web_links/{webLinkId}">client.webLinks.<a href="./Sources/Managers/WebLinks/WebLinksManager.swift">getWebLinkById</a>(webLinkId, headers?) -> WebLink</code>
- <code title="put /2.0/web_links/{webLinkId}">client.webLinks.<a href="./Sources/Managers/WebLinks/WebLinksManager.swift">updateWebLinkById</a>(webLinkId, requestBody?, headers?) -> WebLink</code>
- <code title="delete /2.0/web_links/{webLinkId}">client.webLinks.<a href="./Sources/Managers/WebLinks/WebLinksManager.swift">deleteWebLinkById</a>(webLinkId, headers?) -> Void</code>

# Trashed web links

Examples: [docs/TrashedWebLinks.md](docs/TrashedWebLinks.md)

Methods:

- <code title="post /2.0/web_links/{webLinkId}">client.trashedWebLinks.<a href="./Sources/Managers/TrashedWebLinks/TrashedWebLinksManager.swift">restoreWeblinkFromTrash</a>(webLinkId, requestBody?, queryParams?, headers?) -> TrashWebLinkRestored</code>
- <code title="get /2.0/web_links/{webLinkId}/trash">client.trashedWebLinks.<a href="./Sources/Managers/TrashedWebLinks/TrashedWebLinksManager.swift">getTrashedWebLinkById</a>(webLinkId, queryParams?, headers?) -> TrashWebLink</code>
- <code title="delete /2.0/web_links/{webLinkId}/trash">client.trashedWebLinks.<a href="./Sources/Managers/TrashedWebLinks/TrashedWebLinksManager.swift">deleteTrashedWebLinkById</a>(webLinkId, headers?) -> Void</code>

# Shared links web links

Examples: [docs/SharedLinksWebLinks.md](docs/SharedLinksWebLinks.md)

Methods:

- <code title="get /2.0/shared_items">client.sharedLinksWebLinks.<a href="./Sources/Managers/SharedLinksWebLinks/SharedLinksWebLinksManager.swift">findWebLinkForSharedLink</a>(queryParams?, headers) -> WebLink</code>
- <code title="get /2.0/web_links/{webLinkId}">client.sharedLinksWebLinks.<a href="./Sources/Managers/SharedLinksWebLinks/SharedLinksWebLinksManager.swift">getSharedLinkForWebLink</a>(webLinkId, queryParams, headers?) -> WebLink</code>
- <code title="put /2.0/web_links/{webLinkId}">client.sharedLinksWebLinks.<a href="./Sources/Managers/SharedLinksWebLinks/SharedLinksWebLinksManager.swift">addShareLinkToWebLink</a>(webLinkId, requestBody?, queryParams, headers?) -> WebLink</code>
- <code title="put /2.0/web_links/{webLinkId}">client.sharedLinksWebLinks.<a href="./Sources/Managers/SharedLinksWebLinks/SharedLinksWebLinksManager.swift">updateSharedLinkOnWebLink</a>(webLinkId, requestBody?, queryParams, headers?) -> WebLink</code>
- <code title="put /2.0/web_links/{webLinkId}">client.sharedLinksWebLinks.<a href="./Sources/Managers/SharedLinksWebLinks/SharedLinksWebLinksManager.swift">removeSharedLinkFromWebLink</a>(webLinkId, requestBody?, queryParams, headers?) -> WebLink</code>

# Shared links app items

Examples: [docs/SharedLinksAppItems.md](docs/SharedLinksAppItems.md)

Methods:

- <code title="get /2.0/shared_items">client.sharedLinksAppItems.<a href="./Sources/Managers/SharedLinksAppItems/SharedLinksAppItemsManager.swift">findAppItemForSharedLink</a>(headers) -> AppItem</code>

# Users

Examples: [docs/Users.md](docs/Users.md)

Methods:

- <code title="get /2.0/users">client.users.<a href="./Sources/Managers/Users/UsersManager.swift">getUsers</a>(queryParams?, headers?) -> Users</code>
- <code title="post /2.0/users">client.users.<a href="./Sources/Managers/Users/UsersManager.swift">createUser</a>(requestBody, queryParams?, headers?) -> UserFull</code>
- <code title="get /2.0/users/me">client.users.<a href="./Sources/Managers/Users/UsersManager.swift">getUserMe</a>(queryParams?, headers?) -> UserFull</code>
- <code title="get /2.0/users/{userId}">client.users.<a href="./Sources/Managers/Users/UsersManager.swift">getUserById</a>(userId, queryParams?, headers?) -> UserFull</code>
- <code title="put /2.0/users/{userId}">client.users.<a href="./Sources/Managers/Users/UsersManager.swift">updateUserById</a>(userId, requestBody?, queryParams?, headers?) -> UserFull</code>
- <code title="delete /2.0/users/{userId}">client.users.<a href="./Sources/Managers/Users/UsersManager.swift">deleteUserById</a>(userId, queryParams?, headers?) -> Void</code>

# Session termination

Examples: [docs/SessionTermination.md](docs/SessionTermination.md)

Methods:

- <code title="post /2.0/users/terminate_sessions">client.sessionTermination.<a href="./Sources/Managers/SessionTermination/SessionTerminationManager.swift">terminateUsersSessions</a>(requestBody, headers?) -> SessionTerminationMessage</code>
- <code title="post /2.0/groups/terminate_sessions">client.sessionTermination.<a href="./Sources/Managers/SessionTermination/SessionTerminationManager.swift">terminateGroupsSessions</a>(requestBody, headers?) -> SessionTerminationMessage</code>

# Avatars

Examples: [docs/Avatars.md](docs/Avatars.md)

Methods:

- <code title="get /2.0/users/{userId}/avatar">client.avatars.<a href="./Sources/Managers/Avatars/AvatarsManager.swift">getUserAvatar</a>(userId, downloadDestinationUrl, headers?) -> URL?</code>
- <code title="post /2.0/users/{userId}/avatar">client.avatars.<a href="./Sources/Managers/Avatars/AvatarsManager.swift">createUserAvatar</a>(userId, requestBody, headers?) -> UserAvatar</code>
- <code title="delete /2.0/users/{userId}/avatar">client.avatars.<a href="./Sources/Managers/Avatars/AvatarsManager.swift">deleteUserAvatar</a>(userId, headers?) -> Void</code>

# Transfer

Examples: [docs/Transfer.md](docs/Transfer.md)

Methods:

- <code title="put /2.0/users/{userId}/folders/0">client.transfer.<a href="./Sources/Managers/Transfer/TransferManager.swift">transferOwnedFolder</a>(userId, requestBody, queryParams?, headers?) -> FolderFull</code>

# Email aliases

Examples: [docs/EmailAliases.md](docs/EmailAliases.md)

Methods:

- <code title="get /2.0/users/{userId}/email_aliases">client.emailAliases.<a href="./Sources/Managers/EmailAliases/EmailAliasesManager.swift">getUserEmailAliases</a>(userId, headers?) -> EmailAliases</code>
- <code title="post /2.0/users/{userId}/email_aliases">client.emailAliases.<a href="./Sources/Managers/EmailAliases/EmailAliasesManager.swift">createUserEmailAlias</a>(userId, requestBody, headers?) -> EmailAlias</code>
- <code title="delete /2.0/users/{userId}/email_aliases/{emailAliasId}">client.emailAliases.<a href="./Sources/Managers/EmailAliases/EmailAliasesManager.swift">deleteUserEmailAliasById</a>(userId, emailAliasId, headers?) -> Void</code>

# Memberships

Examples: [docs/Memberships.md](docs/Memberships.md)

Methods:

- <code title="get /2.0/users/{userId}/memberships">client.memberships.<a href="./Sources/Managers/Memberships/MembershipsManager.swift">getUserMemberships</a>(userId, queryParams?, headers?) -> GroupMemberships</code>
- <code title="get /2.0/groups/{groupId}/memberships">client.memberships.<a href="./Sources/Managers/Memberships/MembershipsManager.swift">getGroupMemberships</a>(groupId, queryParams?, headers?) -> GroupMemberships</code>
- <code title="post /2.0/group_memberships">client.memberships.<a href="./Sources/Managers/Memberships/MembershipsManager.swift">createGroupMembership</a>(requestBody, queryParams?, headers?) -> GroupMembership</code>
- <code title="get /2.0/group_memberships/{groupMembershipId}">client.memberships.<a href="./Sources/Managers/Memberships/MembershipsManager.swift">getGroupMembershipById</a>(groupMembershipId, queryParams?, headers?) -> GroupMembership</code>
- <code title="put /2.0/group_memberships/{groupMembershipId}">client.memberships.<a href="./Sources/Managers/Memberships/MembershipsManager.swift">updateGroupMembershipById</a>(groupMembershipId, requestBody?, queryParams?, headers?) -> GroupMembership</code>
- <code title="delete /2.0/group_memberships/{groupMembershipId}">client.memberships.<a href="./Sources/Managers/Memberships/MembershipsManager.swift">deleteGroupMembershipById</a>(groupMembershipId, headers?) -> Void</code>

# Invites

Examples: [docs/Invites.md](docs/Invites.md)

Methods:

- <code title="post /2.0/invites">client.invites.<a href="./Sources/Managers/Invites/InvitesManager.swift">createInvite</a>(requestBody, queryParams?, headers?) -> Invite</code>
- <code title="get /2.0/invites/{inviteId}">client.invites.<a href="./Sources/Managers/Invites/InvitesManager.swift">getInviteById</a>(inviteId, queryParams?, headers?) -> Invite</code>

# Groups

Examples: [docs/Groups.md](docs/Groups.md)

Methods:

- <code title="get /2.0/groups">client.groups.<a href="./Sources/Managers/Groups/GroupsManager.swift">getGroups</a>(queryParams?, headers?) -> Groups</code>
- <code title="post /2.0/groups">client.groups.<a href="./Sources/Managers/Groups/GroupsManager.swift">createGroup</a>(requestBody, queryParams?, headers?) -> GroupFull</code>
- <code title="get /2.0/groups/{groupId}">client.groups.<a href="./Sources/Managers/Groups/GroupsManager.swift">getGroupById</a>(groupId, queryParams?, headers?) -> GroupFull</code>
- <code title="put /2.0/groups/{groupId}">client.groups.<a href="./Sources/Managers/Groups/GroupsManager.swift">updateGroupById</a>(groupId, requestBody?, queryParams?, headers?) -> GroupFull</code>
- <code title="delete /2.0/groups/{groupId}">client.groups.<a href="./Sources/Managers/Groups/GroupsManager.swift">deleteGroupById</a>(groupId, headers?) -> Void</code>

# Webhooks

Examples: [docs/Webhooks.md](docs/Webhooks.md)

Methods:

- <code title="get /2.0/webhooks">client.webhooks.<a href="./Sources/Managers/Webhooks/WebhooksManager.swift">getWebhooks</a>(queryParams?, headers?) -> Webhooks</code>
- <code title="post /2.0/webhooks">client.webhooks.<a href="./Sources/Managers/Webhooks/WebhooksManager.swift">createWebhook</a>(requestBody, headers?) -> Webhook</code>
- <code title="get /2.0/webhooks/{webhookId}">client.webhooks.<a href="./Sources/Managers/Webhooks/WebhooksManager.swift">getWebhookById</a>(webhookId, headers?) -> Webhook</code>
- <code title="put /2.0/webhooks/{webhookId}">client.webhooks.<a href="./Sources/Managers/Webhooks/WebhooksManager.swift">updateWebhookById</a>(webhookId, requestBody?, headers?) -> Webhook</code>
- <code title="delete /2.0/webhooks/{webhookId}">client.webhooks.<a href="./Sources/Managers/Webhooks/WebhooksManager.swift">deleteWebhookById</a>(webhookId, headers?) -> Void</code>

# Events

Examples: [docs/Events.md](docs/Events.md)

Methods:

- <code title="options /2.0/events">client.events.<a href="./Sources/Managers/Events/EventsManager.swift">getEventsWithLongPolling</a>(headers?) -> RealtimeServers</code>
- <code title="get /2.0/events">client.events.<a href="./Sources/Managers/Events/EventsManager.swift">getEvents</a>(queryParams?, headers?) -> Events</code>

# Collections

Examples: [docs/Collections.md](docs/Collections.md)

Methods:

- <code title="get /2.0/collections">client.collections.<a href="./Sources/Managers/Collections/CollectionsManager.swift">getCollections</a>(queryParams?, headers?) -> Collections</code>
- <code title="get /2.0/collections/{collectionId}/items">client.collections.<a href="./Sources/Managers/Collections/CollectionsManager.swift">getCollectionItems</a>(collectionId, queryParams?, headers?) -> ItemsOffsetPaginated</code>
- <code title="get /2.0/collections/{collectionId}">client.collections.<a href="./Sources/Managers/Collections/CollectionsManager.swift">getCollectionById</a>(collectionId, headers?) -> Collection</code>

# Recent items

Examples: [docs/RecentItems.md](docs/RecentItems.md)

Methods:

- <code title="get /2.0/recent_items">client.recentItems.<a href="./Sources/Managers/RecentItems/RecentItemsManager.swift">getRecentItems</a>(queryParams?, headers?) -> RecentItems</code>

# Retention policies

Examples: [docs/RetentionPolicies.md](docs/RetentionPolicies.md)

Methods:

- <code title="get /2.0/retention_policies">client.retentionPolicies.<a href="./Sources/Managers/RetentionPolicies/RetentionPoliciesManager.swift">getRetentionPolicies</a>(queryParams?, headers?) -> RetentionPolicies</code>
- <code title="post /2.0/retention_policies">client.retentionPolicies.<a href="./Sources/Managers/RetentionPolicies/RetentionPoliciesManager.swift">createRetentionPolicy</a>(requestBody, headers?) -> RetentionPolicy</code>
- <code title="get /2.0/retention_policies/{retentionPolicyId}">client.retentionPolicies.<a href="./Sources/Managers/RetentionPolicies/RetentionPoliciesManager.swift">getRetentionPolicyById</a>(retentionPolicyId, queryParams?, headers?) -> RetentionPolicy</code>
- <code title="put /2.0/retention_policies/{retentionPolicyId}">client.retentionPolicies.<a href="./Sources/Managers/RetentionPolicies/RetentionPoliciesManager.swift">updateRetentionPolicyById</a>(retentionPolicyId, requestBody?, headers?) -> RetentionPolicy</code>
- <code title="delete /2.0/retention_policies/{retentionPolicyId}">client.retentionPolicies.<a href="./Sources/Managers/RetentionPolicies/RetentionPoliciesManager.swift">deleteRetentionPolicyById</a>(retentionPolicyId, headers?) -> Void</code>

# Retention policy assignments

Examples: [docs/RetentionPolicyAssignments.md](docs/RetentionPolicyAssignments.md)

Methods:

- <code title="get /2.0/retention_policies/{retentionPolicyId}/assignments">client.retentionPolicyAssignments.<a href="./Sources/Managers/RetentionPolicyAssignments/RetentionPolicyAssignmentsManager.swift">getRetentionPolicyAssignments</a>(retentionPolicyId, queryParams?, headers?) -> RetentionPolicyAssignments</code>
- <code title="post /2.0/retention_policy_assignments">client.retentionPolicyAssignments.<a href="./Sources/Managers/RetentionPolicyAssignments/RetentionPolicyAssignmentsManager.swift">createRetentionPolicyAssignment</a>(requestBody, headers?) -> RetentionPolicyAssignment</code>
- <code title="get /2.0/retention_policy_assignments/{retentionPolicyAssignmentId}">client.retentionPolicyAssignments.<a href="./Sources/Managers/RetentionPolicyAssignments/RetentionPolicyAssignmentsManager.swift">getRetentionPolicyAssignmentById</a>(retentionPolicyAssignmentId, queryParams?, headers?) -> RetentionPolicyAssignment</code>
- <code title="delete /2.0/retention_policy_assignments/{retentionPolicyAssignmentId}">client.retentionPolicyAssignments.<a href="./Sources/Managers/RetentionPolicyAssignments/RetentionPolicyAssignmentsManager.swift">deleteRetentionPolicyAssignmentById</a>(retentionPolicyAssignmentId, headers?) -> Void</code>
- <code title="get /2.0/retention_policy_assignments/{retentionPolicyAssignmentId}/files_under_retention">client.retentionPolicyAssignments.<a href="./Sources/Managers/RetentionPolicyAssignments/RetentionPolicyAssignmentsManager.swift">getFilesUnderRetentionPolicyAssignment</a>(retentionPolicyAssignmentId, queryParams?, headers?) -> FilesUnderRetention</code>

# Legal hold policies

Examples: [docs/LegalHoldPolicies.md](docs/LegalHoldPolicies.md)

Methods:

- <code title="get /2.0/legal_hold_policies">client.legalHoldPolicies.<a href="./Sources/Managers/LegalHoldPolicies/LegalHoldPoliciesManager.swift">getLegalHoldPolicies</a>(queryParams?, headers?) -> LegalHoldPolicies</code>
- <code title="post /2.0/legal_hold_policies">client.legalHoldPolicies.<a href="./Sources/Managers/LegalHoldPolicies/LegalHoldPoliciesManager.swift">createLegalHoldPolicy</a>(requestBody, headers?) -> LegalHoldPolicy</code>
- <code title="get /2.0/legal_hold_policies/{legalHoldPolicyId}">client.legalHoldPolicies.<a href="./Sources/Managers/LegalHoldPolicies/LegalHoldPoliciesManager.swift">getLegalHoldPolicyById</a>(legalHoldPolicyId, headers?) -> LegalHoldPolicy</code>
- <code title="put /2.0/legal_hold_policies/{legalHoldPolicyId}">client.legalHoldPolicies.<a href="./Sources/Managers/LegalHoldPolicies/LegalHoldPoliciesManager.swift">updateLegalHoldPolicyById</a>(legalHoldPolicyId, requestBody?, headers?) -> LegalHoldPolicy</code>
- <code title="delete /2.0/legal_hold_policies/{legalHoldPolicyId}">client.legalHoldPolicies.<a href="./Sources/Managers/LegalHoldPolicies/LegalHoldPoliciesManager.swift">deleteLegalHoldPolicyById</a>(legalHoldPolicyId, headers?) -> Void</code>

# Legal hold policy assignments

Examples: [docs/LegalHoldPolicyAssignments.md](docs/LegalHoldPolicyAssignments.md)

Methods:

- <code title="get /2.0/legal_hold_policy_assignments">client.legalHoldPolicyAssignments.<a href="./Sources/Managers/LegalHoldPolicyAssignments/LegalHoldPolicyAssignmentsManager.swift">getLegalHoldPolicyAssignments</a>(queryParams, headers?) -> LegalHoldPolicyAssignments</code>
- <code title="post /2.0/legal_hold_policy_assignments">client.legalHoldPolicyAssignments.<a href="./Sources/Managers/LegalHoldPolicyAssignments/LegalHoldPolicyAssignmentsManager.swift">createLegalHoldPolicyAssignment</a>(requestBody, headers?) -> LegalHoldPolicyAssignment</code>
- <code title="get /2.0/legal_hold_policy_assignments/{legalHoldPolicyAssignmentId}">client.legalHoldPolicyAssignments.<a href="./Sources/Managers/LegalHoldPolicyAssignments/LegalHoldPolicyAssignmentsManager.swift">getLegalHoldPolicyAssignmentById</a>(legalHoldPolicyAssignmentId, headers?) -> LegalHoldPolicyAssignment</code>
- <code title="delete /2.0/legal_hold_policy_assignments/{legalHoldPolicyAssignmentId}">client.legalHoldPolicyAssignments.<a href="./Sources/Managers/LegalHoldPolicyAssignments/LegalHoldPolicyAssignmentsManager.swift">deleteLegalHoldPolicyAssignmentById</a>(legalHoldPolicyAssignmentId, headers?) -> Void</code>
- <code title="get /2.0/legal_hold_policy_assignments/{legalHoldPolicyAssignmentId}/files_on_hold">client.legalHoldPolicyAssignments.<a href="./Sources/Managers/LegalHoldPolicyAssignments/LegalHoldPolicyAssignmentsManager.swift">getLegalHoldPolicyAssignmentFileOnHold</a>(legalHoldPolicyAssignmentId, queryParams?, headers?) -> FilesOnHold</code>

# File version retentions

Examples: [docs/FileVersionRetentions.md](docs/FileVersionRetentions.md)

Methods:

- <code title="get /2.0/file_version_retentions">client.fileVersionRetentions.<a href="./Sources/Managers/FileVersionRetentions/FileVersionRetentionsManager.swift">getFileVersionRetentions</a>(queryParams?, headers?) -> FileVersionRetentions</code>
- <code title="get /2.0/file_version_retentions/{fileVersionRetentionId}">client.fileVersionRetentions.<a href="./Sources/Managers/FileVersionRetentions/FileVersionRetentionsManager.swift">getFileVersionRetentionById</a>(fileVersionRetentionId, headers?) -> FileVersionRetention</code>

# File version legal holds

Examples: [docs/FileVersionLegalHolds.md](docs/FileVersionLegalHolds.md)

Methods:

- <code title="get /2.0/file_version_legal_holds/{fileVersionLegalHoldId}">client.fileVersionLegalHolds.<a href="./Sources/Managers/FileVersionLegalHolds/FileVersionLegalHoldsManager.swift">getFileVersionLegalHoldById</a>(fileVersionLegalHoldId, headers?) -> FileVersionLegalHold</code>
- <code title="get /2.0/file_version_legal_holds">client.fileVersionLegalHolds.<a href="./Sources/Managers/FileVersionLegalHolds/FileVersionLegalHoldsManager.swift">getFileVersionLegalHolds</a>(queryParams, headers?) -> FileVersionLegalHolds</code>

# Shield information barriers

Examples: [docs/ShieldInformationBarriers.md](docs/ShieldInformationBarriers.md)

Methods:

- <code title="get /2.0/shield_information_barriers/{shieldInformationBarrierId}">client.shieldInformationBarriers.<a href="./Sources/Managers/ShieldInformationBarriers/ShieldInformationBarriersManager.swift">getShieldInformationBarrierById</a>(shieldInformationBarrierId, headers?) -> ShieldInformationBarrier</code>
- <code title="post /2.0/shield_information_barriers/change_status">client.shieldInformationBarriers.<a href="./Sources/Managers/ShieldInformationBarriers/ShieldInformationBarriersManager.swift">updateShieldInformationBarrierStatus</a>(requestBody, headers?) -> ShieldInformationBarrier</code>
- <code title="get /2.0/shield_information_barriers">client.shieldInformationBarriers.<a href="./Sources/Managers/ShieldInformationBarriers/ShieldInformationBarriersManager.swift">getShieldInformationBarriers</a>(queryParams?, headers?) -> ShieldInformationBarriers</code>
- <code title="post /2.0/shield_information_barriers">client.shieldInformationBarriers.<a href="./Sources/Managers/ShieldInformationBarriers/ShieldInformationBarriersManager.swift">createShieldInformationBarrier</a>(requestBody, headers?) -> ShieldInformationBarrier</code>

# Shield information barrier reports

Examples: [docs/ShieldInformationBarrierReports.md](docs/ShieldInformationBarrierReports.md)

Methods:

- <code title="get /2.0/shield_information_barrier_reports">client.shieldInformationBarrierReports.<a href="./Sources/Managers/ShieldInformationBarrierReports/ShieldInformationBarrierReportsManager.swift">getShieldInformationBarrierReports</a>(queryParams, headers?) -> ShieldInformationBarrierReports</code>
- <code title="post /2.0/shield_information_barrier_reports">client.shieldInformationBarrierReports.<a href="./Sources/Managers/ShieldInformationBarrierReports/ShieldInformationBarrierReportsManager.swift">createShieldInformationBarrierReport</a>(requestBody, headers?) -> ShieldInformationBarrierReport</code>
- <code title="get /2.0/shield_information_barrier_reports/{shieldInformationBarrierReportId}">client.shieldInformationBarrierReports.<a href="./Sources/Managers/ShieldInformationBarrierReports/ShieldInformationBarrierReportsManager.swift">getShieldInformationBarrierReportById</a>(shieldInformationBarrierReportId, headers?) -> ShieldInformationBarrierReport</code>

# Shield information barrier segments

Examples: [docs/ShieldInformationBarrierSegments.md](docs/ShieldInformationBarrierSegments.md)

Methods:

- <code title="get /2.0/shield_information_barrier_segments/{shieldInformationBarrierSegmentId}">client.shieldInformationBarrierSegments.<a href="./Sources/Managers/ShieldInformationBarrierSegments/ShieldInformationBarrierSegmentsManager.swift">getShieldInformationBarrierSegmentById</a>(shieldInformationBarrierSegmentId, headers?) -> ShieldInformationBarrierSegment</code>
- <code title="delete /2.0/shield_information_barrier_segments/{shieldInformationBarrierSegmentId}">client.shieldInformationBarrierSegments.<a href="./Sources/Managers/ShieldInformationBarrierSegments/ShieldInformationBarrierSegmentsManager.swift">deleteShieldInformationBarrierSegmentById</a>(shieldInformationBarrierSegmentId, headers?) -> Void</code>
- <code title="put /2.0/shield_information_barrier_segments/{shieldInformationBarrierSegmentId}">client.shieldInformationBarrierSegments.<a href="./Sources/Managers/ShieldInformationBarrierSegments/ShieldInformationBarrierSegmentsManager.swift">updateShieldInformationBarrierSegmentById</a>(shieldInformationBarrierSegmentId, requestBody?, headers?) -> ShieldInformationBarrierSegment</code>
- <code title="get /2.0/shield_information_barrier_segments">client.shieldInformationBarrierSegments.<a href="./Sources/Managers/ShieldInformationBarrierSegments/ShieldInformationBarrierSegmentsManager.swift">getShieldInformationBarrierSegments</a>(queryParams, headers?) -> ShieldInformationBarrierSegments</code>
- <code title="post /2.0/shield_information_barrier_segments">client.shieldInformationBarrierSegments.<a href="./Sources/Managers/ShieldInformationBarrierSegments/ShieldInformationBarrierSegmentsManager.swift">createShieldInformationBarrierSegment</a>(requestBody, headers?) -> ShieldInformationBarrierSegment</code>

# Shield information barrier segment members

Examples: [docs/ShieldInformationBarrierSegmentMembers.md](docs/ShieldInformationBarrierSegmentMembers.md)

Methods:

- <code title="get /2.0/shield_information_barrier_segment_members/{shieldInformationBarrierSegmentMemberId}">client.shieldInformationBarrierSegmentMembers.<a href="./Sources/Managers/ShieldInformationBarrierSegmentMembers/ShieldInformationBarrierSegmentMembersManager.swift">getShieldInformationBarrierSegmentMemberById</a>(shieldInformationBarrierSegmentMemberId, headers?) -> ShieldInformationBarrierSegmentMember</code>
- <code title="delete /2.0/shield_information_barrier_segment_members/{shieldInformationBarrierSegmentMemberId}">client.shieldInformationBarrierSegmentMembers.<a href="./Sources/Managers/ShieldInformationBarrierSegmentMembers/ShieldInformationBarrierSegmentMembersManager.swift">deleteShieldInformationBarrierSegmentMemberById</a>(shieldInformationBarrierSegmentMemberId, headers?) -> Void</code>
- <code title="get /2.0/shield_information_barrier_segment_members">client.shieldInformationBarrierSegmentMembers.<a href="./Sources/Managers/ShieldInformationBarrierSegmentMembers/ShieldInformationBarrierSegmentMembersManager.swift">getShieldInformationBarrierSegmentMembers</a>(queryParams, headers?) -> ShieldInformationBarrierSegmentMembers</code>
- <code title="post /2.0/shield_information_barrier_segment_members">client.shieldInformationBarrierSegmentMembers.<a href="./Sources/Managers/ShieldInformationBarrierSegmentMembers/ShieldInformationBarrierSegmentMembersManager.swift">createShieldInformationBarrierSegmentMember</a>(requestBody, headers?) -> ShieldInformationBarrierSegmentMember</code>

# Shield information barrier segment restrictions

Examples: [docs/ShieldInformationBarrierSegmentRestrictions.md](docs/ShieldInformationBarrierSegmentRestrictions.md)

Methods:

- <code title="get /2.0/shield_information_barrier_segment_restrictions/{shieldInformationBarrierSegmentRestrictionId}">client.shieldInformationBarrierSegmentRestrictions.<a href="./Sources/Managers/ShieldInformationBarrierSegmentRestrictions/ShieldInformationBarrierSegmentRestrictionsManager.swift">getShieldInformationBarrierSegmentRestrictionById</a>(shieldInformationBarrierSegmentRestrictionId, headers?) -> ShieldInformationBarrierSegmentRestriction</code>
- <code title="delete /2.0/shield_information_barrier_segment_restrictions/{shieldInformationBarrierSegmentRestrictionId}">client.shieldInformationBarrierSegmentRestrictions.<a href="./Sources/Managers/ShieldInformationBarrierSegmentRestrictions/ShieldInformationBarrierSegmentRestrictionsManager.swift">deleteShieldInformationBarrierSegmentRestrictionById</a>(shieldInformationBarrierSegmentRestrictionId, headers?) -> Void</code>
- <code title="get /2.0/shield_information_barrier_segment_restrictions">client.shieldInformationBarrierSegmentRestrictions.<a href="./Sources/Managers/ShieldInformationBarrierSegmentRestrictions/ShieldInformationBarrierSegmentRestrictionsManager.swift">getShieldInformationBarrierSegmentRestrictions</a>(queryParams, headers?) -> ShieldInformationBarrierSegmentRestrictions</code>
- <code title="post /2.0/shield_information_barrier_segment_restrictions">client.shieldInformationBarrierSegmentRestrictions.<a href="./Sources/Managers/ShieldInformationBarrierSegmentRestrictions/ShieldInformationBarrierSegmentRestrictionsManager.swift">createShieldInformationBarrierSegmentRestriction</a>(requestBody, headers?) -> ShieldInformationBarrierSegmentRestriction</code>

# Device pinners

Examples: [docs/DevicePinners.md](docs/DevicePinners.md)

Methods:

- <code title="get /2.0/device_pinners/{devicePinnerId}">client.devicePinners.<a href="./Sources/Managers/DevicePinners/DevicePinnersManager.swift">getDevicePinnerById</a>(devicePinnerId, headers?) -> DevicePinner</code>
- <code title="delete /2.0/device_pinners/{devicePinnerId}">client.devicePinners.<a href="./Sources/Managers/DevicePinners/DevicePinnersManager.swift">deleteDevicePinnerById</a>(devicePinnerId, headers?) -> Void</code>
- <code title="get /2.0/enterprises/{enterpriseId}/device_pinners">client.devicePinners.<a href="./Sources/Managers/DevicePinners/DevicePinnersManager.swift">getEnterpriseDevicePinners</a>(enterpriseId, queryParams?, headers?) -> DevicePinners</code>

# Terms of services

Examples: [docs/TermsOfServices.md](docs/TermsOfServices.md)

Methods:

- <code title="get /2.0/terms_of_services">client.termsOfServices.<a href="./Sources/Managers/TermsOfServices/TermsOfServicesManager.swift">getTermsOfService</a>(queryParams?, headers?) -> TermsOfServices</code>
- <code title="post /2.0/terms_of_services">client.termsOfServices.<a href="./Sources/Managers/TermsOfServices/TermsOfServicesManager.swift">createTermsOfService</a>(requestBody, headers?) -> TermsOfService</code>
- <code title="get /2.0/terms_of_services/{termsOfServiceId}">client.termsOfServices.<a href="./Sources/Managers/TermsOfServices/TermsOfServicesManager.swift">getTermsOfServiceById</a>(termsOfServiceId, headers?) -> TermsOfService</code>
- <code title="put /2.0/terms_of_services/{termsOfServiceId}">client.termsOfServices.<a href="./Sources/Managers/TermsOfServices/TermsOfServicesManager.swift">updateTermsOfServiceById</a>(termsOfServiceId, requestBody, headers?) -> TermsOfService</code>

# Terms of service user statuses

Examples: [docs/TermsOfServiceUserStatuses.md](docs/TermsOfServiceUserStatuses.md)

Methods:

- <code title="get /2.0/terms_of_service_user_statuses">client.termsOfServiceUserStatuses.<a href="./Sources/Managers/TermsOfServiceUserStatuses/TermsOfServiceUserStatusesManager.swift">getTermsOfServiceUserStatuses</a>(queryParams, headers?) -> TermsOfServiceUserStatuses</code>
- <code title="post /2.0/terms_of_service_user_statuses">client.termsOfServiceUserStatuses.<a href="./Sources/Managers/TermsOfServiceUserStatuses/TermsOfServiceUserStatusesManager.swift">createTermsOfServiceStatusForUser</a>(requestBody, headers?) -> TermsOfServiceUserStatus</code>
- <code title="put /2.0/terms_of_service_user_statuses/{termsOfServiceUserStatusId}">client.termsOfServiceUserStatuses.<a href="./Sources/Managers/TermsOfServiceUserStatuses/TermsOfServiceUserStatusesManager.swift">updateTermsOfServiceStatusForUserById</a>(termsOfServiceUserStatusId, requestBody, headers?) -> TermsOfServiceUserStatus</code>

# Collaboration allowlist entries

Examples: [docs/CollaborationAllowlistEntries.md](docs/CollaborationAllowlistEntries.md)

Methods:

- <code title="get /2.0/collaboration_whitelist_entries">client.collaborationAllowlistEntries.<a href="./Sources/Managers/CollaborationAllowlistEntries/CollaborationAllowlistEntriesManager.swift">getCollaborationWhitelistEntries</a>(queryParams?, headers?) -> CollaborationAllowlistEntries</code>
- <code title="post /2.0/collaboration_whitelist_entries">client.collaborationAllowlistEntries.<a href="./Sources/Managers/CollaborationAllowlistEntries/CollaborationAllowlistEntriesManager.swift">createCollaborationWhitelistEntry</a>(requestBody, headers?) -> CollaborationAllowlistEntry</code>
- <code title="get /2.0/collaboration_whitelist_entries/{collaborationWhitelistEntryId}">client.collaborationAllowlistEntries.<a href="./Sources/Managers/CollaborationAllowlistEntries/CollaborationAllowlistEntriesManager.swift">getCollaborationWhitelistEntryById</a>(collaborationWhitelistEntryId, headers?) -> CollaborationAllowlistEntry</code>
- <code title="delete /2.0/collaboration_whitelist_entries/{collaborationWhitelistEntryId}">client.collaborationAllowlistEntries.<a href="./Sources/Managers/CollaborationAllowlistEntries/CollaborationAllowlistEntriesManager.swift">deleteCollaborationWhitelistEntryById</a>(collaborationWhitelistEntryId, headers?) -> Void</code>

# Collaboration allowlist exempt targets

Examples: [docs/CollaborationAllowlistExemptTargets.md](docs/CollaborationAllowlistExemptTargets.md)

Methods:

- <code title="get /2.0/collaboration_whitelist_exempt_targets">client.collaborationAllowlistExemptTargets.<a href="./Sources/Managers/CollaborationAllowlistExemptTargets/CollaborationAllowlistExemptTargetsManager.swift">getCollaborationWhitelistExemptTargets</a>(queryParams?, headers?) -> CollaborationAllowlistExemptTargets</code>
- <code title="post /2.0/collaboration_whitelist_exempt_targets">client.collaborationAllowlistExemptTargets.<a href="./Sources/Managers/CollaborationAllowlistExemptTargets/CollaborationAllowlistExemptTargetsManager.swift">createCollaborationWhitelistExemptTarget</a>(requestBody, headers?) -> CollaborationAllowlistExemptTarget</code>
- <code title="get /2.0/collaboration_whitelist_exempt_targets/{collaborationWhitelistExemptTargetId}">client.collaborationAllowlistExemptTargets.<a href="./Sources/Managers/CollaborationAllowlistExemptTargets/CollaborationAllowlistExemptTargetsManager.swift">getCollaborationWhitelistExemptTargetById</a>(collaborationWhitelistExemptTargetId, headers?) -> CollaborationAllowlistExemptTarget</code>
- <code title="delete /2.0/collaboration_whitelist_exempt_targets/{collaborationWhitelistExemptTargetId}">client.collaborationAllowlistExemptTargets.<a href="./Sources/Managers/CollaborationAllowlistExemptTargets/CollaborationAllowlistExemptTargetsManager.swift">deleteCollaborationWhitelistExemptTargetById</a>(collaborationWhitelistExemptTargetId, headers?) -> Void</code>

# Storage policies

Examples: [docs/StoragePolicies.md](docs/StoragePolicies.md)

Methods:

- <code title="get /2.0/storage_policies">client.storagePolicies.<a href="./Sources/Managers/StoragePolicies/StoragePoliciesManager.swift">getStoragePolicies</a>(queryParams?, headers?) -> StoragePolicies</code>
- <code title="get /2.0/storage_policies/{storagePolicyId}">client.storagePolicies.<a href="./Sources/Managers/StoragePolicies/StoragePoliciesManager.swift">getStoragePolicyById</a>(storagePolicyId, headers?) -> StoragePolicy</code>

# Storage policy assignments

Examples: [docs/StoragePolicyAssignments.md](docs/StoragePolicyAssignments.md)

Methods:

- <code title="get /2.0/storage_policy_assignments">client.storagePolicyAssignments.<a href="./Sources/Managers/StoragePolicyAssignments/StoragePolicyAssignmentsManager.swift">getStoragePolicyAssignments</a>(queryParams, headers?) -> StoragePolicyAssignments</code>
- <code title="post /2.0/storage_policy_assignments">client.storagePolicyAssignments.<a href="./Sources/Managers/StoragePolicyAssignments/StoragePolicyAssignmentsManager.swift">createStoragePolicyAssignment</a>(requestBody, headers?) -> StoragePolicyAssignment</code>
- <code title="get /2.0/storage_policy_assignments/{storagePolicyAssignmentId}">client.storagePolicyAssignments.<a href="./Sources/Managers/StoragePolicyAssignments/StoragePolicyAssignmentsManager.swift">getStoragePolicyAssignmentById</a>(storagePolicyAssignmentId, headers?) -> StoragePolicyAssignment</code>
- <code title="put /2.0/storage_policy_assignments/{storagePolicyAssignmentId}">client.storagePolicyAssignments.<a href="./Sources/Managers/StoragePolicyAssignments/StoragePolicyAssignmentsManager.swift">updateStoragePolicyAssignmentById</a>(storagePolicyAssignmentId, requestBody, headers?) -> StoragePolicyAssignment</code>
- <code title="delete /2.0/storage_policy_assignments/{storagePolicyAssignmentId}">client.storagePolicyAssignments.<a href="./Sources/Managers/StoragePolicyAssignments/StoragePolicyAssignmentsManager.swift">deleteStoragePolicyAssignmentById</a>(storagePolicyAssignmentId, headers?) -> Void</code>

# Zip downloads

Examples: [docs/ZipDownloads.md](docs/ZipDownloads.md)

Methods:

- <code title="post /2.0/zip_downloads">client.zipDownloads.<a href="./Sources/Managers/ZipDownloads/ZipDownloadsManager.swift">createZipDownload</a>(requestBody, headers?) -> ZipDownload</code>
- <code>client.zipDownloads.<a href="./Sources/Managers/ZipDownloads/ZipDownloadsManager.swift">getZipDownloadContent</a>(downloadUrl, downloadDestinationUrl, headers?) -> URL?</code>
- <code>client.zipDownloads.<a href="./Sources/Managers/ZipDownloads/ZipDownloadsManager.swift">getZipDownloadStatus</a>(statusUrl, headers?) -> ZipDownloadStatus</code>
- <code>client.zipDownloads.<a href="./Sources/Managers/ZipDownloads/ZipDownloadsManager.swift">downloadZip</a>(requestBody, downloadDestinationUrl, headers?) -> URL?</code>

# Sign requests

Examples: [docs/SignRequests.md](docs/SignRequests.md)

Methods:

- <code title="post /2.0/sign_requests/{signRequestId}/cancel">client.signRequests.<a href="./Sources/Managers/SignRequests/SignRequestsManager.swift">cancelSignRequest</a>(signRequestId, headers?) -> SignRequest</code>
- <code title="post /2.0/sign_requests/{signRequestId}/resend">client.signRequests.<a href="./Sources/Managers/SignRequests/SignRequestsManager.swift">resendSignRequest</a>(signRequestId, headers?) -> Void</code>
- <code title="get /2.0/sign_requests/{signRequestId}">client.signRequests.<a href="./Sources/Managers/SignRequests/SignRequestsManager.swift">getSignRequestById</a>(signRequestId, headers?) -> SignRequest</code>
- <code title="get /2.0/sign_requests">client.signRequests.<a href="./Sources/Managers/SignRequests/SignRequestsManager.swift">getSignRequests</a>(queryParams?, headers?) -> SignRequests</code>
- <code title="post /2.0/sign_requests">client.signRequests.<a href="./Sources/Managers/SignRequests/SignRequestsManager.swift">createSignRequest</a>(requestBody, headers?) -> SignRequest</code>

# Workflows

Examples: [docs/Workflows.md](docs/Workflows.md)

Methods:

- <code title="get /2.0/workflows">client.workflows.<a href="./Sources/Managers/Workflows/WorkflowsManager.swift">getWorkflows</a>(queryParams, headers?) -> Workflows</code>
- <code title="post /2.0/workflows/{workflowId}/start">client.workflows.<a href="./Sources/Managers/Workflows/WorkflowsManager.swift">startWorkflow</a>(workflowId, requestBody, headers?) -> Void</code>

# Sign templates

Examples: [docs/SignTemplates.md](docs/SignTemplates.md)

Methods:

- <code title="get /2.0/sign_templates">client.signTemplates.<a href="./Sources/Managers/SignTemplates/SignTemplatesManager.swift">getSignTemplates</a>(queryParams?, headers?) -> SignTemplates</code>
- <code title="get /2.0/sign_templates/{templateId}">client.signTemplates.<a href="./Sources/Managers/SignTemplates/SignTemplatesManager.swift">getSignTemplateById</a>(templateId, headers?) -> SignTemplate</code>

# Integration mappings

Examples: [docs/IntegrationMappings.md](docs/IntegrationMappings.md)

Methods:

- <code title="get /2.0/integration_mappings/slack">client.integrationMappings.<a href="./Sources/Managers/IntegrationMappings/IntegrationMappingsManager.swift">getSlackIntegrationMapping</a>(queryParams?, headers?) -> IntegrationMappings</code>
- <code title="post /2.0/integration_mappings/slack">client.integrationMappings.<a href="./Sources/Managers/IntegrationMappings/IntegrationMappingsManager.swift">createSlackIntegrationMapping</a>(requestBody, headers?) -> IntegrationMapping</code>
- <code title="put /2.0/integration_mappings/slack/{integrationMappingId}">client.integrationMappings.<a href="./Sources/Managers/IntegrationMappings/IntegrationMappingsManager.swift">updateSlackIntegrationMappingById</a>(integrationMappingId, requestBody?, headers?) -> IntegrationMapping</code>
- <code title="delete /2.0/integration_mappings/slack/{integrationMappingId}">client.integrationMappings.<a href="./Sources/Managers/IntegrationMappings/IntegrationMappingsManager.swift">deleteSlackIntegrationMappingById</a>(integrationMappingId, headers?) -> Void</code>
- <code title="get /2.0/integration_mappings/teams">client.integrationMappings.<a href="./Sources/Managers/IntegrationMappings/IntegrationMappingsManager.swift">getTeamsIntegrationMapping</a>(queryParams?, headers?) -> IntegrationMappingsTeams</code>
- <code title="post /2.0/integration_mappings/teams">client.integrationMappings.<a href="./Sources/Managers/IntegrationMappings/IntegrationMappingsManager.swift">createTeamsIntegrationMapping</a>(requestBody, headers?) -> IntegrationMappingTeams</code>
- <code title="put /2.0/integration_mappings/teams/{integrationMappingId}">client.integrationMappings.<a href="./Sources/Managers/IntegrationMappings/IntegrationMappingsManager.swift">updateTeamsIntegrationMappingById</a>(integrationMappingId, requestBody?, headers?) -> IntegrationMappingTeams</code>
- <code title="delete /2.0/integration_mappings/teams/{integrationMappingId}">client.integrationMappings.<a href="./Sources/Managers/IntegrationMappings/IntegrationMappingsManager.swift">deleteTeamsIntegrationMappingById</a>(integrationMappingId, headers?) -> Void</code>

# Ai

Examples: [docs/Ai.md](docs/Ai.md)

Methods:

- <code title="post /2.0/ai/ask">client.ai.<a href="./Sources/Managers/Ai/AiManager.swift">createAiAsk</a>(requestBody, headers?) -> AiResponseFull?</code>
- <code title="post /2.0/ai/text_gen">client.ai.<a href="./Sources/Managers/Ai/AiManager.swift">createAiTextGen</a>(requestBody, headers?) -> AiResponse</code>
- <code title="get /2.0/ai_agent_default">client.ai.<a href="./Sources/Managers/Ai/AiManager.swift">getAiAgentDefaultConfig</a>(queryParams, headers?) -> AiAgentAskOrAiAgentExtractOrAiAgentExtractStructuredOrAiAgentTextGen</code>
- <code title="post /2.0/ai/extract">client.ai.<a href="./Sources/Managers/Ai/AiManager.swift">createAiExtract</a>(requestBody, headers?) -> AiResponse</code>
- <code title="post /2.0/ai/extract_structured">client.ai.<a href="./Sources/Managers/Ai/AiManager.swift">createAiExtractStructured</a>(requestBody, headers?) -> AiExtractStructuredResponse</code>

# Ai studio

Examples: [docs/AiStudio.md](docs/AiStudio.md)

Methods:

- <code title="get /2.0/ai_agents">client.aiStudio.<a href="./Sources/Managers/AiStudio/AiStudioManager.swift">getAiAgents</a>(queryParams?, headers?) -> AiMultipleAgentResponse</code>
- <code title="post /2.0/ai_agents">client.aiStudio.<a href="./Sources/Managers/AiStudio/AiStudioManager.swift">createAiAgent</a>(requestBody, headers?) -> AiSingleAgentResponseFull</code>
- <code title="put /2.0/ai_agents/{agentId}">client.aiStudio.<a href="./Sources/Managers/AiStudio/AiStudioManager.swift">updateAiAgentById</a>(agentId, requestBody, headers?) -> AiSingleAgentResponseFull</code>
- <code title="get /2.0/ai_agents/{agentId}">client.aiStudio.<a href="./Sources/Managers/AiStudio/AiStudioManager.swift">getAiAgentById</a>(agentId, queryParams?, headers?) -> AiSingleAgentResponseFull</code>
- <code title="delete /2.0/ai_agents/{agentId}">client.aiStudio.<a href="./Sources/Managers/AiStudio/AiStudioManager.swift">deleteAiAgentById</a>(agentId, headers?) -> Void</code>

# Docgen template

Examples: [docs/DocgenTemplate.md](docs/DocgenTemplate.md)

Methods:

- <code title="post /2.0/docgen_templates">client.docgenTemplate.<a href="./Sources/Managers/DocgenTemplate/DocgenTemplateManager.swift">createDocgenTemplateV2025R0</a>(requestBody, headers?) -> DocGenTemplateBaseV2025R0</code>
- <code title="get /2.0/docgen_templates">client.docgenTemplate.<a href="./Sources/Managers/DocgenTemplate/DocgenTemplateManager.swift">getDocgenTemplatesV2025R0</a>(queryParams?, headers?) -> DocGenTemplatesV2025R0</code>
- <code title="delete /2.0/docgen_templates/{templateId}">client.docgenTemplate.<a href="./Sources/Managers/DocgenTemplate/DocgenTemplateManager.swift">deleteDocgenTemplateByIdV2025R0</a>(templateId, headers?) -> Void</code>
- <code title="get /2.0/docgen_templates/{templateId}">client.docgenTemplate.<a href="./Sources/Managers/DocgenTemplate/DocgenTemplateManager.swift">getDocgenTemplateByIdV2025R0</a>(templateId, headers?) -> DocGenTemplateV2025R0</code>
- <code title="get /2.0/docgen_templates/{templateId}/tags">client.docgenTemplate.<a href="./Sources/Managers/DocgenTemplate/DocgenTemplateManager.swift">getDocgenTemplateTagsV2025R0</a>(templateId, queryParams?, headers?) -> DocGenTagsV2025R0</code>
- <code title="get /2.0/docgen_template_jobs/{templateId}">client.docgenTemplate.<a href="./Sources/Managers/DocgenTemplate/DocgenTemplateManager.swift">getDocgenTemplateJobByIdV2025R0</a>(templateId, queryParams?, headers?) -> DocGenJobsV2025R0</code>

# Docgen

Examples: [docs/Docgen.md](docs/Docgen.md)

Methods:

- <code title="get /2.0/docgen_jobs/{jobId}">client.docgen.<a href="./Sources/Managers/Docgen/DocgenManager.swift">getDocgenJobByIdV2025R0</a>(jobId, headers?) -> DocGenJobV2025R0</code>
- <code title="get /2.0/docgen_jobs">client.docgen.<a href="./Sources/Managers/Docgen/DocgenManager.swift">getDocgenJobsV2025R0</a>(queryParams?, headers?) -> DocGenJobsFullV2025R0</code>
- <code title="get /2.0/docgen_batch_jobs/{batchId}">client.docgen.<a href="./Sources/Managers/Docgen/DocgenManager.swift">getDocgenBatchJobByIdV2025R0</a>(batchId, queryParams?, headers?) -> DocGenJobsV2025R0</code>
- <code title="post /2.0/docgen_batches">client.docgen.<a href="./Sources/Managers/Docgen/DocgenManager.swift">createDocgenBatchV2025R0</a>(requestBody, headers?) -> DocGenBatchBaseV2025R0</code>

# Hubs

Examples: [docs/Hubs.md](docs/Hubs.md)

Methods:

- <code title="get /2.0/hubs">client.hubs.<a href="./Sources/Managers/Hubs/HubsManager.swift">getHubsV2025R0</a>(queryParams?, headers?) -> HubsV2025R0</code>
- <code title="post /2.0/hubs">client.hubs.<a href="./Sources/Managers/Hubs/HubsManager.swift">createHubV2025R0</a>(requestBody, headers?) -> HubV2025R0</code>
- <code title="get /2.0/enterprise_hubs">client.hubs.<a href="./Sources/Managers/Hubs/HubsManager.swift">getEnterpriseHubsV2025R0</a>(queryParams?, headers?) -> HubsV2025R0</code>
- <code title="get /2.0/hubs/{hubId}">client.hubs.<a href="./Sources/Managers/Hubs/HubsManager.swift">getHubByIdV2025R0</a>(hubId, headers?) -> HubV2025R0</code>
- <code title="put /2.0/hubs/{hubId}">client.hubs.<a href="./Sources/Managers/Hubs/HubsManager.swift">updateHubByIdV2025R0</a>(hubId, requestBody, headers?) -> HubV2025R0</code>
- <code title="delete /2.0/hubs/{hubId}">client.hubs.<a href="./Sources/Managers/Hubs/HubsManager.swift">deleteHubByIdV2025R0</a>(hubId, headers?) -> Void</code>
- <code title="post /2.0/hubs/{hubId}/copy">client.hubs.<a href="./Sources/Managers/Hubs/HubsManager.swift">copyHubV2025R0</a>(hubId, requestBody, headers?) -> HubV2025R0</code>

# Hub collaborations

Examples: [docs/HubCollaborations.md](docs/HubCollaborations.md)

Methods:

- <code title="get /2.0/hub_collaborations">client.hubCollaborations.<a href="./Sources/Managers/HubCollaborations/HubCollaborationsManager.swift">getHubCollaborationsV2025R0</a>(queryParams, headers?) -> HubCollaborationsV2025R0</code>
- <code title="post /2.0/hub_collaborations">client.hubCollaborations.<a href="./Sources/Managers/HubCollaborations/HubCollaborationsManager.swift">createHubCollaborationV2025R0</a>(requestBody, headers?) -> HubCollaborationV2025R0</code>
- <code title="get /2.0/hub_collaborations/{hubCollaborationId}">client.hubCollaborations.<a href="./Sources/Managers/HubCollaborations/HubCollaborationsManager.swift">getHubCollaborationByIdV2025R0</a>(hubCollaborationId, headers?) -> HubCollaborationV2025R0</code>
- <code title="put /2.0/hub_collaborations/{hubCollaborationId}">client.hubCollaborations.<a href="./Sources/Managers/HubCollaborations/HubCollaborationsManager.swift">updateHubCollaborationByIdV2025R0</a>(hubCollaborationId, requestBody, headers?) -> HubCollaborationV2025R0</code>
- <code title="delete /2.0/hub_collaborations/{hubCollaborationId}">client.hubCollaborations.<a href="./Sources/Managers/HubCollaborations/HubCollaborationsManager.swift">deleteHubCollaborationByIdV2025R0</a>(hubCollaborationId, headers?) -> Void</code>

# Hub items

Examples: [docs/HubItems.md](docs/HubItems.md)

Methods:

- <code title="get /2.0/hub_items">client.hubItems.<a href="./Sources/Managers/HubItems/HubItemsManager.swift">getHubItemsV2025R0</a>(queryParams, headers?) -> HubItemsV2025R0</code>
- <code title="post /2.0/hubs/{hubId}/manage_items">client.hubItems.<a href="./Sources/Managers/HubItems/HubItemsManager.swift">manageHubItemsV2025R0</a>(hubId, requestBody, headers?) -> HubItemsManageResponseV2025R0</code>

# Shield lists

Examples: [docs/ShieldLists.md](docs/ShieldLists.md)

Methods:

- <code title="get /2.0/shield_lists">client.shieldLists.<a href="./Sources/Managers/ShieldLists/ShieldListsManager.swift">getShieldListsV2025R0</a>(headers?) -> ShieldListsV2025R0</code>
- <code title="post /2.0/shield_lists">client.shieldLists.<a href="./Sources/Managers/ShieldLists/ShieldListsManager.swift">createShieldListV2025R0</a>(requestBody, headers?) -> ShieldListV2025R0</code>
- <code title="get /2.0/shield_lists/{shieldListId}">client.shieldLists.<a href="./Sources/Managers/ShieldLists/ShieldListsManager.swift">getShieldListByIdV2025R0</a>(shieldListId, headers?) -> ShieldListV2025R0</code>
- <code title="delete /2.0/shield_lists/{shieldListId}">client.shieldLists.<a href="./Sources/Managers/ShieldLists/ShieldListsManager.swift">deleteShieldListByIdV2025R0</a>(shieldListId, headers?) -> Void</code>
- <code title="put /2.0/shield_lists/{shieldListId}">client.shieldLists.<a href="./Sources/Managers/ShieldLists/ShieldListsManager.swift">updateShieldListByIdV2025R0</a>(shieldListId, requestBody, headers?) -> ShieldListV2025R0</code>

# Archives

Examples: [docs/Archives.md](docs/Archives.md)

Methods:

- <code title="get /2.0/archives">client.archives.<a href="./Sources/Managers/Archives/ArchivesManager.swift">getArchivesV2025R0</a>(queryParams?, headers?) -> ArchivesV2025R0</code>
- <code title="post /2.0/archives">client.archives.<a href="./Sources/Managers/Archives/ArchivesManager.swift">createArchiveV2025R0</a>(requestBody, headers?) -> ArchiveV2025R0</code>
- <code title="delete /2.0/archives/{archiveId}">client.archives.<a href="./Sources/Managers/Archives/ArchivesManager.swift">deleteArchiveByIdV2025R0</a>(archiveId, headers?) -> Void</code>
