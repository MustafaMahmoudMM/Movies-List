//
//  MoviesListPresenter.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

class MoviesListPresenter: MoviesListPresenterProtocol{
    
    
    weak var view: MoviesListViewProtocol?
    var moviesListUseCase: MoviesListUseCase?
    
    required init(view: MoviesListViewProtocol) {
        self.view = view
        moviesListUseCase = Factory.getMoviesListUseCase()
        
    }
    
    func getRemoteMovies(with pageNumber: String) {
        if !pageNumber.isEmpty{
            self.view?.showProgressBar()
            
            moviesListUseCase?.executeUseCase(requestValues: MoviesListRequestValues(pageNumber: pageNumber), compilationHandler: { (moviesList, error) in
                self.view?.hideProgressBar()
                if let responseValue = moviesList as? MoviesListResponseValues {
                    self.view?.updateRemoteMovies(with: responseValue.moviesList)
                }
            })
        }
    }
    
    func getLocalMovies() {
        self.view?.showProgressBar()
        
        moviesListUseCase?.executeUseCase(requestValues: MoviesListRequestValues(pageNumber: "-1"), compilationHandler: { (moviesList, error) in
            self.view?.hideProgressBar()
            if let responseValue = moviesList as? MoviesListResponseValues, let movies = responseValue.moviesList.results  {
                self.view?.updateLocalMovies(with: movies)
            }
        })
    }
    
    
}
