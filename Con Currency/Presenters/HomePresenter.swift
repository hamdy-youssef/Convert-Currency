//
//  HomePresenter.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
class HomePresenter {
    
    weak var view: HomeVCProtocoL?
    init (view: HomeVCProtocoL) {
        self.view = view
    }
    func test (){}
    func showView(index: Int) {
        switch index {
        case 0:
            self.view?.showConvertScreen()
        case 1:
            self.view?.showCompareScreen()
        default:
            break
        }
    }
}
