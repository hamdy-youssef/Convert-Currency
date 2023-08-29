//
//  Bundle+unitTest.swift
//  Con CurrencyTests
//
//  Created by Hamdy Youssef on 29/08/2023.
//

import Foundation

extension Bundle {
    public class var unitTest: Bundle {
        return Bundle(for: NetworkModelTests.self)
    }
}
