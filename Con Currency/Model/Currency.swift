//
//  Currency.swift
//  NetWorkLayer
//
//  Created by Hamdy Youssef on 25/08/2023.
//

import Foundation


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
    
    
    enum CodingKeys: String, CodingKey {
        case currency
        case exchangeRate = "exchange_rate"
        case flag
    }
}
