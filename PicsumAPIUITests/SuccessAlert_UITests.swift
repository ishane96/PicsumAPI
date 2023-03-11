//
//  PicsumAPIUITests.swift
//  PicsumAPIUITests
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import XCTest

final class PicsumAPIUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testSuccessAlert() throws {
        let app = XCUIApplication()
        app.navigationBars["Detail"].buttons["favorite"].tap()
        app.alerts["Success"].scrollViews.otherElements.buttons["OK"]/*@START_MENU_TOKEN@*/.press(forDuration: 0.5);/*[[".tap()",".press(forDuration: 0.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
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
