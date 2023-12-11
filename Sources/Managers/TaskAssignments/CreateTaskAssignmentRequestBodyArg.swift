import Foundation

public class CreateTaskAssignmentRequestBodyArg: Codable {
    private enum CodingKeys: String, CodingKey {
        case task
        case assignTo = "assign_to"
    }

    /// The task to assign to a user.
    public let task: CreateTaskAssignmentRequestBodyArgTaskField

    /// The user to assign the task to.
    public let assignTo: CreateTaskAssignmentRequestBodyArgAssignToField

    /// Initializer for a CreateTaskAssignmentRequestBodyArg.
    ///
    /// - Parameters:
    ///   - task: The task to assign to a user.
    ///   - assignTo: The user to assign the task to.
    public init(task: CreateTaskAssignmentRequestBodyArgTaskField, assignTo: CreateTaskAssignmentRequestBodyArgAssignToField) {
        self.task = task
        self.assignTo = assignTo
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        task = try container.decode(CreateTaskAssignmentRequestBodyArgTaskField.self, forKey: .task)
        assignTo = try container.decode(CreateTaskAssignmentRequestBodyArgAssignToField.self, forKey: .assignTo)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(task, forKey: .task)
        try container.encode(assignTo, forKey: .assignTo)
    }

}
