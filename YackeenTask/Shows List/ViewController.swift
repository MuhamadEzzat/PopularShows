//
//  ViewController.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import UIKit

class ViewController: UIViewController, FavoriteDelegate {
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

