//
//  ViewController.swift
//  Navigation
//
//  Created by 김지훈 on 2023/11/15.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    //전구초기화면 세팅 전구 변수 초기화
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn

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
        
        //메인이 수정으로
        editViewController.textMsg = txMessage.text!
        //메인화면의 전구 상태를 수정화면에 반영하기
        editViewController.isOn = isOn
        //수정된것이 메인
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didBtnZoomDone(_ controller: EditViewController, isZoom: Bool) {
        
        let scale: CGFloat = 2.0

        var newWidth: CGFloat, newHeight: CGFloat

        if isZoom {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
        }else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }

}

