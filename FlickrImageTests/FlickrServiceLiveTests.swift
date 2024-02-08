//
//  FLickrServiceTests.swift
//  FlickrImageTests
//
//  Created by Muneer K K on 08/02/2024.
//
@testable import FlickrImage
import XCTest
import Combine
class FlickrServiceLiveTests: XCTestCase {

	let flickrService = FlickrServiceLive()
	private var subscriptions = Set<AnyCancellable>()

	func testFetchPhotos() {
		// Given
		let name = "apple"

		// When
		let fetchPhotosPublisher = flickrService.fetchPhotos(withText: name)

		// Then
		let expectation = XCTestExpectation(description: "Fetch photos expectation")

		fetchPhotosPublisher
			.sink(receiveCompletion: { completion in
				switch completion {
				case .finished:
					break
				case .failure(let error):
					XCTFail("Failed with error: \(error)")
				}
				expectation.fulfill()
			}, receiveValue: { response in
				// Add assertions here to validate the response
				// For example:
				// XCTAssertEqual(response.someProperty, expectedValue)
			})
			.store(in: &subscriptions)

		wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
	}
}
