//
//  PopularShow.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import Foundation

struct PopularShow : Codable{
    let id : Int
    let url : String
    let name : String
    let type : String
    let language : String
    let status : String
    let runtime : Int
    let premiered : String
    let image : Images?
    let summary : String
    let rating  : Rating?
    
    enum CodingKeys : String, CodingKey  {
        case id = "id"
        case url = "url"
        case name = "name"
        case type = "type"
        case language = "language"
        case status = "status"
        case runtime = "runtime"
        case premiered = "premiered"
        case image = "image"
        case summary = "summary"
        case rating = "rating"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
        language = try values.decodeIfPresent(String.self, forKey: .language) ?? ""
        status = try values.decodeIfPresent(String.self, forKey: .status) ?? ""
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime) ?? 0
        premiered = try values.decodeIfPresent(String.self, forKey: .premiered) ?? ""
        image = try values.decodeIfPresent(Images.self, forKey: .image)
        summary = try values.decodeIfPresent(String.self, forKey: .summary) ?? ""
        rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
        
    }

}
