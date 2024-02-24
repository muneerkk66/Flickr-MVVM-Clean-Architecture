//
//  FlickrImageTests.swift
//  FlickrImageTests
//
//  Created by Muneer K K on 08/02/2024.
//

@testable import FlickrApp
import XCTest
import SwiftUI
import SnapshotTesting

@MainActor
final class FlickrAppTests: XCTestCase {
    var viewModel: HomeViewModel!
    var persistenceController: PersistenceController!

    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testDefaultAppearance ( ) {
        let contentView = HomeView(viewModel: HomeViewModel(coordinator: MockHomeCoordinator(), fetchPhotosUseCase: MockFetchPhotosUseCase.success(with: MockData.photosResponse)))
        assertSnapshot(of: contentView.toVC(), as: .image)
    }

    func testPhotoViewAppearance ( ) {
        let contentView = PhotoView(url: URL(string: MockData.imageUrl))
        assertSnapshot(of: contentView.toVC(), as: .image, timeout: 10)
    }

    func testHistoryAppearance ( ) {
        let context = persistenceController.container.viewContext
        let newItem = Item(context: context)
        newItem.searchText = "Test"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        newItem.updatedAt = formatter.date(from: "2016/10/08 22:31")

        // Save changes
        persistenceController.save()

        let contentView = HistoryView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        assertSnapshot(of: contentView.toVC(), as: .image)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
