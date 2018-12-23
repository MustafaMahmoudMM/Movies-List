//
//  URLSessionClientTest.swift
//  Movies ListTests
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import XCTest

@testable import Movies_List
class URLSessionClientTest: XCTestCase {
    var apiClient: URLSessionClient!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiClient = URLSessionClient.sharedInstance
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClient = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let url = "http://api.themoviedb.org/3/discover/movie?api_key=acea91d2bff1c53e6604e4985b6989e2&page=1)"
        URLSessionClient.sharedInstance.executeGetRequest(url: url, parameters: nil, header: nil, compilationHandler: { (data, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
        })
    }
}
