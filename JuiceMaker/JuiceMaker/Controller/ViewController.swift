//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, addDelegate {
    
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    var stock: [Fruit: Int] = [:]

    @IBOutlet weak var strawBerryJuiceButton: UIButton!
    @IBOutlet weak var strawBerryBananaJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var changeStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawBerryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStock()
    }

    func showStock() {
        stock = juiceMaker.fruitStore.fruitStock()
        strawBerryStockLabel.text = self.stock[.strawBerry]?.description
        
        bananaStockLabel.text = self.stock[.banana]?.description
        
        pineappleStockLabel.text = self.stock[.pineApple]?.description
        
        kiwiStockLabel.text = self.stock[.kiwi]?.description

        mangoStockLabel.text = self.stock[.mango]?.description
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
    
    func addStock(_ value: [Fruit : Int]) {
        showStock()
    }
}
