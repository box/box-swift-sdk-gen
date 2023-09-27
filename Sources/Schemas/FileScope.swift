import Foundation

public class FileScope: Codable {
    private enum CodingKeys: String, CodingKey {
        case scope
        case object
    }

    /// The file scopes for the file access,
    public let scope: FileScopeScopeField?
    public let object: FileMini?

    /// Initializer for a FileScope.
    ///
    /// - Parameters:
    ///   - scope: The file scopes for the file access
    ///   - object: FileMini?
    public init(scope: FileScopeScopeField? = nil, object: FileMini? = nil) {
        self.scope = scope
        self.object = object
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        scope = try container.decodeIfPresent(FileScopeScopeField.self, forKey: .scope)
        object = try container.decodeIfPresent(FileMini.self, forKey: .object)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(scope, forKey: .scope)
        try container.encodeIfPresent(object, forKey: .object)
    }
}
