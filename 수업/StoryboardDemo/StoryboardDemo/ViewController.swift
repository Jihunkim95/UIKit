//
//  ViewController.swift
//  StoryboardDemo
//
//  Created by 김지훈 on 2023/11/15.
//

import UIKit

class ViewController: UIViewController {


    var imgWidth = 300
    var imgHeight = 200
    var imgArray: [String] = ["lamp_off","lamp_on"]
    var idx: Int = 0
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.frame.size = CGSize(width: imgWidth, height: imgHeight)
        imgView.image = UIImage(named: imgArray[0])
        pageControl.currentPage = 0
        pageControl.numberOfPages = imgArray.count


    }
    
    @IBAction func pageChangeImg(_ sender: UIPageControl) {
        imgView.image = UIImage(named: imgArray[sender.currentPage])

        idx = sender.currentPage
    }
    

    
    @IBAction func btnChangeImg(_ sender: UIButton) {
        pageControl.currentPage = idx
        if idx < imgArray.count{
            imgView.image = UIImage(named: imgArray[idx])
            idx += 1;
            print(idx)
        }else{
            idx = 0;
        }
        
    }
    @IBAction func switchImgSize(_ sender: UISwitch) {
        if sender.isOn{
            print("On")
            imgView.frame.size = CGSize(width: imgWidth, height: imgHeight)
        }else{
            print("Off")
            let halfWidth = imgView.frame.width / 10
            let halfHeight = imgView.frame.height / 10
            print(halfHeight,halfWidth)
            imgView.frame.size = CGSize(width: halfWidth, height: halfHeight)
        }
    }
    
    //장면 간 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! Scene2ViewController
        dest.labelText = "첫 화면에서 값을 보냄"
    }
    
    //두 번째 장면 전달되도록 연결 segue형식으로 되어 있을시
    @IBAction func returned(segue: UIStoryboardSegue){
        
    }
    
}

