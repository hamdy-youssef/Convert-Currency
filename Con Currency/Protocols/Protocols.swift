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

protocol ConvertVCProtocoL: AnyObject {
    func GoToCurrencyScreen()
    func GoToFavoritesScreen()
    func fetchApiForConvert()
    func showAlert(title: String, messege: String)
}

protocol CompareVCProtocoL: AnyObject {
    func GoToCurrencyScreen()
}
