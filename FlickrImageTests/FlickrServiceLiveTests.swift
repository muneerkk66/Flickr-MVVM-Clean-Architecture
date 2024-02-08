//
//  FLickrServiceTests.swift
//  FlickrImageTests
//
//  Created by Muneer K K on 08/02/2024.
//
import Combine
@testable import FlickrImage
import XCTest

class FlickrServiceLiveTests: XCTestCase {
    let flickrService = FlickrServiceLive()
    private var subscriptions = Set<AnyCancellable>()

    func testFetchPhotos() {
        // Given
        let name = "apple"
        let page = 1

        // When
        let fetchPhotosPublisher = flickrService.fetchPhotos(withText: name, page: page)

        // Then
        let expectation = XCTestExpectation(description: "Fetch photos expectation")

        fetchPhotosPublisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    XCTFail("Failed with error: \(error)")
                }
                expectation.fulfill()
            }, receiveValue: { _ in
                // Add assertions here to validate the response
                // For example:
                // XCTAssertEqual(response.someProperty, expectedValue)
            })
            .store(in: &subscriptions)

        wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
    }
}
