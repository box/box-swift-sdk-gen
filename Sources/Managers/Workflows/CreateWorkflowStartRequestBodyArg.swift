import Foundation

public class CreateWorkflowStartRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case flow
        case files
        case folder
        case type
        case outcomes
    }

    /// The flow that will be triggered
    public let flow: CreateWorkflowStartRequestBodyArgFlowField
    /// The array of files for which the workflow should start. All files
    /// must be in the workflow's configured folder.
    public let files: [CreateWorkflowStartRequestBodyArgFilesField]
    /// The folder object for which the workflow is configured.
    public let folder: CreateWorkflowStartRequestBodyArgFolderField
    /// The type of the parameters object
    public let type: CreateWorkflowStartRequestBodyArgTypeField?
    /// A list of outcomes required to be configured at start time.
    public let outcomes: [CreateWorkflowStartRequestBodyArgOutcomesField]?

    /// Initializer for a CreateWorkflowStartRequestBodyArg.
    ///
    /// - Parameters:
    ///   - flow: The flow that will be triggered
    ///   - files: The array of files for which the workflow should start. All files
    ///     must be in the workflow's configured folder.
    ///   - folder: The folder object for which the workflow is configured.
    ///   - type: The type of the parameters object
    ///   - outcomes: A list of outcomes required to be configured at start time.
    public init(flow: CreateWorkflowStartRequestBodyArgFlowField, files: [CreateWorkflowStartRequestBodyArgFilesField], folder: CreateWorkflowStartRequestBodyArgFolderField, type: CreateWorkflowStartRequestBodyArgTypeField? = nil, outcomes: [CreateWorkflowStartRequestBodyArgOutcomesField]? = nil) {
        self.flow = flow
        self.files = files
        self.folder = folder
        self.type = type
        self.outcomes = outcomes
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        flow = try container.decode(CreateWorkflowStartRequestBodyArgFlowField.self, forKey: .flow)
        files = try container.decode([CreateWorkflowStartRequestBodyArgFilesField].self, forKey: .files)
        folder = try container.decode(CreateWorkflowStartRequestBodyArgFolderField.self, forKey: .folder)
        type = try container.decodeIfPresent(CreateWorkflowStartRequestBodyArgTypeField.self, forKey: .type)
        outcomes = try container.decodeIfPresent([CreateWorkflowStartRequestBodyArgOutcomesField].self, forKey: .outcomes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(flow, forKey: .flow)
        try container.encode(files, forKey: .files)
        try container.encode(folder, forKey: .folder)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(outcomes, forKey: .outcomes)
    }
}
