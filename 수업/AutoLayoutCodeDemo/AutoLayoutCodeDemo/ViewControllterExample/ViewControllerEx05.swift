//
//  ViewControllerEx05.swift
//  AutoLayoutCodeDemo
//
//  Created by 김지훈 on 2023/11/14.
//

import UIKit

class ViewControllerEx05: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createLayoutEx05()
    }
    
    func createLayoutEx05(){
        let superview = self.view!

        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
        
        let constrants = [
            redView.topAnchor.constraint(equalTo: superview.topAnchor),
            redView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            redView.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 1/3),
            redView.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 1/2),
            
            greenView.topAnchor.constraint(equalTo: superview.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            greenView.heightAnchor.constraint(equalTo: superview.heightAnchor),
            greenView.widthAnchor.constraint(equalTo: superview.widthAnchor)
        ]
    }
}
