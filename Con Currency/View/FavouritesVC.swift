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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favCurrencyArray = UserDefaultsManager.shared().loadCurrencyData() ?? ["EGP"]
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
                    
                    for name in self.favCurrencyArray {
                            if name == cell.currencylabel.text {
                                cell.checkBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                            }
                        }
                    
                }
                .disposed(by: disposeBag)
        
        favoritesTableView
            .rx
            .itemSelected
            .bind(to: cellSelectionSubject)
            .disposed(by: disposeBag)
        
        cellSelectionSubject
            .subscribe(onNext: { indexPath in
                if let cell = self.favoritesTableView.cellForRow(at: indexPath) as? FavoritesTableViewCell {
                    
                    // Cell Selected
                    
                    cell.isSelected = true
                    if cell.checkBtn.currentImage == UIImage(systemName: "checkmark.circle"){
                        cell.checkBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)

                            self.favCurrencyArray.append(cell.currencylabel.text!)
                            UserDefaultsManager.shared().saveCurrencyData(currency: self.favCurrencyArray)
                            print(self.favCurrencyArray)

                    }
                    else {
                            cell.checkBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                            let removeElement = cell.currencylabel.text
                            self.favCurrencyArray.removeAll{$0 == removeElement}
                            UserDefaultsManager.shared().saveCurrencyData(currency:  self.favCurrencyArray)
                            print(self.favCurrencyArray)
                    }
                  
                    print("Selected cell at indexPath: \(indexPath)")
                    print(self.favCurrencyArray)
                }
            })
            .disposed(by: disposeBag)
    }

    @IBAction func closeFavoritesListBtn(_ sender: Any) {
//        convert.fetchData()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        convert.fetchData()
    }
}
