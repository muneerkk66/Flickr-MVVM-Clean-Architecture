//
//  PhotosRepositoryTests.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 17/02/2024.
//

import Combine
import Dependencies
@testable import FlickrApp
import XCTest
import CoreData

final class PhotosRepositoryTests: XCTestCase {

    var model: PhotosRepositoryLive!
    var mockFetchPhotosUseCase: MockFetchPhotosUseCase!
    var persistenceController: PersistenceController!

    override func setUpWithError() throws {
        persistenceController = PersistenceController()
        model = withDependencies {
            $0.flickrService = MockFlickrService()
        } operation: {
            PhotosRepositoryLive()
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchPhotos() throws {
        let searchText = "sample"
        let page = 1
        let result = try awaitPublisher(model.fetchPhotos(withText: searchText, page: page))
        XCTAssertTrue(result.photos.count > 0)

        let context = persistenceController.container.viewContext
        // Fetch items and verify
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            let items = try context.fetch(fetchRequest)
            XCTAssertFalse(items.isEmpty, "Items should not be empty after saving")
            XCTAssertEqual(try XCTUnwrap(items.last?.searchText), searchText)

        } catch {
            XCTFail("Error fetching items: \(error.localizedDescription)")
        }

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
