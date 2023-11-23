//
//  ViewControllerEx04.swift
//  FileExampleDemo
//
//  Created by 김지훈 on 2023/11/20.
//

import UIKit

class ViewControllerEx04: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func SumAvgBtn(_ sender: Any) {
        //원본
        let sourcePath = "/Users/kimjihun/Library/Developer/CoreSimulator/Devices/F30BD4F1-2992-4F7E-A925-54D435C8B494/data/Containers/Data/Application/BDE9CB5F-3B6B-42B9-A4F6-C757B23A15FB/Documents/numbers.txt"
        
        let destinationDirectory = "/Users/kimjihun/Library/Developer/CoreSimulator/Devices/F30BD4F1-2992-4F7E-A925-54D435C8B494/data/Containers/Data/Application/BDE9CB5F-3B6B-42B9-A4F6-C757B23A15FB/Backup" // 예시 디렉토리

        let fileManager = FileManager.default
 
        // 대상 파일 경로 (원본 파일 이름을 그대로 사용)
        let destinationPath = (destinationDirectory as NSString).appendingPathComponent("numbers.txt")

        do {
            // 디렉토리 생성
            try fileManager.createDirectory(atPath: destinationDirectory, withIntermediateDirectories: true, attributes: nil)

            // 파일 복사
            try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)

            // 읽기
            let originalText = try String(contentsOfFile: destinationPath, encoding: .utf8)

            //합계
            dump("Test : \(originalText.components(separatedBy: "\n").map{Int($0) ?? 0}.reduce(0,+))")
            
            // 합계 평균 파일 만들기
            let NewFile = "합계: \(String(originalText.components(separatedBy: "\n").map{Int($0) ?? 0}.reduce(0,+))) , 평균: \(originalText.components(separatedBy: "\n").map{Int($0) ?? 0}.reduce(0,+)/originalText.count)"

            // 저장
            try NewFile.write(toFile: destinationPath, atomically: true, encoding: .utf8)

//            print("Text reversed and saved successfully.")
        } catch {
            print("Error: \(error)")
        }
    }
}
