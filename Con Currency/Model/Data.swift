//
//  Data.swift
//  NetWorkLayer
//
//  Created by Hamdy Youssef on 20/08/2023.
//

import Foundation


struct CurrencyData {
    var conversionValue: String?
    var coversionValueOne: String?
    var coversionValueTwo: String?
    
    enum CodingKeys: String, CodingKey {
        case conversionValue = "conversionValue"
        case coversionValueOne = "firstConversionValue"
        case coversionValueTwo = "secondConversionValue"
        
    }
}


