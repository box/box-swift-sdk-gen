import Foundation

public class UpdateWebhookByIdRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case target
        case address
        case triggers
    }

    /// The item that will trigger the webhook
    public let target: UpdateWebhookByIdRequestBodyArgTargetField?

    /// The URL that is notified by this webhook
    public let address: String?

    /// An array of event names that this webhook is
    /// to be triggered for
    public let triggers: [UpdateWebhookByIdRequestBodyArgTriggersField]?

    /// Initializer for a UpdateWebhookByIdRequestBodyArg.
    ///
    /// - Parameters:
    ///   - target: The item that will trigger the webhook
    ///   - address: The URL that is notified by this webhook
    ///   - triggers: An array of event names that this webhook is
    ///     to be triggered for
    public init(target: UpdateWebhookByIdRequestBodyArgTargetField? = nil, address: String? = nil, triggers: [UpdateWebhookByIdRequestBodyArgTriggersField]? = nil) {
        self.target = target
        self.address = address
        self.triggers = triggers
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        target = try container.decodeIfPresent(UpdateWebhookByIdRequestBodyArgTargetField.self, forKey: .target)
        address = try container.decodeIfPresent(String.self, forKey: .address)
        triggers = try container.decodeIfPresent([UpdateWebhookByIdRequestBodyArgTriggersField].self, forKey: .triggers)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(target, forKey: .target)
        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(triggers, forKey: .triggers)
    }

}
