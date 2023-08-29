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
                self.showAlert(title: "Wrong", message: ErrorMessages.somethingWentWrong)
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
        NetworkModel.getFavouriteCurrency(tail: "/rates", base: convertFromBTn.currentTitle!, currenciesName: myCurrency) { error, json in
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
    
    @objc func handleDataUpdate(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let data = userInfo["data"] as? String,
           let image = userInfo["image"] as? UIImage {
            switch tag {
            case 1:
                convertFromBTn.setTitle(data, for: .normal)
                convertFromImage.image = image
            case 2:
                convertToBtn.setTitle(data, for: .normal)
                convertToImage.image = image
            default:
                return
            }
        }
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
    
     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if baseAmountTextField.text != "" {
            return true
        } else {
            textField.placeholder = "Enter Valid Value"
            return false 
        }
    }
}
