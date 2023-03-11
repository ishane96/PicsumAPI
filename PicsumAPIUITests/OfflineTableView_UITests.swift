//
//  OfflineTableView_UITests.swift
//  PicsumAPIUITests
//
//  Created by Achintha kahawalage on 2023-03-06.
//

import XCTest

final class OfflineTableView_UITests: XCTestCase {

    func testOfflineTableViewDidSelect() throws {
        
        let app = XCUIApplication()
        app.tabBars["Tab Bar"].buttons["Favourites"].tap()
        app.tables.cells.containing(.staticText, identifier:"Alejandro Escamilla").element.tap()
        
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
