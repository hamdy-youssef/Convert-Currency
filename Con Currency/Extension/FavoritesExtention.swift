//
//  FavoritesExtention.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 29/08/2023.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

extension FavouritesVC: FavoritesVCProtocoL {
    
    func saveFavorite(cell: FavoritesTableViewCell) {
        cell.checkBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            self.favCurrencyArray.append(cell.currencylabel.text!)
            UserDefaultsManager.shared().saveCurrencyData(currency: self.favCurrencyArray)
    }
    
    func removeFavrite(cell: FavoritesTableViewCell) {
        cell.checkBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        let removeElement = cell.currencylabel.text
        self.favCurrencyArray.removeAll{$0 == removeElement}
        UserDefaultsManager.shared().saveCurrencyData(currency:  self.favCurrencyArray)
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
                    cell.isSelected = true
                    self.presenter.selectedCell(cell: cell)
                }
            })
            .disposed(by: disposeBag)
    }
}
