//
//  ViewControllerEx.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import Foundation
import UIKit


extension ViewController{
    
    func getdata(){
        
        var showURL = URLComponents()
    
        showURL.scheme = "http"
        showURL.host   = "api.themoviedb.org"
        showURL.path   = "/3/movie/popular"
        showURL.queryItems = [URLQueryItem(name: "api_key", value: "837aa67b269303622a476bbe24283a57")]

        let task = URLSession.shared.dataTask(with: showURL.url!) { data, response, error in
            guard let data = data else{
                return
            }
            print(data, "Sasdffq")
            do{
                let decoder = JSONDecoder()
                let showdata = try! decoder.decode(_Data.self, from: data)
                
                self.datasource = showdata
                DispatchQueue.main.async {
                    self.tbl.reloadData()
                }
                
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
}


