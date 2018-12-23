//
//  MoviesListRepositoryTest.swift
//  Movies ListTests
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import XCTest

@testable import Movies_List
class MoviesListRepositoryTest: XCTestCase {
    var moviesListRepository: MoviesListRepository!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        moviesListRepository = MoviesListRepository.getMoviesListRepository(remoteDataSource: MoviesListRemoteDataSource.sharedInstance)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        moviesListRepository = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        moviesListRepository.getData(requestValue: MoviesListRequestValues(pageNumber: "-1"), compilationHandler: { (data, error) in
            let response = data as? MoviesListResponseValues
            XCTAssertNil(error)
            XCTAssertNotNil(response?.moviesList.results)
        })
        
        moviesListRepository.getData(requestValue: MoviesListRequestValues(pageNumber: "1"), compilationHandler: { (data, error) in
            let response = data as? MoviesListResponseValues
            XCTAssertNil(error)
            XCTAssertNotNil(response?.moviesList.results)
        })
    }
}
