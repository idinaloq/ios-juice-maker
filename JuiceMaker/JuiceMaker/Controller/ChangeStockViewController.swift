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
        changeStock(for: .strawBerry, with: strawBerryLabel)
        changeStock(for: .banana, with: bananaLabel)
        changeStock(for: .pineApple, with: pineappleLabel)
        changeStock(for: .kiwi, with: kiwiLabel)
        changeStock(for: .mango, with: mangoLabel)
        self.delegate?.addStock(self.stock)
        self.dismiss(animated: true)
    }
    
    func changeStock(for fruit: Fruit, with label: UILabel) {
        guard let stock = self.stock[fruit] else { return }
        guard let text = label.text, let intText = Int(text) else { return }

        var newStock = stock
        newStock = intText

        fruitStore.decreaseStock(with: [fruit: -newStock - -stock])
    }
    
    @IBAction func strawBerryStepper(_ sender: UIStepper) {
        strawBerryLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
        bananaLabel.text = Int(sender.value).description
    }
        
    @IBAction func pineappleStepper(_ sender: UIStepper) {
        pineappleLabel.text = Int(sender.value).description
    }
        
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        kiwiLabel.text = Int(sender.value).description
    }
        
    @IBAction func mangoStepper(_ sender: UIStepper) {
        mangoLabel.text = Int(sender.value).description
    }
}

