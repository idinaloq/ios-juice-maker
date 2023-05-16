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
        showFruitStockStepper()
    }
    
    func showFruitStock() {
        stock = fruitStore.fruitStock()
        
        let fruitStock: [Fruit : UILabel] = [
            .strawBerry: strawBerryLabel,
            .banana: bananaLabel,
            .pineApple: pineappleLabel,
            .kiwi: kiwiLabel,
            .mango: mangoLabel
        ]
        
        for (fruit, label) in fruitStock {
            guard let stock = stock[fruit] else { return }
            label.text = String(stock)
        }
    }
    
    func showFruitStockStepper() {
        stock = fruitStore.fruitStock()
        let fruitStockStepper: [Fruit : UIStepper] = [
            .strawBerry: strawBerryStepper,
            .banana: bananaStepper,
            .pineApple: pineappleStepper,
            .kiwi: kiwiStepper,
            .mango: mangoStepper
        ]
        
        for (fruit, stepper) in fruitStockStepper {
            guard let stock = stock[fruit] else { return }
            stepper.value = Double(stock)
        }
    }
    
    @IBAction func changeConfirm(_ sender: Any) {
        
        let fruitLabels: [Fruit: UILabel] = [
            .strawBerry: strawBerryLabel,
            .banana: bananaLabel,
            .pineApple: pineappleLabel,
            .kiwi: kiwiLabel,
            .mango: mangoLabel
        ]
        
           for (fruit, label) in fruitLabels {
               changeStock(for: fruit, with: label)
           }
        
        self.delegate?.addStock(self.stock)
        self.dismiss(animated: true)
    }
    
    func changeStock(for fruit: Fruit, with label: UILabel) {
        guard let stock = self.stock[fruit] else { return }
        guard let text = label.text, let intText = Int(text) else { return }

        fruitStore.decreaseStock(with: [fruit: -intText - -stock])
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

