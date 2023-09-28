import Foundation

public class CreateCommentRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case message
        case taggedMessage = "tagged_message"
        case item
    }

    /// The text of the comment.
    /// 
    /// To mention a user, use the `tagged_message`
    /// parameter instead.,
    public let message: String
    /// The text of the comment, including `@[user_id:name]`
    /// somewhere in the message to mention another user, which
    /// will send them an email notification, letting them know
    /// they have been mentioned.
    /// 
    /// The `user_id` is the target user's ID, where the `name`
    /// can be any custom phrase. In the Box UI this name will
    /// link to the user's profile.
    /// 
    /// If you are not mentioning another user, use `message`
    /// instead.,
    public let taggedMessage: String?
    /// The item to attach the comment to.,
    public let item: CreateCommentRequestBodyArgItemField

    /// Initializer for a CreateCommentRequestBodyArg.
    ///
    /// - Parameters:
    ///   - message: The text of the comment.
    ///     
    ///     To mention a user, use the `tagged_message`
    ///     parameter instead.
    ///   - taggedMessage: The text of the comment, including `@[user_id:name]`
    ///     somewhere in the message to mention another user, which
    ///     will send them an email notification, letting them know
    ///     they have been mentioned.
    ///     
    ///     The `user_id` is the target user's ID, where the `name`
    ///     can be any custom phrase. In the Box UI this name will
    ///     link to the user's profile.
    ///     
    ///     If you are not mentioning another user, use `message`
    ///     instead.
    ///   - item: The item to attach the comment to.
    public init(message: String, taggedMessage: String? = nil, item: CreateCommentRequestBodyArgItemField) {
        self.message = message
        self.taggedMessage = taggedMessage
        self.item = item
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decode(String.self, forKey: .message)
        taggedMessage = try container.decodeIfPresent(String.self, forKey: .taggedMessage)
        item = try container.decode(CreateCommentRequestBodyArgItemField.self, forKey: .item)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(message, forKey: .message)
        try container.encodeIfPresent(taggedMessage, forKey: .taggedMessage)
        try container.encode(item, forKey: .item)
    }
}
