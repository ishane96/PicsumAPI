//
//  ImageListTests.swift
//  PicsumAPITests
//
//  Created by Achintha kahawalage on 2023-03-03.
//

import XCTest
@testable import PicsumAPI

final class ImageListTests: XCTestCase {
    
    override func tearDown() {
        URLProtocol.unregisterClass(URLProtocolMock.self)
        super.tearDown()
    }

    func testImageListGetAPISuccess() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "[{\"id\":\"0\",\"author\":\"Alejandro Escamilla\",\"width\":5000,\"height\":3333,\"url\":\"https://unsplash.com/photos/yC-Yzbqy7PY\",\"download_url\":\"https://picsum.photos/id/0/5000/3333\"}]\n"
        URLProtocolMock.mockData = jsonString.data(using: .utf8)
        
        let sut = APIs(urlSession: urlSession)
        let expectation = XCTestExpectation(description: "Image List Expectation")
        let url = URL(string: "https://picsum.photos/v2/list?page=1&limit=10")!

        
        sut.getAllData(url: url, [Image].self) { response, message, error in
            XCTAssertEqual(response?.first?.author, "Alejandro Escamilla")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 15)
    }
    
    func testImageDownload() {
        let config = URLSessionConfiguration.ephemeral
        let urlSession = URLSession(configuration: config)
        let sut = APIs(urlSession: urlSession)
        let expectation = XCTestExpectation(description: "Image downloaded")
        let url = URL(string: "https://picsum.photos/id/0/5000/333")!
        
        sut.getImageData(url: url) { status, message, data in
            XCTAssertNotNil(data)
            XCTAssertEqual(status, true)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 30.0)
    }

}
