//
//  CompareScreenExtention.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
import UIKit

extension CompareVC: CompareVCProtocoL {
    
    func GoToCurrencyScreen() {
        vc = sb.instantiateViewController(withIdentifier: "CurrencyVC") as! CurrencyVC
       self.present(vc, animated: true)
    }
    func setBorderAndRadiusForUiComponents() {
        for button in Buttons {
            button.layer.borderWidth = 0.2
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.cornerRadius = 20.0
            button.layer.masksToBounds = true
        }
    }
    func showAlert(title: String, messege: String) {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

}
