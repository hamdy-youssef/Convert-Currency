//
//  ConvertScreenExtention.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
import UIKit
import RxSwift

extension ConvertVC: ConvertVCProtocoL {
    func fetchApiForConvert() {
        let tail = "/pair/\(convertFromBTn.currentTitle!)/\(convertToBtn.currentTitle!)/\(baseAmountTextField.text!)"
        NetworkModel.getDataForConvert(tail: tail) { error, currencyData in
            if let error = error {
                print(error.localizedDescription)
            }else if let currencyData = currencyData {
                print("!!!!!!!!!!!!!!")
                let data = String(currencyData.prefix(6))
                DispatchQueue.main.async {
                    [weak self] in
                    guard let self = self else {return}
                    print("222222222222")
                    self.targetAmountLabel.text = data
                }
                
            }
        }
    }
    
    
    func GoToCurrencyScreen(){
         vc = sb.instantiateViewController(withIdentifier: "CurrencyVC") as! CurrencyVC
        self.present(vc, animated: true)
    }
    
    func GoToFavoritesScreen(){
         vc = sb.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
        self.show(vc, sender: nil)
//        self.present(vc, animated: true)
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
    
    func showAlert(title: String, messege: String) {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
