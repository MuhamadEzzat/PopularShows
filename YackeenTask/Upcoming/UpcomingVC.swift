//
//  UpcomingVC.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 06/01/2022.
//

import Foundation

import UIKit

class UpcomingVC: UIViewController, FavoriteDelegate {
    func downloadImage(url: String) -> (UIImage) {
        let img = UIImage()
        return img
    }
    
    func setFavMovie(check: String) {
        print(check)
    }
    
    
    var datasource: _Data?

    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        
    }


}
