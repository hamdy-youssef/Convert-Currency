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
                self.showAlert(title: "Wrong", message: ErrorMessages.somethingWentWrong)
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
    
    @objc func handleDataUpdate(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let data = userInfo["data"] as? String,
           let image = userInfo["image"] as? UIImage {
            switch tag {
            case 1:
                fromBtn.setTitle(data, for: .normal)
                fromImage.image = image
            case 2:
                targetOneBtn.setTitle(data, for: .normal)
                targetOneImage.image = image
            case 3:
                targetTwoBtn.setTitle(data, for: .normal)
                targetTwoImage.image = image
            default:
                return
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
}
