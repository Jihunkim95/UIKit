//
//  ViewController.swift
//  PickerView
//
//  Created by 김지훈 on 2023/11/14.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 100
    
    //선택한 이미지를 이미지 뷰에 출력하기
    var imageArray = [UIImage?]()
    var imageFileName = ["더블불고기버거","불고기버거","빅맥"]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< imageFileName.count{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
            
            print(imageFileName[i])
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
    }
    
    //피커 뷰의 높이설정
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //피커 뷰의 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    //각 row뷰 설정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image: imageArray[row])
        
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    //피커 뷰가 선택되었을때 실행
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) {
        //선택한 이미지 이름 출력하기
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }

}

