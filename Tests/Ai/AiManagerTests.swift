import Foundation
import BoxSdkGen
import XCTest

class AiManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testAskAiSingleItem() async throws {
        let fileToAsk: FileFull = try await CommonsManager().uploadNewFile()
        let response: AiResponse = try await client.ai.createAiAsk(requestBody: AiAsk(mode: AiAskModeField.singleItemQa, prompt: "which direction sun rises", items: [AiAskItemsField(id: fileToAsk.id, type: AiAskItemsTypeField.file, content: "Sun rises in the East")]))
        XCTAssertTrue(response.answer.contains("East"))
        XCTAssertTrue(response.completionReason == "done")
        try await client.files.deleteFileById(fileId: fileToAsk.id)
    }

    public func testAskAiMultipleItems() async throws {
        let fileToAsk1: FileFull = try await CommonsManager().uploadNewFile()
        let fileToAsk2: FileFull = try await CommonsManager().uploadNewFile()
        let response: AiResponse = try await client.ai.createAiAsk(requestBody: AiAsk(mode: AiAskModeField.multipleItemQa, prompt: "Which direction sun rises?", items: [AiAskItemsField(id: fileToAsk1.id, type: AiAskItemsTypeField.file, content: "Earth goes around the sun"), AiAskItemsField(id: fileToAsk2.id, type: AiAskItemsTypeField.file, content: "Sun rises in the East in the morning")]))
        XCTAssertTrue(response.answer.contains("East"))
        XCTAssertTrue(response.completionReason == "done")
        try await client.files.deleteFileById(fileId: fileToAsk1.id)
        try await client.files.deleteFileById(fileId: fileToAsk2.id)
    }

    public func testAiTextGenWithDialogueHistory() async throws {
        let fileToAsk: FileFull = try await CommonsManager().uploadNewFile()
        let response: AiResponse = try await client.ai.createAiTextGen(requestBody: AiTextGen(prompt: "Parapharse the document.s", items: [AiTextGenItemsField(id: fileToAsk.id, type: AiTextGenItemsTypeField.file, content: "The Earth goes around the sun. Sun rises in the East in the morning.")], dialogueHistory: [AiTextGenDialogueHistoryField(prompt: "What does the earth go around?", answer: "The sun", createdAt: try Utils.Dates.dateTimeFromString(dateTime: "2021-01-01T00:00:00Z")), AiTextGenDialogueHistoryField(prompt: "On Earth, where does the sun rise?", answer: "East", createdAt: try Utils.Dates.dateTimeFromString(dateTime: "2021-01-01T00:00:00Z"))]))
        XCTAssertTrue(response.answer.contains("sun"))
        XCTAssertTrue(response.completionReason == "done")
        try await client.files.deleteFileById(fileId: fileToAsk.id)
    }

    public func testGettingAiAskAgentConfig() async throws {
        let aiAskConfig: AiAgentAskOrAiAgentTextGen = try await client.ai.getAiAgentDefaultConfig(queryParams: GetAiAgentDefaultConfigQueryParams(mode: GetAiAgentDefaultConfigQueryParamsModeField.ask, language: "ja-JP"))
    }

    public func testGettingAiTextGenAgentConfig() async throws {
        let aiTextGenConfig: AiAgentAskOrAiAgentTextGen = try await client.ai.getAiAgentDefaultConfig(queryParams: GetAiAgentDefaultConfigQueryParams(mode: GetAiAgentDefaultConfigQueryParamsModeField.textGen, language: "en-US"))
    }
}
