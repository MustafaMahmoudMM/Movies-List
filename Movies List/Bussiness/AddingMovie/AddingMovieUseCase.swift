//
//  AddingMovietUseCase.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

struct AddingMovieUseCase : UseCase {
    var repository: Repository
    func executeUseCase(requestValues: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void){
        repository.getData(requestValue: requestValues, compilationHandler: compilationHandler)
        
    }
}

struct AddingMovieRequestValues: RequestValues{
    let title: String
    let overview: String
    let date: String
    let poster: Data
}

struct AddingMovieResponseValues: ResponseValues {
    let isSucceeded: Bool
}
