//
//  ViewControllerTableEx.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import Foundation
import UIKit


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowCell
        
        cell.nameLbl.text = datasource?[indexPath.row].show?.name
        cell.linkBtn.setTitle(datasource?[indexPath.row].show?.url, for: .normal)
        cell.premierLbl.text = datasource?[indexPath.row].show?.premiered
        cell.rateLbl.text = "Rating : \(datasource?[indexPath.row].show?.rating?.average ?? 0)"
        cell.runtimeLbl.text = "Runtime : \(datasource?[indexPath.row].show?.runtime ?? 0)"
        
        cell.showImg.downloadImage(url: self.datasource?[indexPath.row].show?.image?.medium ?? "")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 139.0
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = nextStoryboard.instantiateViewController(withIdentifier: "ShowDetailsVC") as! ShowDetailsVC
//        vc.showname = datasource?[indexPath.row].show?.name ?? "N/A"
//        vc.showtype = "Show's Type: \(datasource?[indexPath.row].show?.type ?? "N/A")"
//        vc.rate     = "Rating : \(datasource?[indexPath.row].show?.rating?.average ?? 0)"
//        vc.runtime  = "Runtime : \(datasource?[indexPath.row].show?.runtime ?? 0)"
//        vc.premiered = "Premiered: \(datasource?[indexPath.row].show?.premiered ?? "N/A")"
//        vc.showsummary = datasource?[indexPath.row].show?.summary ?? "N/A"
//        vc.showLanguage = "Show's Language: \(datasource?[indexPath.row].show?.language ?? "N/A")"
//        vc.showimgurl  = self.datasource?[indexPath.row].show?.image?.original ?? ""
//        
//        self.navigationController?.pushViewController(vc, animated: true)
//        
//    }
    
    
}
