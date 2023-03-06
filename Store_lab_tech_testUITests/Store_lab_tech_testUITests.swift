//
//  Store_lab_tech_testUITests.swift
//  Store_lab_tech_testUITests
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import XCTest

final class Store_lab_tech_testUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testTableViewDidSelect() throws {
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
