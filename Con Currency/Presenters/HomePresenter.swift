//
//  HomePresenter.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
<<<<<<< Updated upstream
 
class HomePresenter {
    
    weak var view: HomeVCProtocoL?
=======

class HomePresenter {
    
    weak var view: HomeVCProtocoL?
    
>>>>>>> Stashed changes
    init (view: HomeVCProtocoL) {
        self.view = view
    }
    
    func showView(index: Int) {
<<<<<<< Updated upstream
        switch index {
        case 0:
            self.view?.showConvertScreen()
        case 1:
            self.view?.showCompareScreen()
=======
        self.view?.showConvertView()
        switch index {
        case 0:
            self.view?.showConvertView()
        case 1:
            self.view?.showCompareView()
>>>>>>> Stashed changes
        default:
            break
        }
    }
}
