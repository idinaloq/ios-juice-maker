//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker.order(.bananaJuice)
        // Do any additional setup after loading the view.
    }
}

