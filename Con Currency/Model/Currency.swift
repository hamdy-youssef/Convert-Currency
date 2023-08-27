//
//  Currency.swift
//  NetWorkLayer
//
//  Created by Hamdy Youssef on 25/08/2023.
//

import Foundation
import RxSwift

struct Instruction: Codable {
    let baseCurrency: String
    let favourites: [Currency]
    
    enum CodingKeys: String, CodingKey {
        case baseCurrency = "base_currency"
        case favourites
    }
}

struct Currency: Codable {
    let currency: String
    let exchangeRate: String?
    let flag: String
    
    static func setCurrenyData() -> [Currency]{
        let arrayOfCurrency  = [Currency(currency: "EGP", exchangeRate: nil , flag: "EGP"),
                                                 Currency(currency: "USD", exchangeRate: nil, flag: "USD"),
                                                 Currency(currency: "EUR", exchangeRate: nil, flag: "EUR"),
                                                 Currency(currency: "GBP", exchangeRate: nil, flag: "GBP"),
                                                 Currency(currency: "JPY", exchangeRate: nil, flag: "JPY"),
                                                 Currency(currency: "SAR", exchangeRate: nil, flag: "SAR"),
                                                 Currency(currency: "AED", exchangeRate: nil, flag: "AED"),
                                                 Currency(currency: "KWD", exchangeRate: nil, flag: "KWD"),
                                                Currency(currency: "BHD", exchangeRate: nil, flag: "BHD"),
                                                Currency(currency: "OMR", exchangeRate: nil, flag: "OMR"),
                                                Currency(currency: "QAR", exchangeRate: nil, flag: "QAR")]
        return arrayOfCurrency
    }
    
    enum CodingKeys: String, CodingKey {
        case currency
        case exchangeRate = "exchange_rate"
        case flag
    }
}
