//
//  FactoryTest.swift
//  Movies ListTests
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import XCTest

@testable import Movies_List
class FactoryTest: XCTestCase {
    var moviesListUseCase: MoviesListUseCase!
    var addingMovieUseCase: AddingMovieUseCase!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        moviesListUseCase = Factory.getMoviesListUseCase()
        addingMovieUseCase = Factory.getAddingMovieUseCase()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        moviesListUseCase = nil
        addingMovieUseCase = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(moviesListUseCase)
        XCTAssertNotNil(addingMovieUseCase)
    }
}
