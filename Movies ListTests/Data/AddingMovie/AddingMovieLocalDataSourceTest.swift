//
//  AddingMovieLocalDataSourceTest.swift
//  Movies ListTests
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import XCTest
import UIKit

@testable import Movies_List
class AddingMovieLocalDataSourceTest: XCTestCase {
    var addingMovieLocalDataSource: AddingMovieLocalDataSource!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        addingMovieLocalDataSource = AddingMovieLocalDataSource.sharedInstance
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        addingMovieLocalDataSource = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        addingMovieLocalDataSource.addMovie(requestValue: AddingMovieRequestValues(title: "title", overview: "overview", date: "date", poster: (UIImage(named: "movie")?.pngData())!), compilationHandler: { (data, error) in
            let response = data as? Bool
            XCTAssertNil(error)
            XCTAssertTrue(response ?? false)
        })
    }
}
