//
//  ConvertVC.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit
import RxCocoa
import RxSwift



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
    
    let disposeBag = DisposeBag()
    lazy var presenter: ConvertAndComparePresenter = ConvertAndComparePresenter (view: self)
    var vc: UIViewController!
    let sb = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setBorderAndRadiusForUiComponents()
    }

    @IBAction func addToFavoriteBtn(_ sender: Any) {
        presenter.goToAnyScreen(viewController: "favorite")
    }
    
    @IBAction func convertFromBtn(_ sender: Any) {
        presenter.goToAnyScreen(viewController: "currency")
    }
    
    @IBAction func convertToBtn(_ sender: Any) {
        presenter.goToAnyScreen(viewController: "currency")
        
    }
}


