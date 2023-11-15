//
//  ViewController.swift
//  TempConvertDemo
//
//  Created by 김지훈 on 2023/11/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var tempText: UITextField!
    
    @IBAction func convertTemp(_ sender: UIButton) {
        guard let tempString = tempText.text else{
            return
        }
        
        if let fatreheit = Double(tempString){
            let celsius = (fatreheit - 32) / 1.8
            let resultText = "celsius \(celsius)"
            resultLabel.text = resultText
        }else{
            resultLabel.text = "입력 오류 숫자만 \(tempString)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //터치 이벤트 처리
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tempText.endEditing(true)
    }

    // UITextField와 Did End on Exit 연결
    @IBAction func textFieldReturn(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}

