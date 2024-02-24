//
//  PresistenceTests.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 14/02/2024.
//

import XCTest
@testable import FlickrApp
import SnapshotTesting
import CoreData

final class PersistenceTests: XCTestCase {

    var persistenceController: PersistenceController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        persistenceController = PersistenceController(inMemory: true) // Use in-memory store for testing
    }

    override func tearDownWithError() throws {
        persistenceController = nil
        try super.tearDownWithError()
    }

    func testSave() {
        // Add some test data
        let context = persistenceController.container.viewContext
        let newItem = Item(context: context)
        newItem.updatedAt = Date()

        // Save changes
        persistenceController.save()

        // Fetch items and verify
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            let items = try context.fetch(fetchRequest)
            XCTAssertFalse(items.isEmpty, "Items should not be empty after saving")
        } catch {
            XCTFail("Error fetching items: \(error.localizedDescription)")
        }
    }
}
