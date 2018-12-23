//
//  APIClient.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

protocol APIClient{
    
    func executeGetRequest(url:String,parameters: [String:Any]?,header : [String:String]?,compilationHandler:@escaping (Any?,Error?) -> Void)
}
