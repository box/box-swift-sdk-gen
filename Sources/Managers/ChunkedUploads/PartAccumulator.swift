import Foundation

public class PartAccumulator {
    public let lastIndex: Int

    public let parts: [UploadPart]

    public let fileSize: Int64

    public let uploadSessionId: String

    public let fileHash: Hash

    public init(lastIndex: Int, parts: [UploadPart], fileSize: Int64, uploadSessionId: String, fileHash: Hash) {
        self.lastIndex = lastIndex
        self.parts = parts
        self.fileSize = fileSize
        self.uploadSessionId = uploadSessionId
        self.fileHash = fileHash
    }

}
