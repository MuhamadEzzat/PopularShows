//
//  UpcomingTableViewEx.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 06/01/2022.
//

import Foundation
import UIKit


extension UpcomingVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowCell
        
        cell.nameLbl.text = datasource?.results?[indexPath.row].original_title

        cell.premierLbl.text = (datasource?.results?[indexPath.row].release_date)
        cell.rateLbl.text = "Rating : \(datasource?.results?[indexPath.row].vote_average ?? 0.0)"

        cell.showImg.downloadImage(url:  "https://image.tmdb.org/t/p/w185" + ((self.datasource?.results?[indexPath.row].poster_path)!))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 139.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = nextStoryboard.instantiateViewController(withIdentifier: "ShowDetailsVC") as! ShowDetailsVC
        
//        vc.favdelegate = self
        vc.showname = datasource?.results?[indexPath.row].original_title ?? "N/A"
//        vc.showtype = "Show's Type: \(datasource?.results?[indexPath.row]. ?? "N/A")"
        vc.rate     = "\(datasource?.results?[indexPath.row].vote_average ?? 0.0)"
        vc.premiered = "\(datasource?.results?[indexPath.row].release_date ?? "N/A")"
        vc.showsummary = datasource?.results?[indexPath.row].overview ?? "N/A"
        vc.showLanguage = "\(datasource?.results?[indexPath.row].original_language ?? "N/A")"
        vc.showimgurl  = self.datasource?.results?[indexPath.row].poster_path ?? ""
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
