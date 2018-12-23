//
//  MoviesListRepository.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

class MoviesListRepository: Repository
{
    // MARK: - Shared Instance
    private static var moviesListRepository : MoviesListRepository?
    
    // MARK: - data source Instance
    private final var remoteDataSource: MoviesListDataSource?
    
    // MARK: - get Shared Instance
    static func getMoviesListRepository(remoteDataSource: MoviesListDataSource ) -> MoviesListRepository{
        
        if moviesListRepository == nil {
            moviesListRepository = MoviesListRepository(remoteDataSource: remoteDataSource)
        }
        
        return moviesListRepository!
    }
    
    private init(remoteDataSource: MoviesListDataSource ) {
        
        self.remoteDataSource = remoteDataSource
    }
    
    
    // MARK: - implement Repository Protocol
    func getData(requestValue: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void){
        if let request = requestValue as? MoviesListRequestValues, request.pageNumber == "-1" {
            MoviesListLocalDataSource.sharedInstance.getMoviesList(requestValue: requestValue, compilationHandler: { (responseData, error) in
                
                if let data = responseData as? MoviesListResponseValues {
                    compilationHandler(data,error)
                } else {
                    compilationHandler(nil,error)
                }
            })
        } else {
            remoteDataSource?.getMoviesList(requestValue: requestValue, compilationHandler: { (responseData, error) in
                
                if let data = responseData as? Data {
                    let decoder = JSONDecoder()
                    let moviesList = try! decoder.decode(MoviesListModel.self, from: data)
                    let responseValue = MoviesListResponseValues(moviesList: moviesList)
                    compilationHandler(responseValue,error)
                } else {
                    compilationHandler(nil,error)
                }
            })
        }
        
    }
}
