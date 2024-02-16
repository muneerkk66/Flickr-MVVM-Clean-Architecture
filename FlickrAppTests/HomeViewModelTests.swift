//
//  HomeViewModelTests.swift
//  FlickrImageTests
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
import Dependencies
@testable import FlickrApp
import XCTest
import CoreData

@MainActor
class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockFetchPhotosUseCase: MockFetchPhotosUseCase!
    var persistenceController: PersistenceController!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        persistenceController = PersistenceController()
        viewModel = withDependencies {
            $0.fetchPhotosUseCase = MockFetchPhotosUseCase.success(with: MockData.photosResponseMock)
        } operation: {
            HomeViewModel()
        }

    }

    override func tearDown() {
        viewModel = nil
        mockFetchPhotosUseCase = nil
        super.tearDown()
    }

    func testInitialState() {
        XCTAssertEqual(viewModel.state, .good)
        XCTAssertEqual(viewModel.searchText, "")
        XCTAssertTrue(viewModel.photos.isEmpty)
    }

    func testSearchTextUpdated() {
        viewModel.searchText.append("test")
        XCTAssertEqual(viewModel.searchText, "test")
    }

    func testPhotosLoadMore() {
        viewModel.loadMore()
        XCTAssertTrue(viewModel.photos.isEmpty)
        XCTAssertEqual(viewModel.state, HomeViewModel.LoadingState.good)
    }

    func testFetchPhotosSuccess() throws {
        let searchText = "test"
        let exp = XCTestExpectation(description: "TestFetchPhotosSuccess")
        viewModel.fetchPhotos(seachText: searchText)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(viewModel.photos.count > 0)
            XCTAssertEqual(viewModel.state, HomeViewModel.LoadingState.loadedAll)
            XCTAssertEqual(viewModel.page, 1)
        } else {
            XCTFail("Test Failed: FetchPhotos")
        }
    }

    func testFetchPhotosFailure() throws {
        let searchText = "test"
        let exp = XCTestExpectation(description: "TestFetchPhotosFailure")
        viewModel = withDependencies {
            $0.fetchPhotosUseCase = MockFetchPhotosUseCase.failure(error: APIError.applicationError)
        } operation: {
            HomeViewModel()
        }
        viewModel.fetchPhotos(seachText: searchText)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(viewModel.photos.count, 0)
            XCTAssertEqual(viewModel.state, HomeViewModel.LoadingState.good)
            XCTAssertEqual(viewModel.page, 0)
        } else {
            XCTFail("Test Failed: FetchPhotos")
        }
    }

}
