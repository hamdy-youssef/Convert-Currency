//
//  ConvertVC.swift
//  Con Currency
//
//  Created by Hamdy Youssef on 26/08/2023.
//

import UIKit
import RxCocoa
import RxSwift

class ConvertVC: UIViewController {

    @IBOutlet weak var favotiteBtn: UIButton!
    
    @IBOutlet var Buttons: [UIButton]!
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    @IBOutlet weak var baseAmountTextField: UITextField!
    
    @IBOutlet weak var targetAmountLabel: UILabel!
    
    @IBOutlet var convertFromBTn: UIButton!
    
    @IBOutlet var convertToBtn: UIButton!
    
    @IBOutlet var convertFromImage: UIImageView!
    
    @IBOutlet var convertToImage: UIImageView!
    
    var tag: Int?
    let disposeBag = DisposeBag()
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBorderAndRadiusForUiComponents()
    }
    func btn(text: String) {
        print(text ?? "wrong")
        convertFromBTn = UIButton(type: .system)
        convertFromBTn.setTitle(text, for: .normal)
    }
    
    
    func setBorderAndRadiusForUiComponents() {
        
        targetAmountLabel.layer.borderWidth = 0.2
        targetAmountLabel.layer.borderColor = UIColor.gray.cgColor
        targetAmountLabel.layer.cornerRadius = 20 // You can adjust this value as needed
        targetAmountLabel.layer.masksToBounds = true
        for button in Buttons {
            button.layer.borderWidth = 0.2
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.cornerRadius = 20.0
        }
        baseAmountTextField.layer.borderWidth = 0.2
        baseAmountTextField.layer.borderColor = UIColor.gray.cgColor
        baseAmountTextField.layer.cornerRadius = 20 // You can adjust this value as needed
        baseAmountTextField.layer.masksToBounds = true
        favotiteBtn.layer.borderWidth = 0.7
    }
    
    @IBAction func addToFavoriteBtn(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
        self.present(vc, animated: true)
    }
    
    @IBAction func convertFromBtn(_ sender: Any) {
        tag = 0
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CurrencyVC") as! CurrencyVC
        self.present(vc, animated: true)
    }
    
    @IBAction func convertToBtn(_ sender: Any) {
        tag = 1
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CurrencyVC") as! CurrencyVC
        self.present(vc, animated: true)
    }
}
