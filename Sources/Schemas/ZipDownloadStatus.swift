import Foundation

public class ZipDownloadStatus: Codable {
    private enum CodingKeys: String, CodingKey {
        case totalFileCount = "total_file_count"
        case downloadedFileCount = "downloaded_file_count"
        case skippedFileCount = "skipped_file_count"
        case skippedFolderCount = "skipped_folder_count"
        case state
    }

    /// The total number of files in the archive.,
    public let totalFileCount: Int?
    /// The number of files that have already been downloaded.,
    public let downloadedFileCount: Int?
    /// The number of files that have been skipped as they could not be
    /// downloaded. In many cases this is due to permission issues that have
    /// surfaced between the creation of the request for the archive and the
    /// archive being downloaded.,
    public let skippedFileCount: Int?
    /// The number of folders that have been skipped as they could not be
    /// downloaded. In many cases this is due to permission issues that have
    /// surfaced between the creation of the request for the archive and the
    /// archive being downloaded.,
    public let skippedFolderCount: Int?
    /// The state of the archive being downloaded.,
    public let state: ZipDownloadStatusStateField?

    /// Initializer for a ZipDownloadStatus.
    ///
    /// - Parameters:
    ///   - totalFileCount: The total number of files in the archive.
    ///   - downloadedFileCount: The number of files that have already been downloaded.
    ///   - skippedFileCount: The number of files that have been skipped as they could not be
    ///     downloaded. In many cases this is due to permission issues that have
    ///     surfaced between the creation of the request for the archive and the
    ///     archive being downloaded.
    ///   - skippedFolderCount: The number of folders that have been skipped as they could not be
    ///     downloaded. In many cases this is due to permission issues that have
    ///     surfaced between the creation of the request for the archive and the
    ///     archive being downloaded.
    ///   - state: The state of the archive being downloaded.
    public init(totalFileCount: Int? = nil, downloadedFileCount: Int? = nil, skippedFileCount: Int? = nil, skippedFolderCount: Int? = nil, state: ZipDownloadStatusStateField? = nil) {
        self.totalFileCount = totalFileCount
        self.downloadedFileCount = downloadedFileCount
        self.skippedFileCount = skippedFileCount
        self.skippedFolderCount = skippedFolderCount
        self.state = state
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalFileCount = try container.decodeIfPresent(Int.self, forKey: .totalFileCount)
        downloadedFileCount = try container.decodeIfPresent(Int.self, forKey: .downloadedFileCount)
        skippedFileCount = try container.decodeIfPresent(Int.self, forKey: .skippedFileCount)
        skippedFolderCount = try container.decodeIfPresent(Int.self, forKey: .skippedFolderCount)
        state = try container.decodeIfPresent(ZipDownloadStatusStateField.self, forKey: .state)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(totalFileCount, forKey: .totalFileCount)
        try container.encodeIfPresent(downloadedFileCount, forKey: .downloadedFileCount)
        try container.encodeIfPresent(skippedFileCount, forKey: .skippedFileCount)
        try container.encodeIfPresent(skippedFolderCount, forKey: .skippedFolderCount)
        try container.encodeIfPresent(state, forKey: .state)
    }
}
