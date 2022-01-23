//
//  MovieCoreData.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 07/01/2022.
//

import UIKit
import CoreData

class MovieCoreData: NSObject {
    class func addUserData(original_title:String, release_date:String, poster_path:String, original_language:String, overview:String,  vote_average:String, check: String){
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            
            let myItem = NSEntityDescription.insertNewObject(forEntityName: "FavMovie", into: managedObjectContext) as! FavMovie
            
            myItem.original_title  = original_title
            myItem.release_date = release_date
            myItem.poster_path = poster_path
            myItem.original_language    = original_language
            myItem.overview  = overview
            myItem.vote_average  = vote_average
            myItem.check = check
            
            do {
                try managedObjectContext.save()
                print("Ya rab ne5las")
                
            } catch { // Replace this implementation with code to handle the error appropriately. // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }//end of check for managed object
    }
    
    class func getMovieData()->([FavMovie], String, String, String, String, String, String, String){
        var UserDataArr:[FavMovie] = []
        
        var original_title  = ""
        var release_date = ""
        var poster_path = ""
        var original_language = ""
        var overview  = ""
        var vote_average  = ""
        var check = ""
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavMovie")
            
            // Add Sort Descriptor
            
            let sortDescriptorImage = NSSortDescriptor(key: "original_title", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptorImage]
            
            let sortDescriptorPrice = NSSortDescriptor(key: "release_date", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptorPrice]
            
            let sortDescriptorName = NSSortDescriptor(key: "poster_path", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptorName]
            
            let sortDescriptoremail = NSSortDescriptor(key: "original_language", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptoremail]
            
            let sortDescriptorpass = NSSortDescriptor(key: "overview", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptorpass]
            
            let sortDescriptoraltPhone = NSSortDescriptor(key: "vote_average", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptoraltPhone]
            
            let sortDescriptordelivery = NSSortDescriptor(key: "check", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptordelivery]
            
            
            do {
                UserDataArr = try managedObjectContext.fetch(FavMovie.fetchRequest()) as! [FavMovie]
                for i in UserDataArr{
                    original_title    = i.original_title!
                    original_language   = i.original_title!
                    poster_path    = i.poster_path!
                    check     = i.check!
                    overview     = i.overview!
                    release_date = i.release_date!
                    vote_average = i.vote_average!
                }
            } catch {
                //print("Failed to retrieve record")
                //print(error)
            }
        }
        return (UserDataArr, original_title, original_language, poster_path, vote_average, check, release_date, overview)
    }
    
    class func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
