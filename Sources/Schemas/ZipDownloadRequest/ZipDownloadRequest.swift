import Foundation

/// A request to create a `zip` archive to download.
public class ZipDownloadRequest: Codable, RawJSONReadable {
    private enum CodingKeys: String, CodingKey {
        case items
        case downloadFileName = "download_file_name"
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public var rawData: [String: Any]? {
        return _rawData
    }


    /// A list of items to add to the `zip` archive. These can
    /// be folders or files.
    public let items: [ZipDownloadRequestItemsField]

    /// The optional name of the `zip` archive. This name will be appended by the
    /// `.zip` file extension, for example `January Financials.zip`.
    public let downloadFileName: String?

    /// Initializer for a ZipDownloadRequest.
    ///
    /// - Parameters:
    ///   - items: A list of items to add to the `zip` archive. These can
    ///     be folders or files.
    ///   - downloadFileName: The optional name of the `zip` archive. This name will be appended by the
    ///     `.zip` file extension, for example `January Financials.zip`.
    public init(items: [ZipDownloadRequestItemsField], downloadFileName: String? = nil) {
        self.items = items
        self.downloadFileName = downloadFileName
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([ZipDownloadRequestItemsField].self, forKey: .items)
        downloadFileName = try container.decodeIfPresent(String.self, forKey: .downloadFileName)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(items, forKey: .items)
        try container.encodeIfPresent(downloadFileName, forKey: .downloadFileName)
    }

    /// Sets the raw JSON data.
    ///
    /// - Parameters:
    ///   - rawData: A dictionary containing the raw JSON data
    func setRawData(rawData: [String: Any]?) {
        self._rawData = rawData
    }

    /// Gets the raw JSON data
    /// - Returns: The `[String: Any]?`.
    func getRawData() -> [String: Any]? {
        return self._rawData
    }

}
