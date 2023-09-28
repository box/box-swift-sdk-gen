import Foundation

public class GetFileThumbnailByIdQueryParamsArg {
    /// The minimum height of the thumbnail,
    public let minHeight: Int?
    /// The minimum width of the thumbnail,
    public let minWidth: Int?
    /// The maximum height of the thumbnail,
    public let maxHeight: Int?
    /// The maximum width of the thumbnail,
    public let maxWidth: Int?

    /// Initializer for a GetFileThumbnailByIdQueryParamsArg.
    ///
    /// - Parameters:
    ///   - minHeight: The minimum height of the thumbnail
    ///   - minWidth: The minimum width of the thumbnail
    ///   - maxHeight: The maximum height of the thumbnail
    ///   - maxWidth: The maximum width of the thumbnail
    public init(minHeight: Int? = nil, minWidth: Int? = nil, maxHeight: Int? = nil, maxWidth: Int? = nil) {
        self.minHeight = minHeight
        self.minWidth = minWidth
        self.maxHeight = maxHeight
        self.maxWidth = maxWidth
    }

}
