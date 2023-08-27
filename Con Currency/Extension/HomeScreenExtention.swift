//
//  HomeScreenExtention.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 27/08/2023.
//

import Foundation

extension HomeVC: HomeVCProtocoL {
    func showConvertScreen() {
        convertSegmentView.isHidden = false
        compareSegmentView.isHidden = true
    }
    
    func showCompareScreen() {
        convertSegmentView.isHidden = true
        compareSegmentView.isHidden = false
    }
    
    
}
