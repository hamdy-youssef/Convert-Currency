//
//  ConvertScreenExtention.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
import UIKit
import RxSwift

extension ConvertVC: ConvertVCProtocoL , UITextFieldDelegate{
    func fetchApiForConvert() {
        let tail = "/pair/\(convertFromBTn.currentTitle!)/\(convertToBtn.currentTitle!)/\(baseAmountTextField.text!)"
        NetworkModel.getDataForConvert(tail: tail) { error, currencyData in
            if let error = error {
                self.showAlert(title: "Wrong", messege: ErrorMessages.somethingWentWrong)
            }else if let currencyData = currencyData {
                let data = String(currencyData.prefix(6))
                DispatchQueue.main.async {
                    [weak self] in
                    guard let self = self else {return}
                    self.targetAmountLabel.text = data
                }
                
            }
        }
    }
    
    func fetcFavoritesCurrencyhData(){
        var myFav: [FavCurrencyRate] = []
        var myCurrency = UserDefaultsManager.shared().loadCurrencyData() ?? ["EGP"]
        NetworkModel.getFavouriteCurrency(tail: "/rates", base: "USD", currenciesName: myCurrency) { error, json in
            if let json = json {
                myFav = json
                DispatchQueue.main.async {
                    [weak self] in
                    guard let self = self else {return}
                    let myCellData = Observable.just(myFav)
                   myCellData
                       .bind(to: self.favoritesTableView
                           .rx
                           .items(cellIdentifier: "favCell", cellType: MyFavoritesCell.self)) {
                               (rw, currencyTableView, cell) in
                               cell.CurrencyName.text = myFav[rw].currency
                               let data = String(myFav[rw].exchangeRate.prefix(6))
                               cell.currencyRate.text = data
                               cell.currencyImage.sd_setImage(with: URL(string: (myFav[rw].flag as? String)!))
                           }
                           .disposed(by: self.disposeBag)
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
    }
    
    func setBorderAndRadiusForUiComponents() {
        
        convertFromBTn.setTitle("USD", for: .normal)
        convertToBtn.setTitle("EGP", for: .normal)
        
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
    
     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if baseAmountTextField.text != "" {
            return true
        } else {
            textField.placeholder = "Enter Valid Value"
            return false 
        }
    }
}
