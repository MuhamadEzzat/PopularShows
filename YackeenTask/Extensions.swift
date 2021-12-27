//
//  Extensions.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 27/12/2021.
//

import Foundation
import UIKit



extension UIImageView{
    func downloadImage(url: String){
        if let imageurl = URL(string: url){
            let task = URLSession.shared.dataTask(with: imageurl) { data, response, error in
                guard let data = data else{
                    return
            }
                
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)!
                }
            }
            task.resume()
        }
    }
}
