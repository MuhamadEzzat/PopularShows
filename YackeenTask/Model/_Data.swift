//
//  PopularShows.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import Foundation

struct _Data : Codable{
    let page : Int
    let results  : [PopularShow]?
    
    enum CodingKeys : String, CodingKey  {
        case page
        case results
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page) ?? 0
        results = try values.decodeIfPresent([PopularShow].self, forKey: .results)
    }

}

