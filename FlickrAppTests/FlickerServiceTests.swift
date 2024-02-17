//
//  FlickerServiceTests.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 16/02/2024.
//

import XCTest
import Dependencies
@testable import FlickrApp

final class FlickerServiceTests: XCTestCase {
    var model: FlickrServiceLive!
    override func setUpWithError() throws {
        model = withDependencies {
            $0.apiClient = MockAPIClient()
        } operation: {
            FlickrServiceLive()
        }

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let page = 1
        let searchtext = "Test"
        let result = try awaitPublisher(model.fetchPhotos(withText: searchtext, page: page))
        XCTAssertTrue(try XCTUnwrap(result.photos?.photo.count) > 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
