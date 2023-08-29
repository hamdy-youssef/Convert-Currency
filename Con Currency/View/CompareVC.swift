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
    @IBOutlet var Buttons: [AnyObject]!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var targetOneLabel: UILabel!
    @IBOutlet weak var targetTwoLabel: UILabel!
    
    @IBOutlet var targetOneImage: UIImageView!
    @IBOutlet var targetTwoImage: UIImageView!
    @IBOutlet var fromImage: UIImageView!
    var tag: Int?
//    lazy var presenter: ComparePresenter = ComparePresenter (view: self)
    var vc: UIViewController!
    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorderAndRadiusForUiComponents()
        NotificationCenter.default.addObserver(self, selector: #selector(handleDataUpdate(_:)), name: Notification.Name("DataUpdated"), object: nil)

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
    
    @IBAction func compareButtons(_ sender: UIButton) {
        GoToCurrencyScreen()
    }
    
    @IBAction func combareBtn(_ sender: Any) {
        if amountTextField.text != "" {
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
        }else{
            showAlert(title: "Wrong", messege: "Please Enter The Amount ")
            
        }
    }
    
}
