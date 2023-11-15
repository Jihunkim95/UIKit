//
//  ViewController.swift
//  MissionDatePicker
//
//  Created by 김지훈 on 2023/11/13.
//

import UIKit

class ViewController: UIViewController {

    //타이머가 구동되면 실행할 함수 지정
    let timeSelector: Selector = #selector(ViewController.updateTime)
    
    let interval = 1.0
    var count = 0
    
    var alarmTime: String = ""
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aa"
        lblPickerTime.text = formatter.string(from: datePickerView.date)
        
        alarmTime = formatter.string(from: datePickerView.date)

    }
    //타이머 동작함수 추가
    @objc func updateTime(){
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aa"
        lblCurrentTime.text = formatter.string(from: date as Date)
        
        let currentTime = formatter.string(for: date)
        
        if currentTime == alarmTime{
            view.backgroundColor = UIColor.red
        }else{
            view.backgroundColor = UIColor.white
        }
    }
}

