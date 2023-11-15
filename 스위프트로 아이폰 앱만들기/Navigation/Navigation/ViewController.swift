//
//  ViewController.swift
//  Navigation
//
//  Created by 김지훈 on 2023/11/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //데이터 전달을 위한 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton"{
            //버튼클릭
            editViewController.textWayValue = "segue : 수정버튼 눌러서 온 데이터"
        }else if segue.identifier == "editBarButton" {
            //바 버튼 클릭
            editViewController.textWayValue = "segue : Edit버튼 눌러서 온 데이터"
        }
        
        //메세지수정
        editViewController.textMsg = txMessage.text ?? ""
    }

}

