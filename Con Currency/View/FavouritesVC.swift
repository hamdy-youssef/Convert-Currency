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
    let arrayOfCurrency  = Observable.just([Currency(currency: "EGP", exchangeRate: nil , flag: "EGP"),
                                            Currency(currency: "USD", exchangeRate: nil, flag: "USD"),
                                            Currency(currency: "EUR", exchangeRate: nil, flag: "EUR"),
                                            Currency(currency: "GBP", exchangeRate: nil, flag: "GBP"),
                                            Currency(currency: "JPY", exchangeRate: nil, flag: "JPY"),
                                            Currency(currency: "SAR", exchangeRate: nil, flag: "SAR"),
                                            Currency(currency: "AED", exchangeRate: nil, flag: "AED"),
                                            Currency(currency: "KWD", exchangeRate: nil, flag: "KWD"),
                                            Currency(currency: "BHD", exchangeRate: nil, flag: "BHD"),
                                            Currency(currency: "OMR", exchangeRate: nil, flag: "OMR"),
                                            Currency(currency: "QAR", exchangeRate: nil, flag: "QAR")])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setTableData()
    }
    

    func setTableData() {
        arrayOfCurrency
            .bind(to: favoritesTableView
                .rx
                .items(cellIdentifier: "favCell", cellType: FavoritesTableViewCell.self)) {
                    (row, currencyTableView, cell) in
                    cell.currencyImage.image = UIImage.init(named: currencyTableView.flag)
                    cell.currencylabel.text = currencyTableView.currency
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: cell.bounds.size.width)
                }
                .disposed(by: disposeBag)
        
        
    }


}
