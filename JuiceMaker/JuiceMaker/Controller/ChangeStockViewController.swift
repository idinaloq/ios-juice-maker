//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by hemg on 2023/05/15.
//

import UIKit

protocol addDelegate: AnyObject {
    func addStock(_ value: [Fruit: Int])
}

class ChangeStockViewController: UIViewController {
    var fruitStore: FruitStore = FruitStore.shard
    
    var stock: [Fruit: Int] = [:]
    
    weak var delegate: addDelegate?
    
    @IBOutlet weak var changeConfirmBarButton: UIBarButtonItem!
    @IBOutlet weak var strawBerryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawBerryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitStock()
    }
    
    func showFruitStock() {
        stock = fruitStore.fruitStock()
        
        guard let strawBerryStock = stock[.strawBerry] else { return }
        guard let bananaStock = stock[.banana] else { return }
        guard let pineappleStock = stock[.pineApple] else { return }
        guard let kiwiStock = stock[.kiwi] else { return }
        guard let mangoStock = stock[.mango] else { return }
        
        strawBerryStepper.value = Double(strawBerryStock)
        bananaStepper.value = Double(bananaStock)
        pineappleStepper.value = Double(pineappleStock)
        kiwiStepper.value = Double(kiwiStock)
        mangoStepper.value = Double(mangoStock)
        
        strawBerryLabel.text = stock[.strawBerry]?.description
        bananaLabel.text = stock[.banana]?.description
        pineappleLabel.text = stock[.pineApple]?.description
        kiwiLabel.text = stock[.kiwi]?.description
        mangoLabel.text = stock[.mango]?.description
    }
        
    @IBAction func changeConfirm(_ sender: Any) {
        changeStrawBerry()
        changeBanana()
        changePineapple()
        changeKiwi()
        changeMango()
        self.delegate?.addStock(self.stock)
        self.dismiss(animated: true)
    }
    
    @IBAction func strawBerryStepper(_ sender: UIStepper) {
        strawBerryLabel.text = "\(Int(sender.value))"
    }
    
    func changeStrawBerry() {
        guard let stock = self.stock[.strawBerry] else { return }
        guard let strawBerryText = strawBerryLabel.text, let intValue = Int(strawBerryText) else { return }
        var newStock = stock
        newStock = intValue
        
        fruitStore.decreaseStock(with: [.strawBerry: -newStock - -self.stock[.strawBerry]!])
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
        bananaLabel.text = Int(sender.value).description
    }
    
    func changeBanana() {
        guard let stock = self.stock[.banana] else { return }
        guard let bananaText = bananaLabel.text, let intValue = Int(bananaText) else { return }
        var newStock = stock
        newStock = intValue
        
        fruitStore.decreaseStock(with: [.banana: -newStock - -self.stock[.banana]!])
    }
    
    @IBAction func pineappleStepper(_ sender: UIStepper) {
        pineappleLabel.text = Int(sender.value).description
    }
    
    func changePineapple() {
        guard let stock = self.stock[.pineApple] else { return }
        guard let pineappleText = pineappleLabel.text, let intValue = Int(pineappleText) else { return }
        var newStock = stock
        newStock = intValue
        
        fruitStore.decreaseStock(with: [.pineApple: -newStock - -self.stock[.pineApple]!])
    }
    
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        kiwiLabel.text = Int(sender.value).description
    }
    
    func changeKiwi() {
        guard let stock = self.stock[.kiwi] else { return }
        guard let kiwiText = kiwiLabel.text, let intValue = Int(kiwiText) else { return }
        var newStock = stock
        newStock = intValue
        
        fruitStore.decreaseStock(with: [.kiwi: -newStock - -self.stock[.kiwi]!])
    }
    
    @IBAction func mangoStepper(_ sender: UIStepper) {
        mangoLabel.text = Int(sender.value).description
    }
    
    func changeMango() {
        guard let stock = self.stock[.kiwi] else { return }
        guard let mangoText = mangoLabel.text, let intValue = Int(mangoText) else { return }
        var newStock = stock
        newStock = intValue
        
        fruitStore.decreaseStock(with: [.mango: -newStock - -self.stock[.mango]!])
    }
}

