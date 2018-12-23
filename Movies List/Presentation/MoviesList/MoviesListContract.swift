//
//  MoviesListContract.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

protocol MoviesListPresenterProtocol : class{
    
    func getRemoteMovies(with pageNumber: String)
    func getLocalMovies()
    
}

protocol MoviesListViewProtocol : class{
    
    func updateRemoteMovies(with movieListModel: MoviesListModel)
    func updateLocalMovies(with movies: [Result])
    func showProgressBar()
    func hideProgressBar()
    
}
