//
//  ViewControllerEx05.swift
//  FileExampleDemo
//
//  Created by 김지훈 on 2023/11/21.
//

import UIKit

class ViewControllerEx05: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func countBtn(_ sender: Any) {
        let fileManager = FileManager.default

        do {
            let documentPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].path
            let sourceFile = documentPath + "/" + "datafile.dat"
            let destinationFile = documentPath + "/" + "frequency.txt"

            // 단어의 빈도수를 계산하고 저장하는 코드
            let data = try Data(contentsOf: URL(fileURLWithPath: sourceFile))
            if let text = String(data: data, encoding: .utf8) {

                let words = text.split(separator: " ").map { $0.lowercased() }
                var frequency = [String:Int]()
                for word in words {
                    frequency[word, default: 0] += 1
                }
                var result = ""
                for (word, count) in frequency {
                    result += "\(word):\(count)\n"
                }

                if let resultData = result.data(using: .utf8) {
                    try resultData.write(to: URL(fileURLWithPath: destinationFile))
                }
            }

            // 변경된 파일 확인

        } catch {
            print(error)
        }

    }

}
