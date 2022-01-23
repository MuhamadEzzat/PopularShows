//
//  ShowCell.swift
//  YackeenTask
//
//  Created by Mohamed Ezzat on 26/12/2021.
//

import UIKit

class ShowCell: UITableViewCell {

    @IBOutlet weak var premierLbl: UILabel!
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var runtimeLbl: UILabel!
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var rateLbl: UILabel!
    
    var link = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func openLink(){
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }

}
