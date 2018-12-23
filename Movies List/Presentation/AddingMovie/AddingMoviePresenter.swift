//
//  AddingMoviePresenter.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

class AddingMoviePresenter: AddingMoviePresenterProtocol{
    
    weak var view: AddingMovieViewProtocol?
    var addingMovieUseCase: AddingMovieUseCase?
    
    required init(view: AddingMovieViewProtocol) {
        self.view = view
        addingMovieUseCase = Factory.getAddingMovieUseCase()
        
    }
    
    func saveMovie(title: String, overview: String, date: String, poster: Data) {
        addingMovieUseCase?.executeUseCase(requestValues: AddingMovieRequestValues(title: title, overview: overview, date: date, poster: poster), compilationHandler: { (isSucceeded, error) in
            if let responseValue = isSucceeded as? AddingMovieResponseValues, responseValue.isSucceeded {
                self.view?.returnToListView()
            }
        })
    }
    
}
