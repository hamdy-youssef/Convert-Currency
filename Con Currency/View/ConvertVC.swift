//
//  ConvertVC.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage


class ConvertVC: UIViewController {
    
    @IBOutlet weak var favotiteBtn: UIButton!
    @IBOutlet var Buttons: [AnyObject]!
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    @IBOutlet weak var baseAmountTextField: UITextField!
    @IBOutlet weak var targetAmountLabel: UILabel!
    @IBOutlet var convertFromBTn: UIButton!
    @IBOutlet var convertToBtn: UIButton!
    @IBOutlet var convertFromImage: UIImageView!
    @IBOutlet var convertToImage: UIImageView!
    var tag: Int?
    
    
    
    
    let disposeBag = DisposeBag()
    
    lazy var presenter: ConvertPresenter = ConvertPresenter (view: self)
    var vc: UIViewController!
    let sb = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorderAndRadiusForUiComponents()
        baseAmountTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(handleDataUpdate(_:)), name: Notification.Name("DataUpdated"), object: nil)
    }
    
    @IBAction func convertButtons(_ sender: UIButton) {
        tag = sender.tag
        presenter.goToAnyScreen(viewController: "currency")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoritesTableView.delegate = nil
        favoritesTableView.dataSource = nil
        fetcFavoritesCurrencyhData()
    }
   
    @IBAction func addToFavoriteBtn(_ sender: Any) {
        presenter.goToAnyScreen(viewController: "favorite")
    }
    
    @IBAction func convertButton(_ sender: Any) {
        presenter.amount = baseAmountTextField.text
        favoritesTableView.delegate = nil
        favoritesTableView.dataSource = nil
        presenter.checkAPI()
    }
 
}

