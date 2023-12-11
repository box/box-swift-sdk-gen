import Foundation

public class TransferOwnedFolderRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case ownedBy = "owned_by"
    }

    /// The user who the folder will be transferred to
    public let ownedBy: TransferOwnedFolderRequestBodyArgOwnedByField

    /// Initializer for a TransferOwnedFolderRequestBodyArg.
    ///
    /// - Parameters:
    ///   - ownedBy: The user who the folder will be transferred to
    public init(ownedBy: TransferOwnedFolderRequestBodyArgOwnedByField) {
        self.ownedBy = ownedBy
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ownedBy = try container.decode(TransferOwnedFolderRequestBodyArgOwnedByField.self, forKey: .ownedBy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ownedBy, forKey: .ownedBy)
    }

}
