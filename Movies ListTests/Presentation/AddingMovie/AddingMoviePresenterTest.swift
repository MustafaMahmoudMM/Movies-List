//
//  AddingMoviePresenterTest.swift
//  Movies ListTests
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import XCTest

@testable import Movies_List
class AddingMoviePresenterTest: XCTestCase {
    var addingMoviePresenter: AddingMoviePresenter!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let view = AddingMovieViewController()
        addingMoviePresenter = AddingMoviePresenter(view: view)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        addingMoviePresenter = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        addingMoviePresenter.saveMovie(title: "title", overview: "overview", date: "date", poster: (UIImage(named: "movie")?.pngData())!)
        XCTAssertNotNil(addingMoviePresenter.addingMovieUseCase)
    }
}
