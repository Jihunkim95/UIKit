//
//  ViewController.swift
//  MissionImageView
//
//  Created by 김지훈 on 2023/11/13.
//

import UIKit

class ViewController: UIViewController {
    
    var numImage:Int = 1
    var numMax: Int = 7
    var numMin: Int = 1
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: "1.png")
    }

    @IBAction func btnNext(_ sender: Any) {
        
        numImage += 1
        if numImage < numMax{
            if numImage < 6{
                let imageName = String(numImage) + ".png"
                imgView.image = UIImage(named: imageName)
            }
        }


    }
    
    @IBAction func btnBefore(_ sender: Any) {
        numImage -= 1
        if numImage > numMin{
            let imageName = String(numImage) + ".png"
            imgView.image = UIImage(named: imageName)
        }
    }
}

