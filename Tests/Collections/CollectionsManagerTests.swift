import Foundation
import BoxSdkGen
import XCTest

class CollectionsManagerTests: XCTestCase {
    var client: BoxClient!

    override func setUp() async throws {
        client = CommonsManager().getDefaultClient()
    }

    public func testCollections() async throws {
        let collections: Collections = try await client.collections.getCollections()
        let favouriteCollection: Collection = try await client.collections.getCollectionById(collectionId: collections.entries![0].id!)
        XCTAssertTrue(Utils.Strings.toString(value: favouriteCollection.type!) == "collection")
        XCTAssertTrue(Utils.Strings.toString(value: favouriteCollection.collectionType!) == "favorites")
        let collectionItems: Items = try await client.collections.getCollectionItems(collectionId: favouriteCollection.id!)
        let folder: FolderFull = try await client.folders.createFolder(requestBody: CreateFolderRequestBody(name: Utils.getUUID(), parent: CreateFolderRequestBodyParentField(id: "0")))
        try await client.folders.updateFolderById(folderId: folder.id, requestBody: UpdateFolderByIdRequestBody(collections: [UpdateFolderByIdRequestBodyCollectionsField(id: favouriteCollection.id)]))
        let collectionItemsAfterUpdate: Items = try await client.collections.getCollectionItems(collectionId: favouriteCollection.id!)
        XCTAssertTrue(collectionItemsAfterUpdate.entries!.count == collectionItems.entries!.count + 1)
        try await client.folders.updateFolderById(folderId: folder.id, requestBody: UpdateFolderByIdRequestBody(collections: []))
        let collectionItemsAfterRemove: Items = try await client.collections.getCollectionItems(collectionId: favouriteCollection.id!)
        XCTAssertTrue(collectionItemsAfterRemove.entries!.count == collectionItems.entries!.count)
        try await client.folders.deleteFolderById(folderId: folder.id)
    }
}
