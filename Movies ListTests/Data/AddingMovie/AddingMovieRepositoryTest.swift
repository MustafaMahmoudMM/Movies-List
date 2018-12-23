//
//  AddingMovieRepositoryTest.swift
//  Movies ListTests
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import XCTest

@testable import Movies_List
class AddingMovieRepositoryTest: XCTestCase {
    var addingMovieRepository: AddingMovieRepository!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        addingMovieRepository = AddingMovieRepository.getAddingMovieRepository(localDataSource: AddingMovieLocalDataSource.sharedInstance)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        addingMovieRepository = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        addingMovieRepository.getData(requestValue: AddingMovieRequestValues(title: "title", overview: "overview", date: "date", poster: (UIImage(named: "movie")?.pngData())!), compilationHandler: { (data, error) in
            let response = data as? AddingMovieResponseValues
            XCTAssertNil(error)
            XCTAssertTrue(response?.isSucceeded ?? false)
        })
        
    }
}
