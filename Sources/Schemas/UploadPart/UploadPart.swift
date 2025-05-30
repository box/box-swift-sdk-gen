import Foundation

/// The representation of an upload
/// session chunk.
public class UploadPart: UploadPartMini {
    private enum CodingKeys: String, CodingKey {
        case sha1
    }

    /// Internal backing store for rawData. Used to store raw dictionary data associated with the instance.
    private var _rawData: [String: Any]?

    /// Returns the raw dictionary data associated with the instance. This is a read-only property.
    public override var rawData: [String: Any]? {
        return _rawData
    }


    /// The SHA1 hash of the chunk.
    public let sha1: String?

    /// Initializer for a UploadPart.
    ///
    /// - Parameters:
    ///   - partId: The unique ID of the chunk.
    ///   - offset: The offset of the chunk within the file
    ///     in bytes. The lower bound of the position
    ///     of the chunk within the file.
    ///   - size: The size of the chunk in bytes.
    ///   - sha1: The SHA1 hash of the chunk.
    public init(partId: String? = nil, offset: Int64? = nil, size: Int64? = nil, sha1: String? = nil) {
        self.sha1 = sha1

        super.init(partId: partId, offset: offset, size: size)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sha1 = try container.decodeIfPresent(String.self, forKey: .sha1)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sha1, forKey: .sha1)
        try super.encode(to: encoder)
    }

    /// Sets the raw JSON data.
    ///
    /// - Parameters:
    ///   - rawData: A dictionary containing the raw JSON data
    override func setRawData(rawData: [String: Any]?) {
        self._rawData = rawData
    }

    /// Gets the raw JSON data
    /// - Returns: The `[String: Any]?`.
    override func getRawData() -> [String: Any]? {
        return self._rawData
    }

}
