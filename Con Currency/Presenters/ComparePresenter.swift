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
    
    func IsNumberWrittenInArabicOrEnglish(_ input: String) -> Bool {
        let arabicNumbers = CharacterSet(charactersIn: "٠١٢٣٤٥٦٧٨٩")
        let containsArabicNumbers = input.rangeOfCharacter(from: arabicNumbers) != nil
        if containsArabicNumbers {
            self.view?.showAlert(title: "Wrong", message: "Please Enter Number In English")
        }
        
        return containsArabicNumbers
        
    }
    
    func checkAPI() {
        if amount != "" && !IsNumberWrittenInArabicOrEnglish(amount!) {
            self.view?.fetchApiForCompare()
        }else {
            self.view?.showAlert(title: "Wrong", message: "Please Enter Amount")
        }
    }
}
