//
//  ViewControllerEx03.swift
//  AutoLayoutCodeDemo
//
//  Created by 김지훈 on 2023/11/13.
//

import UIKit

class ViewControllerEx03: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createLayoutEx03()
    }

    func createLayoutEx03() {
          let superview = self.view!

          let imageView = UIImageView()
          imageView.image = UIImage(named: "waterfall_maple")
          imageView.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(imageView)

          let label1 = UILabel()
          label1.text = "AutoLayout Example"
  //        label1.backgroundColor = .red
          label1.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(label1)

          let constraints = [
              imageView.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
              imageView.widthAnchor.constraint(equalToConstant: 100),
              imageView.heightAnchor.constraint(equalToConstant: 100),
              imageView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 50),
              label1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
              label1.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
              label1.widthAnchor.constraint(equalToConstant: 100)
          ]

          NSLayoutConstraint.activate(constraints)
      }
}
