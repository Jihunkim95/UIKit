//
//  ViewController.swift
//  CrossViewDemo
//
//  Created by 김지훈 on 2023/11/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel!
    
    @IBOutlet var myButton: UIButton!
    @IBOutlet var centerConstraaint: NSLayoutConstraint!
    
    @IBOutlet var viewB: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //기준 제약조건을 제거
        viewB.removeConstraint(centerConstraaint)
        // 교차 제출 제약조건 추가
        myLabel.trailingAnchor.constraint(equalTo: myButton.trailingAnchor).isActive = true
        
        //뷰 사진 생성
        let viewsDict = ["mylabel": myLabel, "myButton": myButton]
        
        var constraint = NSLayoutConstraint.constraints(withVisualFormat: "|-[myButton]-|", metrics: nil, views: viewsDict)
        
        superview?.addConstraint(constraint)
    }

    
    
}

