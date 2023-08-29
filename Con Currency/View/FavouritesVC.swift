//
//  FavouritesVC.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit
import RxCocoa
import RxSwift

class FavouritesVC: UIViewController {

    
    @IBOutlet var favoritesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    let cellSelectionSubject = PublishSubject<IndexPath>()
    let arrayOfCurrency  = Observable.just(Currency.setCurrenyData())
    let convert: ConvertVC = ConvertVC()
    var favCurrencyArray: [String] = ["EGP"]
    lazy var presenter: FavoritesPresenter = FavoritesPresenter (view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favCurrencyArray = UserDefaultsManager.shared().loadCurrencyData() ?? ["EGP"]
        setTableData()
    }
    
    @IBAction func closeFavoritesListBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
