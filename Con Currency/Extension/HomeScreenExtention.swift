//
//  HomeScreenExtention.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation
import UIKit

extension HomeVC: HomeVCProtocoL {
    
    func showConvertScreen() {
        compareSegmentView.isHidden = true
        titleLabel.text = "Currency Converter"
        convertSegmentView.frame.origin.x = UIScreen.main.bounds.width
                UIView.animate(withDuration: 0.5) {
                    self.convertSegmentView.center.x = self.view.center.x
            self.convertSegmentView.isHidden = false
        }
    }
    
    func test (){}
    
    func showCompareScreen() {
        convertSegmentView.isHidden = true
        titleLabel.text = "Currency Compare"
        compareSegmentView.frame.origin.x = -compareSegmentView.frame.width
               UIView.animate(withDuration: 0.5) {
                   self.compareSegmentView.center.x = self.view.center.x
                   self.compareSegmentView.isHidden = false
               }
    }
}
