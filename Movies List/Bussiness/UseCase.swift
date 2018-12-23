//
//  UseCase.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

protocol UseCase {
    func executeUseCase(requestValues: RequestValues, compilationHandler:@escaping (ResponseValues?,Error?) -> Void)
    
    
}

protocol RequestValues {
    
}


protocol ResponseValues {
    
}

struct GenricResponseValues: ResponseValues {
    let result: String
}
