//
//  ViewController.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit

protocol HomeVCProtocoL: AnyObject {
<<<<<<< Updated upstream
    func showConvertScreen()
    func showCompareScreen()
=======
   func showConvertView()
    func showCompareView()
>>>>>>> Stashed changes
}

class HomeVC: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var convertSegmentView: UIView!
    
    @IBOutlet weak var compareSegmentView: UIView!
    
<<<<<<< Updated upstream
    lazy var presenter: HomePresenter = HomePresenter (view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showConvertScreen()
        
    }
    
=======
    lazy var presenter: HomePresenter = HomePresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showConvertView()
    }
    
    
>>>>>>> Stashed changes
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        self.presenter.showView(index: selectedSegmentIndex)
    }
    
    
    
}

<<<<<<< Updated upstream
=======
extension HomeVC: HomeVCProtocoL {
    func showConvertView() {
        convertSegmentView.isHidden = false
        compareSegmentView.isHidden = true
    }
    
    func showCompareView() {
        compareSegmentView.isHidden = false
        convertSegmentView.isHidden = true
    }
    
    
}
>>>>>>> Stashed changes

