//
//  ViewController.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit


class HomeVC: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var convertSegmentView: UIView!
    @IBOutlet weak var compareSegmentView: UIView!
    
    lazy var presenter: HomePresenter = HomePresenter (view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showConvertScreen()
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.backgroundColor = UIColor(named: "backgroundColor")
                view.addSubview(statusBarView)
    }

    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        self.presenter.showView(index: selectedSegmentIndex)
    }

}
