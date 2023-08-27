//
//  ConvertPresenter.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
import UIKit

class ConvertAndComparePresenter {
    weak var view: ConvertAndCompareVCProtocoL?
    init (view: ConvertAndCompareVCProtocoL) {
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
    
}
