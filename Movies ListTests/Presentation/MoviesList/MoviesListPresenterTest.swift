//
//  MoviesListPresenterTest.swift
//  Movies ListTests
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import XCTest

@testable import Movies_List
class MoviesListPresenterTest: XCTestCase {
    var moviesListPresenter: MoviesListPresenter!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let view = MoviesViewController()
        moviesListPresenter = MoviesListPresenter(view: view)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        moviesListPresenter = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        moviesListPresenter.getLocalMovies()
        moviesListPresenter.getRemoteMovies(with: "1")
        XCTAssertNotNil(moviesListPresenter.moviesListUseCase)
    }
}
