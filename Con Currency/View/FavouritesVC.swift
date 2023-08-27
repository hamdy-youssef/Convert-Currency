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
        
        favoritesTableView
            .rx
            .itemSelected
            .bind(to: cellSelectionSubject)
            .disposed(by: disposeBag)
        
        cellSelectionSubject
            .subscribe(onNext: { indexPath in
                if let cell = self.favoritesTableView.cellForRow(at: indexPath) as? FavoritesTableViewCell {
                    cell.isSelected = true
                    cell.checkBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                    print("Selected cell at indexPath: \(indexPath)")
                }
            })
            .disposed(by: disposeBag)
    }

    @IBAction func closeFavoritesListBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
