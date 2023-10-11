import Foundation

public class UpdateSkillInvocationByIdRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case status
        case metadata
        case file
        case fileVersion = "file_version"
        case usage
    }

    /// Defines the status of this invocation. Set this to `success` when setting Skill cards.
    public let status: UpdateSkillInvocationByIdRequestBodyArgStatusField
    /// The metadata to set for this skill. This is a list of
    /// Box Skills cards. These cards will overwrite any existing Box
    /// skill cards on the file.
    public let metadata: UpdateSkillInvocationByIdRequestBodyArgMetadataField
    /// The file to assign the cards to.
    public let file: UpdateSkillInvocationByIdRequestBodyArgFileField
    /// The optional file version to assign the cards to.
    public let fileVersion: UpdateSkillInvocationByIdRequestBodyArgFileVersionField?
    /// A descriptor that defines what items are affected by this call.
    /// 
    /// Set this to the default values when setting a card to a `success`
    /// state, and leave it out in most other situations.
    public let usage: UpdateSkillInvocationByIdRequestBodyArgUsageField?

    /// Initializer for a UpdateSkillInvocationByIdRequestBodyArg.
    ///
    /// - Parameters:
    ///   - status: Defines the status of this invocation. Set this to `success` when setting Skill cards.
    ///   - metadata: The metadata to set for this skill. This is a list of
    ///     Box Skills cards. These cards will overwrite any existing Box
    ///     skill cards on the file.
    ///   - file: The file to assign the cards to.
    ///   - fileVersion: The optional file version to assign the cards to.
    ///   - usage: A descriptor that defines what items are affected by this call.
    ///     
    ///     Set this to the default values when setting a card to a `success`
    ///     state, and leave it out in most other situations.
    public init(status: UpdateSkillInvocationByIdRequestBodyArgStatusField, metadata: UpdateSkillInvocationByIdRequestBodyArgMetadataField, file: UpdateSkillInvocationByIdRequestBodyArgFileField, fileVersion: UpdateSkillInvocationByIdRequestBodyArgFileVersionField? = nil, usage: UpdateSkillInvocationByIdRequestBodyArgUsageField? = nil) {
        self.status = status
        self.metadata = metadata
        self.file = file
        self.fileVersion = fileVersion
        self.usage = usage
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(UpdateSkillInvocationByIdRequestBodyArgStatusField.self, forKey: .status)
        metadata = try container.decode(UpdateSkillInvocationByIdRequestBodyArgMetadataField.self, forKey: .metadata)
        file = try container.decode(UpdateSkillInvocationByIdRequestBodyArgFileField.self, forKey: .file)
        fileVersion = try container.decodeIfPresent(UpdateSkillInvocationByIdRequestBodyArgFileVersionField.self, forKey: .fileVersion)
        usage = try container.decodeIfPresent(UpdateSkillInvocationByIdRequestBodyArgUsageField.self, forKey: .usage)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(metadata, forKey: .metadata)
        try container.encode(file, forKey: .file)
        try container.encodeIfPresent(fileVersion, forKey: .fileVersion)
        try container.encodeIfPresent(usage, forKey: .usage)
    }
}
