//
//  PopularShow.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import Foundation

struct PopularShow : Codable{
    let id : Int
    let backdrop_path : String
    let original_language : String
    let original_title : String
    let overview : String
    let popularity : Float
    let poster_path : String
    let release_date : String
    let vote_average : Float
    
    
    enum CodingKeys : String, CodingKey  {
        case id
        case backdrop_path
        case original_language
        case original_title
        case overview
        case popularity
        case poster_path
        case release_date
        case vote_average
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path) ?? ""
        popularity = try values.decodeIfPresent(Float.self, forKey: .popularity) ?? 0.0
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title) ?? ""
        overview = try values.decodeIfPresent(String.self, forKey: .overview) ?? ""
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language) ?? ""
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path) ?? ""
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date) ?? ""
        vote_average = try values.decodeIfPresent(Float.self, forKey: .vote_average) ?? 0.0
        
        
    }

}
