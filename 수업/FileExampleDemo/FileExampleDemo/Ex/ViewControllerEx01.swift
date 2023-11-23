//<현재 디렉토리>에 있는 모든 파일의 이름과 크기를 출력하는 코드를 작성해보세요.

import UIKit

class ViewControllerEx01: UIViewController {
    
    @IBOutlet var textBox: UITextField!
    
    var fileMgr = FileManager.default
    var dataFile: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let currentPath = fileManager.currentDirectoryPath
        do {
            let files = try fileManager.contentsOfDirectory(atPath: currentPath)

            for file in files {
                let filePath = (currentPath as NSString).appendingPathComponent(file)
                
                do {
                    let fileAttributes = try fileManager.attributesOfItem(atPath: filePath)
                    
                    if let fileSize = fileAttributes[FileAttributeKey.size] as? UInt64 {
                        
                        let formattedFileSize = ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .file)
                        
                        print("파일명: \(file), 크기: \(formattedFileSize)")
                    }
                }catch{
                    print("error")
                }
                
            }
        } catch {
            print(error)
        }
    }
    
    @IBAction func saveText(_ sender: Any) {
        // 텍스트필드 객체의 텍스트를 변환하고 이를 Data 객체에 할당
        // 그 내용을 파일 관리자 객채의 createFile() 메서드를 호출하여 파일에 기록
        if let text = textBox?.text {
            let databuffer = text.data(using: String.Encoding.utf8)
            fileMgr.createFile(atPath: dataFile, contents: databuffer, attributes: nil)
            
            simpleAlert("저장성공!!")
        }
    }
    
    // Alert 알림창
    func simpleAlert(_ message: String) {
        let alert = UIAlertController(title: "Save", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
