//
//  Protocols.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation

protocol HomeVCProtocoL: AnyObject {
    func showConvertScreen()
    func showCompareScreen()
}

protocol ConvertAndCompareVCProtocoL: AnyObject {
    func GoToCurrencyScreen()
    func GoToFavoritesScreen()
}
