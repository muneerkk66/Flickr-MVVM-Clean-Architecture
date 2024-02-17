//
//  APIClientTests.swift
//  FlickrAppTests
//
//  Created by Muneer K K on 17/02/2024.
//

import XCTest
import Dependencies
@testable import FlickrApp

final class APIClientTests: XCTestCase {
    var model: APIClientLive!
    override func setUpWithError() throws {
        model = withDependencies {
            $0.apiEnvironment = MockAPIEnvironment.success()
        } operation: {
            APIClientLive()
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testClientSuccessRequest() throws {
        let result = try awaitPublisher(model.request(MockData.request))
        XCTAssertTrue(try XCTUnwrap(result.photos?.photo.count) > 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
