//
//  FavTableViewEx.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 06/01/2022.
//

import Foundation
import UIKit


extension FavVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowCell
        
        cell.nameLbl.text = datasource[indexPath.row].original_title
//        cell.link = "https://api.themoviedb.org/3/movie/popular" + (datasource[indexPath.row].poster_path)!
//        cell.linkBtn.setTitle("https://api.themoviedb.org/3/movie/popular" + (datasource?[indexPath.row].backdrop_path)!, for: .normal)

        cell.premierLbl.text = (datasource[indexPath.row].release_date)
        cell.rateLbl.text = "Rating : \(datasource[indexPath.row].vote_average ?? "")"

        cell.showImg.downloadImage(url:(self.datasource[indexPath.row].poster_path)!)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 139.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = nextStoryboard.instantiateViewController(withIdentifier: "ShowDetailsVC") as! ShowDetailsVC
        
        vc.favdelegate = self
        vc.showname = datasource[indexPath.row].original_title ?? "N/A"
        vc.rate     = "\(datasource[indexPath.row].vote_average ?? "")"
        vc.premiered = "\(datasource[indexPath.row].release_date ?? "N/A")"
        vc.showsummary = datasource[indexPath.row].overview ?? "N/A"
        vc.showLanguage = "\(datasource[indexPath.row].original_language ?? "N/A")"
        vc.showimgurl  = self.datasource[indexPath.row].poster_path ?? ""
//        vc.movieurl  = "https://image.tmdb.org/t/p/w185" + (datasource?.results?[indexPath.row].backdrop_path)!
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
