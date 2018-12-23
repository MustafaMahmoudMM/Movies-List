//
//  ResultModel.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import Foundation

struct Result : Codable {
    
    let overview : String?
    let posterPath : String?
    let releaseDate : String?
    let title : String?
    let posterData: Data?
    
    enum CodingKeys: String, CodingKey {
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case posterData = "posterData"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        posterData = nil
    }
    
    init(overview: String?, poster: Data?, date: String?, title: String?) {
        self.overview = overview
        self.posterPath = nil
        self.releaseDate = date
        self.title = title
        self.posterData = poster
    }
}
