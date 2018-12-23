//
//  Factory.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

class Factory {
    
    static func getMoviesListUseCase() -> MoviesListUseCase{
        let repository = MoviesListRepository.getMoviesListRepository(remoteDataSource: MoviesListRemoteDataSource.sharedInstance)
        return MoviesListUseCase(repository: repository)
    }
    
    static func getAddingMovieUseCase() -> AddingMovieUseCase{
        let repository = AddingMovieRepository.getAddingMovieRepository(localDataSource: AddingMovieLocalDataSource.sharedInstance)
        return AddingMovieUseCase(repository: repository)
    }
}
