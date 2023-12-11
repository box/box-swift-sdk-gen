import Foundation

public class FileFullRepresentationsFieldEntriesFieldStatusField: Codable {
    private enum CodingKeys: String, CodingKey {
        case state
    }

    /// The status of the representation.
    /// 
    /// * `success` defines the representation as ready to be viewed.
    /// * `viewable` defines a video to be ready for viewing.
    /// * `pending` defines the representation as to be generated. Retry
    ///   this endpoint to re-check the status.
    /// * `none` defines that the representation will be created when
    ///   requested. Request the URL defined in the `info` object to
    ///   trigger this generation.
    public let state: FileFullRepresentationsFieldEntriesFieldStatusFieldStateField?

    /// Initializer for a FileFullRepresentationsFieldEntriesFieldStatusField.
    ///
    /// - Parameters:
    ///   - state: The status of the representation.
    ///     
    ///     * `success` defines the representation as ready to be viewed.
    ///     * `viewable` defines a video to be ready for viewing.
    ///     * `pending` defines the representation as to be generated. Retry
    ///       this endpoint to re-check the status.
    ///     * `none` defines that the representation will be created when
    ///       requested. Request the URL defined in the `info` object to
    ///       trigger this generation.
    public init(state: FileFullRepresentationsFieldEntriesFieldStatusFieldStateField? = nil) {
        self.state = state
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        state = try container.decodeIfPresent(FileFullRepresentationsFieldEntriesFieldStatusFieldStateField.self, forKey: .state)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(state, forKey: .state)
    }

}
