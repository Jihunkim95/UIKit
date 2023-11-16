//
//  DetailViewController.swift
//  Table
//
//  Created by 김지훈 on 2023/11/16.
//

import UIKit


class DetailViewController: UIViewController {

    // 목록 클릭시 동작 코딩하기
    var receiveItem = ""
    @IBOutlet var lblItem: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        lblItem.text = receiveItem
    }
    //main view에서 변수를 받기 위한 함수 추가
    func receiveItem(_ item: String) {
        receiveItem = item
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
