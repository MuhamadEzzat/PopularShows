//
//  ShowDetailsVC.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 27/12/2021.
//

import UIKit

protocol FavoriteDelegate{
    func setFavMovie(check: String)
}

class ShowDetailsVC: UIViewController, FavoriteDelegate {
    func setFavMovie(check: String) {
        print(check)
    }
    

    @IBOutlet weak var showSummaryLbl: UITextView!
    @IBOutlet weak var premieredLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var langLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var ratebtn: UIButton!
    @IBOutlet weak var shownameLbl: UILabel!
    
    var showsummary  = ""
    var premiered    = ""
    var runtime      = ""
    var rate         = ""
    var showLanguage = ""
    var showtype     = ""
    var showname     = ""
    var showimgurl   = ""
    var movieurl     = ""
    var MovieContnet : PopularShow?
    
    var favdelegate : FavoriteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.favdelegate = self
        showSummaryLbl.text = showsummary
        premieredLbl.text   = "Release Date: \(premiered)"
        rateLbl.text        = "Vote Average : \(rate)"
        langLbl.text        = "Movie's Language: \(showLanguage)"
        typeLbl.text        = showtype
        shownameLbl.text    = showname
        
        self.showImg.downloadImage(url: "https://image.tmdb.org/t/p/w185" + showimgurl)
        
        
        let data = Data(showsummary.utf8)
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            self.showSummaryLbl.attributedText = attributedString
        }
    }
    
   
    @IBAction func favBtn(_ sender: Any) {

        self.ratebtn.setImage(UIImage(named: "star.fill"), for: .normal)
        self.ratebtn.imageView?.image = UIImage(named: "star.fill")
        
        let alert = UIAlertController(title: "", message: "Movie Added to Favorite list", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        MovieCoreData.addUserData(original_title: self.showname, release_date: self.premiered, poster_path: "https://image.tmdb.org/t/p/w185" + self.showimgurl, original_language: self.showLanguage, overview: self.showsummary, vote_average: String(self.rate), check: "true")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

        
        favdelegate?.setFavMovie(check: "true")
    }
    
}


