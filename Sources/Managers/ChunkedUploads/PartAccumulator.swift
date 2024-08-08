import Foundation

public class PartAccumulator {
    public let lastIndex: Int

    public let parts: [UploadPart]

    public let fileSize: Int64

    public let uploadPartUrl: String

    public let fileHash: Hash

    public init(lastIndex: Int, parts: [UploadPart], fileSize: Int64, uploadPartUrl: String, fileHash: Hash) {
        self.lastIndex = lastIndex
        self.parts = parts
        self.fileSize = fileSize
        self.uploadPartUrl = uploadPartUrl
        self.fileHash = fileHash
    }

}
