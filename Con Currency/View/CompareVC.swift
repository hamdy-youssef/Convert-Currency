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
    lazy var presenter: ComparePresenter = ComparePresenter (view: self)
    var vc: UIViewController!
    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorderAndRadiusForUiComponents()
        NotificationCenter.default.addObserver(self, selector: #selector(handleDataUpdate(_:)), name: Notification.Name("DataUpdated"), object: nil)
    }
    
    @IBAction func compareButtons(_ sender: UIButton) {
        tag = sender.tag
        GoToCurrencyScreen()
    }
    
    @IBAction func combareBtn(_ sender: Any) {
        presenter.amount = amountTextField.text
        presenter.checkAPI()
    }
}
