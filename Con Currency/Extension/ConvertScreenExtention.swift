//
//  ConvertScreenExtention.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
import UIKit

extension ConvertVC: ConvertAndCompareVCProtocoL {
    
    func GoToCurrencyScreen(){
        vc = sb.instantiateViewController(withIdentifier: "CurrencyVC") as! CurrencyVC
        self.present(vc, animated: true)
    }
    
    func GoToFavoritesScreen(){
         vc = sb.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
        self.present(vc, animated: true)
    }
    
    func setBorderAndRadiusForUiComponents() {
        for button in Buttons {
            button.layer.borderWidth = 0.2
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.cornerRadius = 20.0
            button.layer.masksToBounds = true
        }
        favotiteBtn.layer.borderWidth = 0.7
    }
}
