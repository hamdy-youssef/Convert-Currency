//
//  ComparePresenter.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 29/08/2023.
//

import Foundation

class ComparePresenter {
    weak var view: CompareVCProtocoL?
    var amount: String?
    init (view: CompareVCProtocoL) {
        self.view = view
    }
    
    func checkAPI() {
        if amount != "" {
            self.view?.fetchApiForCompare()
        }else {
            self.view?.showAlert(title: "Wrong", message: "Please Enter Amount")
        }
    }
}
