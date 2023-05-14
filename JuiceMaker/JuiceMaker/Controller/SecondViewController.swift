//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 1 on 2023/05/14.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var strawBerry: UILabel!
    @IBOutlet var banana: UILabel!
    @IBOutlet var pineApple: UILabel!
    @IBOutlet var kiwi: UILabel!
    @IBOutlet var mango: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
    @IBAction func homeButton(_ sender: UIButton) {
        print("asd")
        self.dismiss(animated: true)
    }
}
