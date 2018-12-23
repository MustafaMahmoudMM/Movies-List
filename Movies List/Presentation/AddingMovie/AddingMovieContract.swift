//
//  AddingMovieContract.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

protocol AddingMoviePresenterProtocol : class{
    
    func saveMovie(title: String, overview: String, date: String, poster: Data)
    
}

protocol AddingMovieViewProtocol : class{
    
    func returnToListView()

}
