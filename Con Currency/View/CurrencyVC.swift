//
//  CurrencyVC.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit
import RxCocoa
import RxSwift


class CurrencyVC: UIViewController {

    @IBOutlet weak var currencyTableView: UITableView!
    @IBOutlet var container: UIView!
    
    let disposeBag = DisposeBag()
    let cellSelectionSubject = PublishSubject<IndexPath>()
    let arrayOfCurrency  = Observable.just(Currency.setCurrenyData())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize.height = 100
        container.sizeToFit()
      
        setTableData()
    }
    func setTableData() {
        arrayOfCurrency
            .bind(to: currencyTableView
                .rx
                .items(cellIdentifier: "currencyCell", cellType: CurrencyTVCell.self)) {
                    (row, currencyTableView, cell) in
                    cell.currencyImage.image = UIImage.init(named: currencyTableView.flag)
                    cell.currencylabel.text = currencyTableView.currency
//                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: cell.bounds.size.width)
                }
                .disposed(by: disposeBag)
        
        currencyTableView
            .rx
            .itemSelected
            .bind(to: cellSelectionSubject)
            .disposed(by: disposeBag)
        
        cellSelectionSubject
            .subscribe(onNext: { indexPath in
                if let cell = self.currencyTableView.cellForRow(at: indexPath) as? CurrencyTVCell {
                    cell.isSelected = true
                    cell.backView.backgroundColor = UIColor(red: 210, green: 213, blue: 224, alpha: 100)
                    
                    guard let currencyName = cell.currencylabel.text, let currencyImage = cell.currencyImage
                    else {return}
                    let currency = Currency(currency: currencyName, exchangeRate: nil, flag: currencyImage.text )
                    UserDefaultsManager.shared () .saveUserData(currency: currency)
                    
                    print("Selected cell at indexPath: \(indexPath)")
                }
            })
            .disposed(by: disposeBag)
        
    
    }

}
