//
//  HomeViewModelTests.swift
//  FlickrImageTests
//
//  Created by Muneer K K on 08/02/2024.
//

import Combine
@testable import FlickrImage
import XCTest

@MainActor
class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockFetchPhotosUseCase: MockFetchPhotosUseCase!
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockFetchPhotosUseCase = MockFetchPhotosUseCase()
        viewModel = HomeViewModel()
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
        viewModel.searchText = "test"
        XCTAssertEqual(viewModel.searchText, "test")
    }

    // Add more tests as needed for loadMore, error handling, etc.
}

// Mock FetchPhotosUseCase for testing
class MockFetchPhotosUseCase: FetchPhotosUseCase {
    func execute(withText _: String, page _: Int) -> AnyPublisher<PhotosResult, APIError> {
        return Result.Publisher(result).eraseToAnyPublisher()
    }

    var result: Result<PhotosResult, APIError> = .success(PhotosResult(item: PhotosResponse()))
}
