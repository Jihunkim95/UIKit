//
//  ViewControllerEx02.swift
//  AutoLayoutCodeDemo
//
//  Created by 김지훈 on 2023/11/13.
//

import Foundation
import UIKit

class ViewControllerEx02: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createLayoutEx02()
    }
    func createLayoutEx02() {
        let superview = self.view!

        let label1 = UILabel()
        label1.text = "Hello"
//        label1.backgroundColor = .red
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)

        let label2 = UILabel()
        label2.text = "World"
//        label2.backgroundColor = .green
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)

        let constraints = [
            label1.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            label1.topAnchor.constraint(equalTo: superview.topAnchor, constant: 100),
            label2.centerYAnchor.constraint(equalTo: label1.centerYAnchor),
            label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 20)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}



