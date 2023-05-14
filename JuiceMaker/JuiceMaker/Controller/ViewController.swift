//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    @IBOutlet var strawBerryJuice: UIButton!
    @IBOutlet var bananaJuice: UIButton!
    
    var a = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker.order(.strawBerryJuice)
        buttonAction()
        // Do any additional setup after loading the view.
    }
    
    func buttonAction() {
        strawBerryJuice.addTarget(self, action: #selector(order(_:)), for: .touchUpInside)
        bananaJuice.addTarget(self, action: #selector(order1(_:)), for: .touchUpInside)
    }
    
    
    
    @objc func order(_ sender: UIButton) {
        if a == 1 {
            재고있을때()
        } else {
            print("없음")
        }
    }
    @objc func order1(_ sender: UIButton) {
        재고없을때()
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
    
//    func check() {
//        let alert = UIAlertController(title: "쥬스1", message: "쥬스 주문할래?", preferredStyle: UIAlertController.Style.alert)
//        
//        let okAction = UIAlertAction(title: "예", style: .default, handler : { action in
//            self.secondViewPresent()
//        } )
//        let cancel = UIAlertAction(title: "아니요", style: .cancel, handler : nil)
//        
//        alert.addAction(cancel)
//        alert.addAction(okAction)
//        
//        present(alert, animated: true)
//    }
    
    
    
    func secondViewPresent() {
        guard let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else {return}
        self.navigationController?.present(secondVC, animated: true)
        
    }
    
    @IBAction func secondViewPresentButton(_ sender: UIBarButtonItem) {
        guard let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else {return}


        self.navigationController?.present(secondVC, animated: true)
    }
}

