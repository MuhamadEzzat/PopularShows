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
        showURL.host   = "api.tvmaze.com"
        showURL.path   = "/search/shows"
        showURL.queryItems = [URLQueryItem(name: "q", value: "Future")]

        let task = URLSession.shared.dataTask(with: showURL.url!) { data, response, error in
            guard let data = data else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let showdata = try! decoder.decode([_Data].self, from: data)
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


