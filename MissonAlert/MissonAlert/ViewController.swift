//
//  ViewController.swift
//  MissonAlert
//
//  Created by 김지훈 on 2023/11/14.
//

import UIKit

class ViewController: UIViewController {

    //타이머가 구동되면 실행할 함수 지정
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var flag: Bool = true
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    var alarmTime: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        


        
        formatter.dateFormat = "hh:mm aaa"
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        alarmTime = formatter.string(from: datePickerView.date)
    }
    //타이머 동작함수 추가
    @objc func updateTime(){
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        let currentTime = formatter.string(from: date as Date)
        print(alarmTime)
        if (alarmTime == currentTime){

            if flag {
                //UIAlertController
                let equalAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                equalAlert.addAction(onAction)
                //present메서드 실행
                present(equalAlert,animated: true, completion: nil)
                flag = false
            }

        }
        
    }
}

