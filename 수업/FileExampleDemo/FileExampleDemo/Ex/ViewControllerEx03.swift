//
//  ViewControllerEx03.swift
//  FileExampleDemo
//
//  Created by 김지훈 on 2023/11/20.
//

import UIKit
/*
 텍스트 박스에 문자를 입력하고 저장한뒤 , 다른 폴더로 텍스트를 역순으로 바꾸어 새로운 파일에 저장하는 코드를 작성해보세요.

 예를 들어, 원본 파일에 "Hello World" 가 있으면, 새로운 파일에 "dlroW olleH" 가 저장되어야 합니다.
 */
class ViewControllerEx03: UIViewController {

    @IBOutlet var textBox: UITextField!
    var fileMgr = FileManager.default

    
    //원본
    let sourcePath = "/Users/kimjihun/Library/Developer/CoreSimulator/Devices/F30BD4F1-2992-4F7E-A925-54D435C8B494/data/Containers/Data/Application/BDE9CB5F-3B6B-42B9-A4F6-C757B23A15FB/Documents/text.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkFile()
    }
    
    // 사용자가 앱을 시작할 때마다 데이터 파일이 존재하는지 확인
    // 파일이 존재하는 경우 앱에서 콘텐츠를 읽고 텍스트 필드에 표시
    // - 사용자가 이전에 텍스트를 저장하지 않은 경우 파일이 생성되지 않음
    func checkFile() {
        
        let dirPaths = fileMgr.urls(for: .documentDirectory, in: .userDomainMask)

        // 파일이 존재하는 경우 파일 내용을 읽고, 텍스트필드에 넣음
        if fileMgr.fileExists(atPath: sourcePath) {
//            dump("파일위치 \(sourcePath)")
            if let databuffer = fileMgr.contents(atPath: sourcePath) {
                let datastring = NSString(data: databuffer, encoding: String.Encoding.utf8.rawValue)
                textBox.text = datastring as String?
            }
        }
        
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        // 텍스트필드 객체의 텍스트를 변환하고 이를 Data 객체에 할당
        // 그 내용을 파일 관리자 객채의 createFile() 메서드를 호출하여 파일에 기록
        if let text = textBox?.text {
            let databuffer = text.data(using: String.Encoding.utf8)
            fileMgr.createFile(atPath: sourcePath, contents: databuffer, attributes: nil)
            
            simpleAlert("저장성공!!")
        }
    }
    
    // Alert 알림창
    func simpleAlert(_ message: String) {
        let alert = UIAlertController(title: "Save", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    /*
     특정 파일에 있는 텍스트를 역순으로 바꾸어 새로운 파일에 저장하는 코드를 작성해보세요.
     예를 들어, 원본 파일에 "Hello World" 가 있으면, 새로운 파일에 "dlroW olleH" 가 저장되어야 합니다.
     */

    @IBAction func reverseBtn(_ sender: Any) {

        
        let destinationDirectory = "/Users/kimjihun/Library/Developer/CoreSimulator/Devices/F30BD4F1-2992-4F7E-A925-54D435C8B494/data/Containers/Data/Application/BDE9CB5F-3B6B-42B9-A4F6-C757B23A15FB/Backup" // 예시 디렉토리

        let fileManager = FileManager.default
 
        // 대상 파일 경로 (원본 파일 이름을 그대로 사용)
        let destinationPath = (destinationDirectory as NSString).appendingPathComponent("text.txt")

        do {
            // 디렉토리 생성
            try fileManager.createDirectory(atPath: destinationDirectory, withIntermediateDirectories: true, attributes: nil)

            // 파일 복사
            try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)

            // 읽기
            let originalText = try String(contentsOfFile: destinationPath, encoding: .utf8)

//            dump(originalText)
            // 텍스트를 역순으로 바꾸기
            let reversedText = String(originalText.reversed())

            // 저장
            try reversedText.write(toFile: destinationPath, atomically: true, encoding: .utf8)

            print("Text reversed and saved successfully.")
        } catch {
            print("Error: \(error)")
        }
    }
}
