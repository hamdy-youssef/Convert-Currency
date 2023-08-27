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
    
    lazy var presenter: ConvertAndComparePresenter = ConvertAndComparePresenter (view: self)
    var vc: UIViewController!
    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorderAndRadiusForUiComponents()
    }
    
    @IBAction func convertFromBtn(_ sender: Any) {
        presenter.goToAnyScreen(viewController: "currency")
    }
    
    @IBAction func convertToTargetOne(_ sender: Any) {
        presenter.goToAnyScreen(viewController: "currency")
    }
    
    @IBAction func convertToTargetTwo(_ sender: Any) {
        presenter.goToAnyScreen(viewController: "currency")
    }
    
}
