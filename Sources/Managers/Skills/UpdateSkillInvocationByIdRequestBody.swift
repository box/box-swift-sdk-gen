import Foundation

public class UpdateSkillInvocationByIdRequestBody: Codable {
    private enum CodingKeys: String, CodingKey {
        case status
        case metadata
        case file
        case fileVersion = "file_version"
        case usage
    }

    /// Defines the status of this invocation. Set this to `success` when setting Skill cards.
    public let status: UpdateSkillInvocationByIdRequestBodyStatusField

    /// The metadata to set for this skill. This is a list of
    /// Box Skills cards. These cards will overwrite any existing Box
    /// skill cards on the file.
    public let metadata: UpdateSkillInvocationByIdRequestBodyMetadataField

    /// The file to assign the cards to.
    public let file: UpdateSkillInvocationByIdRequestBodyFileField

    /// The optional file version to assign the cards to.
    public let fileVersion: UpdateSkillInvocationByIdRequestBodyFileVersionField?

    /// A descriptor that defines what items are affected by this call.
    /// 
    /// Set this to the default values when setting a card to a `success`
    /// state, and leave it out in most other situations.
    public let usage: UpdateSkillInvocationByIdRequestBodyUsageField?

    /// Initializer for a UpdateSkillInvocationByIdRequestBody.
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
    public init(status: UpdateSkillInvocationByIdRequestBodyStatusField, metadata: UpdateSkillInvocationByIdRequestBodyMetadataField, file: UpdateSkillInvocationByIdRequestBodyFileField, fileVersion: UpdateSkillInvocationByIdRequestBodyFileVersionField? = nil, usage: UpdateSkillInvocationByIdRequestBodyUsageField? = nil) {
        self.status = status
        self.metadata = metadata
        self.file = file
        self.fileVersion = fileVersion
        self.usage = usage
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(UpdateSkillInvocationByIdRequestBodyStatusField.self, forKey: .status)
        metadata = try container.decode(UpdateSkillInvocationByIdRequestBodyMetadataField.self, forKey: .metadata)
        file = try container.decode(UpdateSkillInvocationByIdRequestBodyFileField.self, forKey: .file)
        fileVersion = try container.decodeIfPresent(UpdateSkillInvocationByIdRequestBodyFileVersionField.self, forKey: .fileVersion)
        usage = try container.decodeIfPresent(UpdateSkillInvocationByIdRequestBodyUsageField.self, forKey: .usage)
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
