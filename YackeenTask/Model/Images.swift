//
//  Images.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import Foundation

struct Images : Codable{
    let medium : String
    let original  : String
    
    enum CodingKeys : String, CodingKey  {
        case medium = "medium"
        case original  = "original"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        medium = try values.decodeIfPresent(String.self, forKey: .medium) ?? ""
        original = try values.decodeIfPresent(String.self, forKey: .original) ?? ""
    }

}
