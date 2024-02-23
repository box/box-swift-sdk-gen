import Foundation

/// Representation of a single multipart form part.
public class MultipartItem {

    /// The name of the multipart item.
    public let partName: String

    /// The content of the part body.
    public let data: SerializedData?

    /// A stream containing the file contents.
    public let fileStream: InputStream?

    /// The name of the file.
    public let fileName: String?

    /// The content type of the part.
    public let contentType: String?

    /// Initialize a multipart.
    ///
    /// - Parameters:
    ///   - partName: The name of the part.
    ///   - body: The content of file part body.
    ///   - fileStream: A stream containing the file contents.
    ///   - fileName: The name of the file.
    ///   - contentType: The content type of the part.
    public init(
        partName: String,
        data: SerializedData? = nil,
        fileStream: InputStream? = nil,
        fileName: String? = nil,
        contentType: String? = nil
    ) {
        self.partName = partName
        self.data = data
        self.fileStream = fileStream
        self.fileName = fileName
        self.contentType = contentType
    }
}
