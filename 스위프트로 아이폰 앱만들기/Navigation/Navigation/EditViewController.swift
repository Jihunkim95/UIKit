//
//  EditViewController.swift
//  Navigation
//
//  Created by 김지훈 on 2023/11/15.
//

import UIKit

class EditViewController: UIViewController {

    var textMsg: String = ""
    var textWayValue: String = ""
    
    @IBOutlet var txMessage: UITextField!
    
    @IBOutlet var lblWay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        txMessage.text = textMsg
    }
    

    @IBAction func btnDone(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    

}
