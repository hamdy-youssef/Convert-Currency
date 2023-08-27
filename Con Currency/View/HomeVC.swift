//
//  ViewController.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var convertSegmentView: UIView!
    
    @IBOutlet weak var compareSegmentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showView(index: 0)
        
    }
    
    func showView(index: Int) {
        convertSegmentView.isHidden = true
        compareSegmentView.isHidden = true
        switch index {
        case 0:
            convertSegmentView.isHidden = false
        case 1:
            compareSegmentView.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        showView(index: selectedSegmentIndex)
    }
    
    
    
}
