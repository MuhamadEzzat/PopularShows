//
//  FavVC.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 06/01/2022.
//

import Foundation

import UIKit

class FavVC: UIViewController, FavoriteDelegate {
    
    
    func downloadImage(url: String) -> (UIImage) {
        let img = UIImage()
        return img
    }
    
    
    var datasource = [FavMovie]()

    @IBOutlet weak var favLbl: UILabel!
    @IBOutlet weak var tbl: UITableView!
    
    var favdelegate : FavoriteDelegate?
    func setFavMovie(check: String) {
        self.datasource = MovieCoreData.getMovieData().0
        self.tbl.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        getdata()
        favdelegate = self
        self.datasource = MovieCoreData.getMovieData().0
        if datasource.count == 0 {
            self.favLbl.isHidden = false
        }else{
            self.favLbl.isHidden = true
        }
        
        let contentOffset = self.tbl.contentOffset
        self.tbl.reloadData()
        self.tbl.layoutIfNeeded()
        self.tbl.setContentOffset(contentOffset, animated: false)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)

    }
    
    
    @objc func loadList(notification: NSNotification){
        //load data here
        self.tbl.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.datasource = MovieCoreData.getMovieData().0
        if datasource.count == 0 {
            self.favLbl.isHidden = false
        }else{
            self.favLbl.isHidden = true
        }
        
        self.tbl.reloadData()
    }


}
