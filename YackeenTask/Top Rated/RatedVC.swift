//
//  RatedVC.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 06/01/2022.
//


import Foundation

import UIKit

class RatedVC: UIViewController, FavoriteDelegate {
    func setFavMovie(check: String) {
        print(check)
    }
    
    func downloadImage(url: String) -> (UIImage) {
        let img = UIImage()
        return img
    }
    
    
    var datasource: _Data?
    @IBOutlet weak var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        
    }


}
