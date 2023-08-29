//
//  CurrencyTVCell.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit

class CurrencyTVCell: UITableViewCell {

    @IBOutlet weak var currencylabel: UILabel!
    @IBOutlet weak var currencyImage: UIImageView!
    @IBOutlet var backView: UIView!
    
    @IBOutlet var leftSideView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leftSideView.isHidden = true
        
        backView.layer.borderWidth = 0.2
        backView.layer.borderColor = UIColor.gray.cgColor
        backView.layer.cornerRadius = 10 
        backView.layer.masksToBounds = true
        
        leftSideView.layer.borderWidth = 0.2
        leftSideView.layer.borderColor = UIColor.gray.cgColor
        leftSideView.layer.cornerRadius = 3
        leftSideView.layer.masksToBounds = true
        
        backView.layer.masksToBounds = false
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.2
        backView.layer.shadowOffset = CGSize(width: 2, height: 2)
        backView.layer.shadowRadius = 4
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

    }

}
