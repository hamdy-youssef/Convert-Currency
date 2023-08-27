//
//  Data.swift
//  NetWorkLayer
//
//  Created by Hamdy Youssef on 20/08/2023.
//

import Foundation

struct ConCurrency {
    var currencies: [ConCurrency]
}

struct CurrencyData {
    var baseCode: String = ""
    var targetCode: String = ""
    var conversionValue: String = ""
    var coversionValueOne: String = ""
    var coversionValueTwo: String = ""
    
    enum CodingKeys: String, CodingKey {
        case baseCode = "base_code"
        case targetCode = "target_code"
        case conversionRate = "conversion_value"
        case coversionValueOne = "first_Conversion_value"
        case coversionValueTwo = "second_Conversion_valu"
        
    }
}


