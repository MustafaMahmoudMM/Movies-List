//
//  URLSessionClient.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

struct URLSessionClient: APIClient {
    
    //MARK: Shared Instance
    
    static let sharedInstance =  URLSessionClient()
    
    fileprivate init() {
        
    }
    
    
    func executeGetRequest(url:String,parameters: [String:Any]?,header : [String:String]?,compilationHandler:@escaping (Any?,Error?) -> Void){
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            compilationHandler(data,error)
            }.resume()
    }
}
