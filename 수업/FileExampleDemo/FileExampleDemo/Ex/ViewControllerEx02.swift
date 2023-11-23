//
//  ViewControllerEx02.swift
//  FileExampleDemo
//
//  Created by 김지훈 on 2023/11/20.
//

import UIKit

class ViewControllerEx02: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func CopyBtn(_ sender: Any) {
        /*
         특정 디렉토리에 있는 모든 <이미지> 파일을 새로운 디렉토리로 복사하는 코드를 작성해보세요.

         이미지 파일은 확장자가 .jpg, .png, .gif 인 파일로 가정합니다.
         */
            let fileManager = FileManager.default
            let sourcePath = "/Users/kimjihun/Library/Developer/CoreSimulator/Devices/F30BD4F1-2992-4F7E-A925-54D435C8B494/data/Containers/Data/Application/BDE9CB5F-3B6B-42B9-A4F6-C757B23A15FB/Documents"    // 예시 디렉토리
            let destinationPath = "/Users/kimjihun/Library/Developer/CoreSimulator/Devices/F30BD4F1-2992-4F7E-A925-54D435C8B494/data/Containers/Data/Application/BDE9CB5F-3B6B-42B9-A4F6-C757B23A15FB/Backup" // 예시 디렉토리

            do {
                let files = try fileManager.contentsOfDirectory(atPath: sourcePath)
                
                for file in files {
                    //디렉토리 경로 NSString로 변경
                    let sourceFilePath = (sourcePath as NSString).appendingPathComponent(file)
                    let destinationFilePath = (destinationPath as NSString).appendingPathComponent(file)

                    do{
                        try fileManager.copyItem(atPath: sourceFilePath, toPath: destinationFilePath)

                    } catch let error {
                        print("Error: \(error.localizedDescription)")

                    }
                    
                }
            } catch {
                print(error)
            }
    }
    
}
