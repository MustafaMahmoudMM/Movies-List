//
//  MoviesListlocalDataSource.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/23/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MoviesListLocalDataSource: MoviesListDataSource {
    
    static let sharedInstance = MoviesListLocalDataSource()
    let apiClient = URLSessionClient.sharedInstance
    
    // MARK: - implement ProfileDataSource Protocol
    
    func getMoviesList(requestValue: RequestValues,compilationHandler:@escaping (Any?,Error?) -> Void){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        //3
        do {
            let movies: [NSManagedObject] = try managedContext.fetch(fetchRequest)
            var result = [Result]()
            for movie in movies {
                result.append(Result(overview: movie.value(forKeyPath: "overview") as? String,
                                     poster: movie.value(forKeyPath: "poster") as? Data, date: movie.value(forKeyPath: "releaseDate") as? String, title: movie.value(forKeyPath: "title") as? String))
            }
            
            let moviesListModel = MoviesListModel(results: result)
            compilationHandler(MoviesListResponseValues(moviesList: moviesListModel),nil)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            compilationHandler(nil,error)
        }
        
    }
}
