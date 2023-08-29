//
//  MyFavoritesCell.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 28/08/2023.
//

import UIKit

class MyFavoritesCell: UITableViewCell {

    @IBOutlet var currencyRate: UILabel!
    @IBOutlet var CurrencyName: UILabel!
    @IBOutlet var currencyImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
