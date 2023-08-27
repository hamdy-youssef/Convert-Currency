//
//  AppDelegate.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
//        NetworkModel.getDataForConvert(tail: "/pair/EGP/USD/QAR/1", completion: <#T##(Error?, String?) -> Void##(Error?, String?) -> Void##(_ error: Error?, _ currencyData: String?) -> Void#>)
        // Override point for customization after application launch.
        return true
    }


}

