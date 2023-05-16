//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, addDelegate {
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    var stock: [Fruit: Int] = [:]

    
    @IBOutlet weak var strawBerryJuice: UIButton!
    @IBOutlet weak var strawBerryBananaJuice: UIButton!
    @IBOutlet weak var bananaJuice: UIButton!
    @IBOutlet weak var pineappleJuice: UIButton!
    @IBOutlet weak var kiwiJuice: UIButton!
    @IBOutlet weak var mangoKiwiJuice: UIButton!
    @IBOutlet weak var mangoJuice: UIButton!
    @IBOutlet weak var changeStock: UIBarButtonItem!
    
    @IBOutlet weak var strawBerryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    @IBOutlet var stocks: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStock()
    }
    

        
    func showStock() {
        stock = juiceMaker.fruitStore.fruitStock()
        strawBerryStock.text = self.stock[.strawBerry]?.description
        
        bananaStock.text = self.stock[.banana]?.description
        
        pineappleStock.text = self.stock[.pineApple]?.description
        
        kiwiStock.text = self.stock[.kiwi]?.description

        mangoStock.text = self.stock[.mango]?.description
    }
    
    
    @IBAction func strawBerryJuice(_ sender: Any) {
        if juiceMaker.order(.strawBerryJuice) == true {
            showStock()
            재고있을때()
        } else {
            재고없을때()
        }
    }
    
    @IBAction func strawBerryBananaJuice(_ sender: Any) {
        if juiceMaker.order(.strawBerryBananaJuice) == true {
            showStock()
            재고있을때()
        } else {
            재고없을때()
        }
    }
    
    @IBAction func bananaJuice(_ sender: Any) {
        if juiceMaker.order(.bananaJuice) == true {
            showStock()
            재고있을때()
        } else {
            재고없을때()
        }
    }
    
    @IBAction func pineappleJuice(_ sender: Any) {
        if juiceMaker.order(.pineAppleJuice) == true {
            showStock()
            재고있을때()
        } else {
            재고없을때()
        }
    }
    
    @IBAction func kiwiJuice(_ sender: Any) {
        if juiceMaker.order(.kiwiJuice) == true {
            showStock()
            재고있을때()
        } else {
            재고없을때()
        }
    }
    
    @IBAction func mangoKiwiJuice(_ sender: Any) {
        if juiceMaker.order(.mangoKiwiJuice) == true {
            showStock()
            재고있을때()
        } else {
            재고없을때()
        }
    }
    
    @IBAction func mangoJuice(_ sender: Any) {
        if juiceMaker.order(.mangoJuice) == true {
            showStock()
            재고있을때()
        } else {
            재고없을때()
        }
    }
    
    func 재고있을때() {
        let alert = UIAlertController(title: "쥬스 나왔습니다.", message: "맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler :nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func 재고없을때() {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정 할까요?", preferredStyle: UIAlertController.Style.alert)
        let result = UIAlertAction(title: "아니요", style: .destructive)
        let okAction = UIAlertAction(title: "예", style: .default, handler : { action in
            self.secondViewPresent()
        } )
        
        alert.addAction(result)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    func secondViewPresent() {
        guard let changeStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStockViewController") as? ChangeStockViewController else { return }
        let navigationController = UINavigationController(rootViewController: changeStockViewController)
        changeStockViewController.delegate = self
        self.present(navigationController, animated: true)
    }
    
    
    @IBAction func changeStock(_ sender: Any) {
       secondViewPresent()
    }
    
    func addStock(_ value: String?) {
        showStock()
    }
}
