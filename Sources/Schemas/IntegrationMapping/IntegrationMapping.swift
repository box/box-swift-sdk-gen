import Foundation

/// A Slack specific representation of an integration
/// mapping object.
public class IntegrationMapping: IntegrationMappingBase {
    private enum CodingKeys: String, CodingKey {
        case boxItem = "box_item"
        case partnerItem = "partner_item"
        case isManuallyCreated = "is_manually_created"
        case options
        case createdBy = "created_by"
        case modifiedBy = "modified_by"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case integrationType = "integration_type"
    }

    /// The Box folder, to which the object from the
    /// partner app domain (referenced in `partner_item_id`) is mapped
    public let boxItem: FolderMini

    /// Mapped item object for Slack or Teams
    public let partnerItem: IntegrationMappingPartnerItemSlackUnion

    /// Identifies whether the mapping has
    /// been manually set
    /// (as opposed to being automatically created)
    public let isManuallyCreated: Bool?

    public let options: IntegrationMappingSlackOptions?

    /// An object representing the user who
    /// created the integration mapping
    public let createdBy: UserIntegrationMappings?

    /// The user who
    /// last modified the integration mapping
    public let modifiedBy: UserIntegrationMappings?

    /// When the integration mapping object was created
    public let createdAt: Date?

    /// When the integration mapping object was last modified
    public let modifiedAt: Date?

    /// Identifies the Box partner app,
    /// with which the mapping is associated.
    /// Currently only supports Slack.
    /// (part of the composite key together with `id`)
    public let integrationType: IntegrationMappingIntegrationTypeField?

    /// Initializer for a IntegrationMapping.
    ///
    /// - Parameters:
    ///   - id: A unique identifier of a folder mapping
    ///     (part of a composite key together
    ///     with `integration_type`)
    ///   - boxItem: The Box folder, to which the object from the
    ///     partner app domain (referenced in `partner_item_id`) is mapped
    ///   - partnerItem: Mapped item object for Slack or Teams
    ///   - type: Mapping type
    ///   - isManuallyCreated: Identifies whether the mapping has
    ///     been manually set
    ///     (as opposed to being automatically created)
    ///   - options: 
    ///   - createdBy: An object representing the user who
    ///     created the integration mapping
    ///   - modifiedBy: The user who
    ///     last modified the integration mapping
    ///   - createdAt: When the integration mapping object was created
    ///   - modifiedAt: When the integration mapping object was last modified
    ///   - integrationType: Identifies the Box partner app,
    ///     with which the mapping is associated.
    ///     Currently only supports Slack.
    ///     (part of the composite key together with `id`)
    public init(id: String, boxItem: FolderMini, partnerItem: IntegrationMappingPartnerItemSlackUnion, type: IntegrationMappingBaseTypeField = IntegrationMappingBaseTypeField.integrationMapping, isManuallyCreated: Bool? = nil, options: IntegrationMappingSlackOptions? = nil, createdBy: UserIntegrationMappings? = nil, modifiedBy: UserIntegrationMappings? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil, integrationType: IntegrationMappingIntegrationTypeField? = nil) {
        self.boxItem = boxItem
        self.partnerItem = partnerItem
        self.isManuallyCreated = isManuallyCreated
        self.options = options
        self.createdBy = createdBy
        self.modifiedBy = modifiedBy
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.integrationType = integrationType

        super.init(id: id, type: type)
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        boxItem = try container.decode(FolderMini.self, forKey: .boxItem)
        partnerItem = try container.decode(IntegrationMappingPartnerItemSlackUnion.self, forKey: .partnerItem)
        isManuallyCreated = try container.decodeIfPresent(Bool.self, forKey: .isManuallyCreated)
        options = try container.decodeIfPresent(IntegrationMappingSlackOptions.self, forKey: .options)
        createdBy = try container.decodeIfPresent(UserIntegrationMappings.self, forKey: .createdBy)
        modifiedBy = try container.decodeIfPresent(UserIntegrationMappings.self, forKey: .modifiedBy)
        if let _createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) {
            createdAt = try Utils.Dates.dateTimeFromString(dateTime: _createdAt)
        } else {
            createdAt = nil
        }

        if let _modifiedAt = try container.decodeIfPresent(String.self, forKey: .modifiedAt) {
            modifiedAt = try Utils.Dates.dateTimeFromString(dateTime: _modifiedAt)
        } else {
            modifiedAt = nil
        }

        integrationType = try container.decodeIfPresent(IntegrationMappingIntegrationTypeField.self, forKey: .integrationType)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(boxItem, forKey: .boxItem)
        try container.encode(partnerItem, forKey: .partnerItem)
        try container.encodeIfPresent(isManuallyCreated, forKey: .isManuallyCreated)
        try container.encodeIfPresent(options, forKey: .options)
        try container.encodeIfPresent(createdBy, forKey: .createdBy)
        try container.encodeIfPresent(modifiedBy, forKey: .modifiedBy)
        if let createdAt = createdAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: createdAt), forKey: .createdAt)
        }

        if let modifiedAt = modifiedAt {
            try container.encode(Utils.Dates.dateTimeToString(dateTime: modifiedAt), forKey: .modifiedAt)
        }

        try container.encodeIfPresent(integrationType, forKey: .integrationType)
        try super.encode(to: encoder)
    }

}
