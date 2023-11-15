//
//  ViewControllerEx04.swift
//  AutoLayoutCodeDemo
//
//  Created by 김지훈 on 2023/11/13.
//

import UIKit

class ViewControllerEx04: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createLayoutEx04()
    }
    
    func createLayoutEx04() {
        let superview = self.view!

        let button = UIButton()
        button.setTitle("Tap Me", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        let constraints = [
            button.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -20)
        ]

        NSLayoutConstraint.activate(constraints)
    }

}
