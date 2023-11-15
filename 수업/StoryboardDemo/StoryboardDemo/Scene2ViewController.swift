//
//  Scene2ViewController.swift
//  StoryboardDemo
//
//  Created by 김지훈 on 2023/11/15.
//

import UIKit

class Scene2ViewController: UIViewController {

    // 두 번째 장면의 레이블 연결

    @IBOutlet var sence2Label: UILabel!
    // 장면 간 데이터 전달
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sence2Label.text = labelText
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
