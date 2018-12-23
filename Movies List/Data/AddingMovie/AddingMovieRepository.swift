//
//  AddingMovieRepository.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

class AddingMovieRepository: Repository
{
    // MARK: - Shared Instance
    private static var addingMovieRepository : AddingMovieRepository?
    
    // MARK: - data source Instance
    private final var localDataSource: AddingMovieDataSource?
    
    // MARK: - get Shared Instance
    static func getAddingMovieRepository(localDataSource: AddingMovieDataSource ) -> AddingMovieRepository{
        
        if addingMovieRepository == nil {
            addingMovieRepository = AddingMovieRepository(localDataSource: localDataSource)
        }
        
        return addingMovieRepository!
    }
    
    private init(localDataSource: AddingMovieDataSource ) {
        
        self.localDataSource = localDataSource
    }
    
    
    // MARK: - implement Repository Protocol
    func getData(requestValue: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void){
        localDataSource?.addMovie(requestValue: requestValue, compilationHandler: { (responseData, error) in
            
            if let data = responseData as? Bool {
                let responseValue = AddingMovieResponseValues(isSucceeded: data)
                compilationHandler(responseValue,error)
            } else {
                compilationHandler(AddingMovieResponseValues(isSucceeded: false),error)
            }
        })
        
    }
}
