//
//  FavoritesPresenter.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 29/08/2023.
//

import Foundation
import UIKit

class FavoritesPresenter {
    weak var view: FavoritesVCProtocoL?
    
    init (view: FavoritesVCProtocoL) {
        self.view = view
    }
    
    func selectedCell(cell: FavoritesTableViewCell) {
            if cell.checkBtn.currentImage == UIImage(systemName: "checkmark.circle"){
                self.view?.saveFavorite(cell: cell)
            }
            else {
                self.view?.removeFavrite(cell: cell)
            }
    }
}
