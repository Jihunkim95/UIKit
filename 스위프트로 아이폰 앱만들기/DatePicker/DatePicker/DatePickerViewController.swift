//
//  ViewController.swift
//  DatePicker
//
//  Created by 김지훈 on 2023/11/13.
//

import UIKit

class DatePickerViewController: UIViewController {
    //타이머가 구동되면 실행할 함수 지정
    let timeSelector: Selector = #selector(DatePickerViewController.updateTime)
    let interval = 1.0
    var count = 0
    
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
        formatter.dateFormat = "yyyy-MM-dd HH:mm EE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
    }
    
    //타이머 동작함수 추가
    @objc func updateTime(){
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
    }
}

