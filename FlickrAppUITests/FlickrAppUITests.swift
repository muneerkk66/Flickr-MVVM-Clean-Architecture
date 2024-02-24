//
//  FlickrImageUITests.swift
//  FlickrImageUITests
//
//  Created by Muneer K K on 08/02/2024.
//

import XCTest

final class FlickrAppUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationBarButtonTapped() throws {
        // Navigate to the HomeView
        let photosNavigationBar = app.navigationBars["Photos"]
        XCTAssertTrue(photosNavigationBar.exists)

        // Tap on the clock button
        let clockButton = photosNavigationBar.buttons["Clock"]
        XCTAssertTrue(clockButton.exists)
        clockButton.tap()

        let historyScreen = app.navigationBars["History"]
        XCTAssertTrue(historyScreen.exists)
    }

    func testSearchFunctionality() throws {
        // Navigate to the HomeView
        let photosNavigationBar = app.navigationBars["Photos"]
        XCTAssertTrue(photosNavigationBar.exists)

        let searchField = app.searchFields.element
        XCTAssertTrue(searchField.exists)
        searchField.tap()
        searchField.typeText("Your search text")

        XCTAssertEqual(searchField.value as? String, "Your search text")

    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

}
