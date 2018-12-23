//
//  AddingMovieLocalDataSource.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddingMovieLocalDataSource: AddingMovieDataSource {
    
    static let sharedInstance = AddingMovieLocalDataSource()
    let apiClient = URLSessionClient.sharedInstance
    
    // MARK: - implement ProfileDataSource Protocol
    
    func addMovie(requestValue: RequestValues,compilationHandler:@escaping (Any?,Error?) -> Void){
        
        let addingMovieRequestValues = requestValue as? AddingMovieRequestValues
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context)
        let newMovie = NSManagedObject(entity: entity!, insertInto: context)
        
        newMovie.setValue(addingMovieRequestValues?.overview, forKey: "overview")
        newMovie.setValue(addingMovieRequestValues?.poster, forKey: "poster")
        newMovie.setValue(addingMovieRequestValues?.date, forKey: "releaseDate")
        newMovie.setValue(addingMovieRequestValues?.title, forKey: "title")
        
        do {
            try context.save()
            compilationHandler(true,nil)
        } catch {
            print("Failed saving")
            compilationHandler(false,nil)
        }
    }
}
