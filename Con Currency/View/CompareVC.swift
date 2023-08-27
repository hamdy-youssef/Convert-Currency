//
//  CompareVC.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit

class CompareVC: UIViewController {
    
    @IBOutlet weak var fromBtn: UIButton!
    
    @IBOutlet weak var targetOneBtn: UIButton!
    
    @IBOutlet weak var targetTwoBtn: UIButton!
    
    @IBOutlet var Buttons: [UIButton]!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var targetOneLabel: UILabel!
    
    @IBOutlet weak var targetTwoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorderAndRadiusForUiComponents()
    }
    
    func setBorderAndRadiusForUiComponents() {
        
        let paddingView = UIView(frame: CGRectMake(0, 0,  15, self.targetOneLabel.frame.height))
       
        
        targetOneLabel.layer.borderWidth = 0.2
        targetOneLabel.layer.borderColor = UIColor.gray.cgColor
        targetOneLabel.layer.cornerRadius = 20 // You can adjust this value as needed
        targetOneLabel.layer.masksToBounds = true
        targetTwoLabel.layer.borderWidth = 0.2
        targetTwoLabel.layer.borderColor = UIColor.gray.cgColor
        targetTwoLabel.layer.cornerRadius = 20 // You can adjust this value as needed
        targetTwoLabel.layer.masksToBounds = true
        
        for button in Buttons {
            button.layer.borderWidth = 0.2
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.cornerRadius = 20.0
        }
        amountTextField.layer.borderWidth = 0.2
        amountTextField.layer.borderColor = UIColor.gray.cgColor
        amountTextField.layer.cornerRadius = 20 // You can adjust this value as needed
        amountTextField.layer.masksToBounds = true
        
    }
    
    
    
}
