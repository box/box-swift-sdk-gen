import Foundation

/// A mini representation of a file version, used when
/// nested under another resource.
public class FolderMini: FolderBase {
    private enum CodingKeys: String, CodingKey {
        case name
        case sequenceId = "sequence_id"
    }

    /// The name of the folder.
    public let name: String?
    /// A numeric identifier that represents the most recent user event
    /// that has been applied to this item.
    /// 
    /// This can be used in combination with the `GET /events`-endpoint
    /// to filter out user events that would have occurred before this
    /// identifier was read.
    /// 
    /// An example would be where a Box Drive-like application
    /// would fetch an item via the API, and then listen to incoming
    /// user events for changes to the item. The application would
    /// ignore any user events where the `sequence_id` in the event
    /// is smaller than or equal to the `sequence_id` in the originally
    /// fetched resource.
    public let sequenceId: String?

    /// Initializer for a FolderMini.
    ///
    /// - Parameters:
    ///   - id: The unique identifier that represent a folder.
    ///     
    ///     The ID for any folder can be determined
    ///     by visiting a folder in the web application
    ///     and copying the ID from the URL. For example,
    ///     for the URL `https://*.app.box.com/folders/123`
    ///     the `folder_id` is `123`.
    ///   - type: `folder`
    ///   - etag: The HTTP `etag` of this folder. This can be used within some API
    ///     endpoints in the `If-Match` and `If-None-Match` headers to only
    ///     perform changes on the folder if (no) changes have happened.
    ///   - name: The name of the folder.
    ///   - sequenceId: A numeric identifier that represents the most recent user event
    ///     that has been applied to this item.
    ///     
    ///     This can be used in combination with the `GET /events`-endpoint
    ///     to filter out user events that would have occurred before this
    ///     identifier was read.
    ///     
    ///     An example would be where a Box Drive-like application
    ///     would fetch an item via the API, and then listen to incoming
    ///     user events for changes to the item. The application would
    ///     ignore any user events where the `sequence_id` in the event
    ///     is smaller than or equal to the `sequence_id` in the originally
    ///     fetched resource.
    public init(id: String, type: FolderBaseTypeField, etag: String? = nil, name: String? = nil, sequenceId: String? = nil) {
        self.name = name
        self.sequenceId = sequenceId
        super.init(id: id, type: type, etag: etag)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        sequenceId = try container.decodeIfPresent(String.self, forKey: .sequenceId)
        try super.init(from:decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(sequenceId, forKey: .sequenceId)
        try super.encode(to: encoder)
    }
}
