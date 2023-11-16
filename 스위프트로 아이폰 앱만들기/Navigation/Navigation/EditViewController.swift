//
//  EditViewController.swift
//  Navigation
//
//  Created by 김지훈 on 2023/11/15.
//

import UIKit

//EditDelegate 프로토콜
protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String) 
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didBtnZoomDone(_ controller: EditViewController, isZoom: Bool)
}
class EditViewController: UIViewController {

    var textMsg: String = ""
    var textWayValue: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false
    
    
    @IBOutlet var btnValue: UIButton!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var lblWay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        txMessage.text = textMsg
        swIsOn.isOn = isOn
        
//        if !isZoom{
//            btnValue.tex
//            btnValue.text = "확대"
//        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        //완료버튼을 누르면 수정화면 텍스트 필드 내용이 메인화면으로 전달됨
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didBtnZoomDone(self, isZoom: isZoom)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    //전구 제어
    @IBAction func swimageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        } else {
            isOn = false
        }
    }
    @IBAction func btnZoom(_ sender: UIButton) {
        //버튼 Text변경하기
        if !isZoom{
            isZoom = true
            btnValue.setTitle("확대", for: UIControl.State())
        }else{
            isZoom = false
            btnValue.setTitle("축소", for: UIControl.State())
        }
    }
    
}
