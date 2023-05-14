//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    private var recipe: [Fruit: Int] = [:]
    var orderCheck: [Int] = []
    var orderCount: Int = 1
    
    
    mutating func order(_ juice: Juice) {
        self.recipe = juice.recipe
        
        do {
            try fruitStore.checkStock(with: self.recipe)
            fruitStore.decreaseStock(with: self.recipe)
            orderCheck.append(orderCount)
            print("\(orderCheck) 숫자")
        } catch FruitStoreError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
}
