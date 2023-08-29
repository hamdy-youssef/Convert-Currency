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
    func fetchApiForCompare() {
        let tail = "/compare/\(fromBtn.currentTitle!)/\(targetOneBtn.currentTitle!)/\(targetTwoBtn.currentTitle!)/\(amountTextField.text!)"
        NetworkModel.getDataForCompare(tail: tail) { error, valueOne, valueTwo in
            if let error = error {
                print(error.localizedDescription)
            }else {
                let firstValue = String(valueOne!.prefix(6))
                let secondValue = String(valueTwo!.prefix(6))
                DispatchQueue.main.async {
                    [weak self] in
                    guard let self = self else {return}
                    self.targetOneLabel.text = firstValue
                    self.targetTwoLabel.text = secondValue
                }
                
            }
            
        }
    }
    func setBorderAndRadiusForUiComponents() {
        fromBtn.setTitle("USD", for: .normal)
        targetOneBtn.setTitle("EGP", for: .normal)
        targetTwoBtn.setTitle("EUR", for: .normal)
        
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
