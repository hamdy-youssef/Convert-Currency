//
//  FavoritesTableViewCell.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var currencylabel: UILabel!
    @IBOutlet weak var currencyImage: UIImageView!
    @IBOutlet var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        
        backView.layer.borderWidth = 0.2
        backView.layer.borderColor = UIColor.gray.cgColor
        backView.layer.cornerRadius = 10 // You can adjust this value as needed
        backView.layer.masksToBounds = true
       
        
        backView.layer.masksToBounds = false
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.2
        backView.layer.shadowOffset = CGSize(width: 2, height: 2)
        backView.layer.shadowRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        // Configure the view for the selected state
    }

}
