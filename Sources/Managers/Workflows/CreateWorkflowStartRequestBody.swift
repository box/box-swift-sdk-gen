import Foundation

public class CreateWorkflowStartRequestBody: Codable {
    private enum CodingKeys: String, CodingKey {
        case flow
        case files
        case folder
        case type
        case outcomes
    }

    /// The flow that will be triggered
    public let flow: CreateWorkflowStartRequestBodyFlowField

    /// The array of files for which the workflow should start. All files
    /// must be in the workflow's configured folder.
    public let files: [CreateWorkflowStartRequestBodyFilesField]

    /// The folder object for which the workflow is configured.
    public let folder: CreateWorkflowStartRequestBodyFolderField

    /// The type of the parameters object
    public let type: CreateWorkflowStartRequestBodyTypeField?

    /// A list of outcomes required to be configured at start time.
    public let outcomes: [CreateWorkflowStartRequestBodyOutcomesField]?

    /// Initializer for a CreateWorkflowStartRequestBody.
    ///
    /// - Parameters:
    ///   - flow: The flow that will be triggered
    ///   - files: The array of files for which the workflow should start. All files
    ///     must be in the workflow's configured folder.
    ///   - folder: The folder object for which the workflow is configured.
    ///   - type: The type of the parameters object
    ///   - outcomes: A list of outcomes required to be configured at start time.
    public init(flow: CreateWorkflowStartRequestBodyFlowField, files: [CreateWorkflowStartRequestBodyFilesField], folder: CreateWorkflowStartRequestBodyFolderField, type: CreateWorkflowStartRequestBodyTypeField? = nil, outcomes: [CreateWorkflowStartRequestBodyOutcomesField]? = nil) {
        self.flow = flow
        self.files = files
        self.folder = folder
        self.type = type
        self.outcomes = outcomes
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        flow = try container.decode(CreateWorkflowStartRequestBodyFlowField.self, forKey: .flow)
        files = try container.decode([CreateWorkflowStartRequestBodyFilesField].self, forKey: .files)
        folder = try container.decode(CreateWorkflowStartRequestBodyFolderField.self, forKey: .folder)
        type = try container.decodeIfPresent(CreateWorkflowStartRequestBodyTypeField.self, forKey: .type)
        outcomes = try container.decodeIfPresent([CreateWorkflowStartRequestBodyOutcomesField].self, forKey: .outcomes)
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
