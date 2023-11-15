//
//  ViewController.swift
//  ImageView
//
//  Created by 김지훈 on 2023/11/13.
//

import UIKit

class ViewController: UIViewController {
 
    @IBAction func btnMoveImageView(_ sender: UIButton) {
        //버튼으로 뷰 이동
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        //버튼으로 뷰 이동
        tabBarController?.selectedIndex = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

