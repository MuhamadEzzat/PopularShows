//
//  ShowDetailsVC.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 27/12/2021.
//

import UIKit

class ShowDetailsVC: UIViewController {

    @IBOutlet weak var showSummaryLbl: UITextView!
    @IBOutlet weak var premieredLbl: UILabel!
    @IBOutlet weak var runtimeLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var langLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var shownameLbl: UILabel!
    
    var showsummary  = ""
    var premiered    = ""
    var runtime      = ""
    var rate         = ""
    var showLanguage = ""
    var showtype     = ""
    var showname     = ""
    var showimgurl   = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSummaryLbl.text = showsummary
        premieredLbl.text   = premiered
        runtimeLbl.text     = runtime
        rateLbl.text        = rate
        langLbl.text        = showLanguage
        typeLbl.text        = showtype
        shownameLbl.text    = showname
        
        self.showImg.downloadImage(url: showimgurl)
        
        let data = Data(showsummary.utf8)
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            self.showSummaryLbl.attributedText = attributedString
        }
    }

}


