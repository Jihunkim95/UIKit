//
//  ViewController.swift
//  MissionPageControl
//
//  Created by 김지훈 on 2023/11/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //현재페이지
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
    }

    @IBAction func pageChagne(_ sender: UIPageControl) {
        
        textLabel.text = String(pageControl.currentPage)
    }
    
}

