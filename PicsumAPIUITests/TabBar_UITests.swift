//
//  TabBar_UITests.swift
//  PicsumAPIUITests
//
//  Created by Achintha kahawalage on 2023-03-06.
//

import XCTest

final class TabBar_UITests: XCTestCase {

    
    func testTabBarSelection() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        tabBar.buttons["Favourites"].tap()
        tabBar.buttons["Images"].tap()
                                                                                        
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
