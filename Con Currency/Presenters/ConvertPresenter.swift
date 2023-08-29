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
    
    func checkAPI() {
        if amount != "" {
            self.view?.fetchApiForConvert()
        }else {
            self.view?.showAlert(title: "Wrong", message: "Please Enter Amount")
        }
    }
}
