//
//  MoviesListRemoteDataSourceTest.swift
//  Movies ListTests
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import XCTest

@testable import Movies_List
class MoviesListRemoteDataSourceTest: XCTestCase {
    var moviesListRemoteDataSource: MoviesListRemoteDataSource!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        moviesListRemoteDataSource = MoviesListRemoteDataSource.sharedInstance
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        moviesListRemoteDataSource = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        moviesListRemoteDataSource.getMoviesList(requestValue: MoviesListRequestValues(pageNumber: "1"), compilationHandler: { (data, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
        })
    }
}
