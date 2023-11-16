//
//  AddViewController.swift
//  Table
//
//  Created by 김지훈 on 2023/11/16.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 100
    //선택한 이미지를 이미지 뷰에 출력하기
    var imageArray = [UIImage?]()
    
    //선택시 저장될 이미지
    var strImg: String = ""
    @IBOutlet var pickerImage: UIPickerView!
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0 ..< itemsImageFile.count{
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image)
        }
        
        imgView.image = imageArray[0]
        strImg =  itemsImageFile[0]
    }
    
    
    //새목록 추가하기
    @IBAction func btnAddItem(_ sender: UIButton) {
        //items에 텍스트 필드의 텍스트 값 추가
        items.append(tfAddItem.text!)
        itemsImageFile.append(strImg)
        //textfield내용 지우기
        tfAddItem.text = ""
        //루트 뷰 컨트롤러 즉 테이블로 돌아감
        _ = navigationController?.popViewController(animated: true)
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
        return itemsImageFile.count
    }
    
    //각 row뷰 설정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let imageView = UIImageView(image: imageArray[row])
        
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        return imageView
    }

    //피커 뷰가 선택되었을때 실행
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        //선택한 이미지 출력하기
        imgView.image = imageArray[row]
        //선택한 이미지명 저장
        strImg = itemsImageFile[row]
    }
}
