//
//  ViewController.swift
//  Alert
//
//  Created by 김지훈 on 2023/11/14.
//

import UIKit

class ViewController: UIViewController {
    //전구켜기 코드 구현
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lampImg.image = imgOn
        
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            //전구켜져있을때
            //전구 켜져있다고 alert
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            //present메서드 실행
            present(lampOnAlert,animated: true, completion: nil)
        }else{
            //전구 켜져있을때
            //전구를 켬
            lampImg.image = imgOn
            isLampOn=true
        }
    }
    
    //전구끄기
    @IBAction func bthLampOff(_ sender: UIButton) {
        if isLampOn{
            //UIAlertController
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            //UIAlertAction
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in 
                self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction =  UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        //생성된 offAction,onAction등을 lampRemoveAlert 추가
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        //present 메서드 실행
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

