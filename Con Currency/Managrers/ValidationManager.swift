//
//  ValidationManager.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 28/08/2023.
//

import Foundation
class ValidationManager {
    
    // MARK: - Singleton
    private static let sharedInstance = ValidationManager ()
    static func shared() -> ValidationManager {
        return ValidationManager.sharedInstance
    }
    
    private init() {}

}
