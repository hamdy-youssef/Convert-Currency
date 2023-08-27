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
   
    @IBOutlet var checkBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        // Configure the view for the selected state
    }

}
