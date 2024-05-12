import Foundation

/// A standard representation of an integration
/// mapping object.
public class IntegrationMapping: IntegrationMappingBase {
    private enum CodingKeys: String, CodingKey {
        case partnerItem = "partner_item"
        case boxItem = "box_item"
        case type
        case isManuallyCreated = "is_manually_created"
        case options
        case createdBy = "created_by"
        case modifiedBy = "modified_by"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
    }

    /// Mapped item object for Slack
    public let partnerItem: IntegrationMappingPartnerItemSlack

    /// The Box folder, to which the object from the
    /// partner app domain (referenced in `partner_item_id`) is mapped
    public let boxItem: FolderMini

    /// Mapping type
    public let type: IntegrationMappingTypeField

    /// Identifies whether the mapping has
    /// been manually set
    /// (as opposed to being automatically created)
    public let isManuallyCreated: Bool?

    /// Integration mapping options for Slack
    public let options: IntegrationMappingSlackOptions?

    /// An object representing the user who
    /// created the integration mapping
    public let createdBy: UserIntegrationMappings?

    /// The user who
    /// last modified the integration mapping
    public let modifiedBy: UserIntegrationMappings?

    /// When the integration mapping object was created
    public let createdAt: String?

    /// When the integration mapping object was last modified
    public let modifiedAt: String?

    /// Initializer for a IntegrationMapping.
    ///
    /// - Parameters:
    ///   - partnerItem: Mapped item object for Slack
    ///   - boxItem: The Box folder, to which the object from the
    ///     partner app domain (referenced in `partner_item_id`) is mapped
    ///   - id: A unique identifier of a folder mapping
    ///     (part of a composite key together
    ///     with `integration_type`)
    ///   - integrationType: Identifies the Box partner app,
    ///     with which the mapping is associated.
    ///     Currently only supports Slack.
    ///     (part of the composite key together with `id`)
    ///   - type: Mapping type
    ///   - isManuallyCreated: Identifies whether the mapping has
    ///     been manually set
    ///     (as opposed to being automatically created)
    ///   - options: Integration mapping options for Slack
    ///   - createdBy: An object representing the user who
    ///     created the integration mapping
    ///   - modifiedBy: The user who
    ///     last modified the integration mapping
    ///   - createdAt: When the integration mapping object was created
    ///   - modifiedAt: When the integration mapping object was last modified
    public init(partnerItem: IntegrationMappingPartnerItemSlack, boxItem: FolderMini, id: String? = nil, integrationType: IntegrationMappingBaseIntegrationTypeField? = nil, type: IntegrationMappingTypeField = IntegrationMappingTypeField.integrationMapping, isManuallyCreated: Bool? = nil, options: IntegrationMappingSlackOptions? = nil, createdBy: UserIntegrationMappings? = nil, modifiedBy: UserIntegrationMappings? = nil, createdAt: String? = nil, modifiedAt: String? = nil) {
        self.partnerItem = partnerItem
        self.boxItem = boxItem
        self.type = type
        self.isManuallyCreated = isManuallyCreated
        self.options = options
        self.createdBy = createdBy
        self.modifiedBy = modifiedBy
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt

        super.init(id: id, integrationType: integrationType)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        partnerItem = try container.decode(IntegrationMappingPartnerItemSlack.self, forKey: .partnerItem)
        boxItem = try container.decode(FolderMini.self, forKey: .boxItem)
        type = try container.decode(IntegrationMappingTypeField.self, forKey: .type)
        isManuallyCreated = try container.decodeIfPresent(Bool.self, forKey: .isManuallyCreated)
        options = try container.decodeIfPresent(IntegrationMappingSlackOptions.self, forKey: .options)
        createdBy = try container.decodeIfPresent(UserIntegrationMappings.self, forKey: .createdBy)
        modifiedBy = try container.decodeIfPresent(UserIntegrationMappings.self, forKey: .modifiedBy)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(partnerItem, forKey: .partnerItem)
        try container.encode(boxItem, forKey: .boxItem)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(isManuallyCreated, forKey: .isManuallyCreated)
        try container.encodeIfPresent(options, forKey: .options)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(modifiedBy, forKey: .modifiedBy)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(modifiedAt, forKey: .modifiedAt)
        try super.encode(to: encoder)
    }

}
