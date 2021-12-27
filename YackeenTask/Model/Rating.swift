//
//  Rating.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import Foundation

struct Rating : Codable{
    let average : Int
    
    enum CodingKeys : String, CodingKey  {
        case average = "average"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        average = try values.decodeIfPresent(Int.self, forKey: .average) ?? 0
    }

}
