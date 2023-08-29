//
//  ConvertPresenter.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//
import Foundation
import UIKit

class ConvertPresenter {
    
    weak var view: ConvertVCProtocoL?
    weak var screen: ConvertVC?
    var amount: String?
    init (view: ConvertVCProtocoL) {
        self.view = view
    }
    
    func goToAnyScreen(viewController: String) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        switch viewController {
        case "currency":
            self.view?.GoToCurrencyScreen()
        case "favorite":
            self.view?.GoToFavoritesScreen()
        default:
            break
        }
    }
    
    func IsNumberWrittenInArabicOrEnglish(_ input: String) -> Bool {
        let arabicNumbers = CharacterSet(charactersIn: "٠١٢٣٤٥٦٧٨٩")
        let containsArabicNumbers = input.rangeOfCharacter(from: arabicNumbers) != nil
        if containsArabicNumbers {
            self.view?.showAlert(title: "Wrong", message: "Please Enter Number In English")
        }
        
        return containsArabicNumbers
        
    }
    
    func checkAPI() {
        if amount != "" && !IsNumberWrittenInArabicOrEnglish(amount!) {
            self.view?.fetcFavoritesCurrencyhData()
            self.view?.fetchApiForConvert()
        }else {
            self.view?.showAlert(title: "Wrong", message: "Please Enter Amount")
        }
    }
}

