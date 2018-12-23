//
//  MoviesListRemoteDataSource.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

class MoviesListRemoteDataSource: MoviesListDataSource {
    
    static let sharedInstance = MoviesListRemoteDataSource()
    let apiClient = URLSessionClient.sharedInstance
    
    // MARK: - implement ProfileDataSource Protocol
    
    func getMoviesList(requestValue: RequestValues,compilationHandler:@escaping (Any?,Error?) -> Void){
        
        let moviesListRequestValues = requestValue as? MoviesListRequestValues
        let url = "http://api.themoviedb.org/3/discover/movie?api_key=acea91d2bff1c53e6604e4985b6989e2&page=\(moviesListRequestValues?.pageNumber ?? "")"
        
        var headers: [String : String] = [:]
        headers["Content-type"] = "application/json"
        
        apiClient.executeGetRequest(url: url, parameters: nil, header: nil, compilationHandler: compilationHandler)
        
    }
}
