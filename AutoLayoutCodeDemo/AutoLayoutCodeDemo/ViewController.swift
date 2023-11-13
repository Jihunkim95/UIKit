//
//  ViewController.swift
//  AutoLayoutCodeDemo
//
//  Created by 김지훈 on 2023/11/13.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLayout()
    }

    func createLayout() {
            let superview = self.view

            // 뷰 생성
            let myLabel = UILabel()
            myLabel.translatesAutoresizingMaskIntoConstraints = false
            myLabel.text = "My Label"

            let myButton = UIButton()
            myButton.translatesAutoresizingMaskIntoConstraints = false
            myButton.setTitle("My Button", for: UIControl.State.normal)
            myButton.backgroundColor = UIColor.blue

            superview?.addSubview(myLabel)
            superview?.addSubview(myButton)

            // 제약 조건 생성 및 추가 제약 조건
            /*
            var myConstraint =
              NSLayoutConstraint(item: myLabel,
                                 attribute: NSLayoutConstraint.Attribute.centerY,
                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                 toItem: superview,
                                 attribute: NSLayoutConstraint.Attribute.centerY,
                                 multiplier: 1.0,
                                 constant: 0)

            superview?.addConstraint(myConstraint)

            myConstraint =
              NSLayoutConstraint(item: myLabel,
                                 attribute: NSLayoutConstraint.Attribute.centerX,
                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                 toItem: superview,
                                 attribute: NSLayoutConstraint.Attribute.centerX,
                                 multiplier: 1.0,
                                 constant: 0)

            superview?.addConstraint(myConstraint)


            myConstraint =
              NSLayoutConstraint(item: myButton,
                                 attribute: NSLayoutConstraint.Attribute.trailing,
                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                 toItem: myLabel,
                                 attribute: NSLayoutConstraint.Attribute.leading,
                                 multiplier: 1.0,
                                 constant: -10)

            superview?.addConstraint(myConstraint)

            myConstraint =
              NSLayoutConstraint(item: myButton,
                                 attribute: NSLayoutConstraint.Attribute.firstBaseline,
                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                 toItem: myLabel,
                                 attribute: NSLayoutConstraint.Attribute.firstBaseline,
                                 multiplier: 1.0,
                                 constant: 0)

            superview?.addConstraint(myConstraint)      // 제약 조건 활성화(적용)
            superview?.removeConstraint(myConstraint)   // 제약 조건 비활성화
             */

            myLabel.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
            myLabel.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
            myButton.trailingAnchor.constraint(equalTo: myLabel.leadingAnchor, constant: -10).isActive = true
            var btnConst = myButton.firstBaselineAnchor.constraint(equalTo: myLabel.firstBaselineAnchor)

            //...
            btnConst.isActive = true

        }

}
