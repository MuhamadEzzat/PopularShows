//
//  FavMovie.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 07/01/2022.
//

import UIKit
import CoreData

class FavMovie: NSManagedObject {
    @NSManaged var original_title:String?
    @NSManaged var release_date:String?
    @NSManaged var poster_path:String?
    @NSManaged var original_language:String?
    @NSManaged var overview:String?
    @NSManaged var vote_average:String?
    @NSManaged var check:String?
    @NSManaged var movieurl:String?
    
}
