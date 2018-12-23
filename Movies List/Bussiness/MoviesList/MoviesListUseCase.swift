//
//  MoviesListUseCase.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

struct MoviesListUseCase : UseCase {
    var repository: Repository
    func executeUseCase(requestValues: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void){
        repository.getData(requestValue: requestValues, compilationHandler: compilationHandler)
        
    }
}

struct MoviesListRequestValues: RequestValues{
    let pageNumber: String
}

struct MoviesListResponseValues: ResponseValues {
    let moviesList: MoviesListModel
}
