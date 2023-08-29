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
    var myFav: [FavCurrencyRate] = []
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
//        print("hamdy")
       
        
//        NetworkModel.getFavouriteCurrency(tail: "/rates", base: "USD", currenciesName: ["USD", "EGP"]) { error, json in
//            print("hamdy 1")
//            if let json = json {
//                print("hamdy 2")
//                self.myFav = json
//            }
//            print(self.myFav[1].currency)
//        }
        // Override point for customization after application launch.
        return true
    }


}

