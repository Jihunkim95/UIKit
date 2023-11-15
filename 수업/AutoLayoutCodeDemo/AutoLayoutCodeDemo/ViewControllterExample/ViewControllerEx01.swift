//
//  ViewControllerEx01.swift
//  AutoLayoutCodeDemo
//
//  Created by 김지훈 on 2023/11/13.
//


import UIKit
import SwiftUI
import UIKit

class ViewControllerEx01: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // 첫 번째 UILabel 생성
        let label1 = UILabel()
        label1.text = "Hello"
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)

        // 두 번째 UILabel 생성
        let label2 = UILabel()
        label2.text = "World"
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)

        // leading 및 trailing 제약 추가
        NSLayoutConstraint.activate([
            // label1의 leading을 superView의 leading에 20포인트 거리로 설정
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // label2의 trailing을 superView의 trailing에 20포인트 거리로 설정
            label2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // label1의 trailing을 label2의 leading에 20포인트 거리로 설정
            label1.trailingAnchor.constraint(equalTo: label2.leadingAnchor, constant: -20),
            
            // label2의 leading을 label1의 trailing에 20포인트 거리로 설정
            label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor, constant: 20),
            // 위 제약 (상단과 Safe Area의 상단 간격 20포인트)
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            // 아래 제약 (하단과 Safe Area의 하단 간격 20포인트)
            label1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            // 위 제약 (상단과 Safe Area의 상단 간격 20포인트)

            label2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            // 아래 제약 (하단과 Safe Area의 하단 간격 20포인트)
            label2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
        ])
    }
}
