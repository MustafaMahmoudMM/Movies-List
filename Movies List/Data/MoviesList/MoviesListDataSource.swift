//
//  MoviesListDataSource.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

protocol MoviesListDataSource {
    
    func getMoviesList(requestValue: RequestValues,compilationHandler:@escaping (Any?,Error?) -> Void)
    
}
