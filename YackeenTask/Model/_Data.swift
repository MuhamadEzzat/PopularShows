//
//  PopularShows.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import Foundation

struct _Data : Codable{
    let score : Float
    let show  : PopularShow?
    
    enum CodingKeys : String, CodingKey  {
        case score = "score"
        case show  = "show"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        score = try values.decodeIfPresent(Float.self, forKey: .score) ?? 0.0
        show = try values.decodeIfPresent(PopularShow.self, forKey: .show)
    }

}

