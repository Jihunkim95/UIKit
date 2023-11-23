//
//  ViewController.swift
//  DatabaseDemo
//
//  Created by 김지훈 on 2023/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var name: UITextField!
    
    @IBOutlet var address: UITextField!
    
    @IBOutlet var phone: UITextField!
    
    @IBOutlet var status: UILabel!
    
    @IBOutlet var email: UITextField!
    var databasePath = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDB()
    }
    
    //초기 DB설정
    func initDB(){
        databasePath = getDatabasePath()
        
         if !FileManager.default.fileExists(atPath: databasePath) {
             createDatabase()
         }
        dump(databasePath)
    }
    // 데이터베이스 경로 확인
    func getDatabasePath() -> String {
        let dirPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return dirPaths.appendingPathComponent("contact.db").path
    }
    // 데이터베이스 생성
    func createDatabase() {
        let contactDB = FMDatabase(path: databasePath)

        if contactDB.open() {
            let sqlStmt = "create table if not exists T_Test (id integer primary key autoincrement, name text, address text, phone text, email text)"

            if !contactDB.executeStatements(sqlStmt) {
                print("Error: \(contactDB.lastErrorMessage())")
            }

            contactDB.close()
        } else {
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }

    // 쿼리 생성
    func createQuery() -> String {
        return "insert into T_Test (name, address, phone, email) values ('\(name.text ?? "")', '\(address.text ?? "")','\(phone.text ?? "")','\(email.text ?? "")')"
    }

    // 텍스트 필드 초기화
    func clearTextFields() {
        name.text = ""
        address.text = ""
        phone.text = ""
        email.text = ""
    }

    @IBAction func saveContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)

        if contactDB.open() {
            let sql = createQuery()

            do {
                try contactDB.executeUpdate(sql, values: nil)
            } catch {
                status.text = "contact 추가 실패!!"
            }

            status.text = "Contact Added"
            clearTextFields()

            contactDB.close()
        } else {
            status.text = "DB 열기 오류발생"
            print("Error: \(contactDB.lastErrorMessage())")
        }
    }
    
    // 조회
    @IBAction func findContact(_ sender: Any) {
        let contactDB = FMDatabase(path: databasePath)
         var items = [T_Test]()
        
         if contactDB.open() {
             let sql = "select name, address, phone, email from T_Test where name='\(name.text ?? "")'"

             do {
                 let results: FMResultSet? = try contactDB.executeQuery(sql, values: nil)

                 while results?.next() == true {
                     let name = results?.string(forColumn: "name")
                     let address = results?.string(forColumn: "address")
                     let phone = results?.string(forColumn: "phone")
                     let email = results?.string(forColumn: "email")

                     items.append(T_Test(name: name, address: address, phone: phone, email: email))
                 }
             } catch {
                 print("Error: \(contactDB.lastErrorMessage())")
             }

             contactDB.close()
         } else {
             print("Error: \(contactDB.lastErrorMessage())")
         }

         for i in items {
             address.text = i.address ?? "address 오류"
             phone.text = i.phone ?? "핸드폰 없음"
             email.text = i.email ?? "이메일 없음"
             print("\(i.address ?? ""), \(i.phone ?? ""), \(i.email ?? "")" )
         }
     }
    }
    
//테이블
struct T_Test {
    let name: String?
    let address: String?
    let phone: String?
    let email: String?
}
