//
//  UserDefaultManager.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
class UserDefaultsManager {
    
    private static let sharedInstance = UserDefaultsManager ()
    
    static func shared () -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    private init() {}
    
    func saveCurrencyData(currency: Currency) {
        let encoder = JSONEncoder ()
        if let encodedCurrency = try? encoder.encode (currency) {
            let def = UserDefaults.standard
            def.set(encodedCurrency, forKey: "currency")
        }
    }
    
    func loadCurrencyData() -> Currency? {
        let def = UserDefaults.standard
        if let savedCurrency = def.object(forKey: "currency") as? Data {
            let decoder = JSONDecoder ( )
            if let loadedCurrency = try? decoder.decode (Currency.self, from: savedCurrency) {
                return loadedCurrency
            }
        }
        return nil
    }
}
