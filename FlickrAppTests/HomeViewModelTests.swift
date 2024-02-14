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
            $0.fetchPhotosUseCase = MockFetchPhotosUseCase()
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
        XCTAssertEqual(viewModel.state, HomeViewModel.State.good)
    }

    func testFetchPhotos() async {
        viewModel.state = .good
        let searchText = "example"
        let page = 1
        let expectedResult = PhotosResult(item: MockData.photosResponseMock)

        viewModel.fetchPhotos(seachText: searchText)
        // Simulate successful fetch using Combine
        let expectation = XCTestExpectation(description: "FetchPhotos")
        viewModel.fetchPhotosUseCase
            .execute(withText: searchText, page: page)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
                case .finished:
                    expectation.fulfill()
                }
            }, receiveValue: { result in

                XCTAssertEqual(result.photos.first?.id, expectedResult.photos.first?.id)
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)

    }
}

// Mock FetchPhotosUseCase for testing
class MockFetchPhotosUseCase: FetchPhotosUseCase {
    func execute(withText _: String, page _: Int) -> AnyPublisher<PhotosResult, APIError> {
        return Result.Publisher(result).eraseToAnyPublisher()
    }

    var result: Result<PhotosResult, APIError> = .success(PhotosResult(item: MockData.photosResponseMock))
}
