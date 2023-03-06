//
//  CoreDataTests.swift
//  Store_lab_tech_testTests
//
//  Created by Achintha kahawalage on 2023-03-04.
//

import XCTest
import CoreData
@testable import Store_lab_tech_test

class CoreDataTests: XCTestCase {
    
    let sut = CoreDataHelper()
    var coreDataStack: CoreDataTestStack!
    
    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        sut.context = coreDataStack.persistentContainer.viewContext
    }
    
    
    func testSaveToCoreData() {
        
        sut.saveToCoreData(id: "0", data: Data(), author: "Alejandro Escamilla") { status, message in
            XCTAssertEqual(status, true)
            XCTAssertNotNil(Data.self)
            XCTAssertEqual(message, "")
        }
        
    }
    
}

