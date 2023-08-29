//
//  Protocols.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
import UIKit

protocol HomeVCProtocoL: AnyObject {
    func showConvertScreen()
    func showCompareScreen()
}

protocol ConvertVCProtocoL: AnyObject, UIViewController{
    func GoToCurrencyScreen()
    func GoToFavoritesScreen()
    func fetchApiForConvert()
//    func showAlert(title: String, messege: String)
}

protocol CompareVCProtocoL: AnyObject, UIViewController {
    func GoToCurrencyScreen()
    func fetchApiForCompare()
//    func showAlert(title: String, messege: String)
}

protocol FavoritesVCProtocoL: AnyObject {
    func saveFavorite(cell: FavoritesTableViewCell)
    func removeFavrite(cell: FavoritesTableViewCell)
}
