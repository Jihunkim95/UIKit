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
          let filemgr = FileManager.default
          let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)[0]
          
          databasePath = dirPaths.appendingPathComponent("contact.db").path // 경로 설정
          
          if !filemgr.fileExists(atPath: databasePath) {
              let contactDB = FMDatabase(path: databasePath)
              
              if contactDB.open() {
                  let sql_stmt = "create table if not exists T_Test (id integer primary key autoincrement, name text, address text, phone text, email text)"
                  
                  if !contactDB.executeStatements(sql_stmt) {
                      print("Error: \(contactDB.lastErrorMessage())")
                  }
                  contactDB.close()
              } else {
                  print("Error: \(contactDB.lastErrorMessage())")
              }
          }
      }
      @IBAction func saveContact(_ sender: Any) {
          let contactDB = FMDatabase(path: databasePath)
          dump(databasePath)
          if contactDB.open() {
            
              let isDataExistQuery = "SELECT EXISTS (SELECT 1 FROM T_Test WHERE name = ?)"
              
              do {
                  let resultSet = try contactDB.executeQuery(isDataExistQuery, values: [name.text ?? ""])
                  
                  if resultSet.next(), resultSet.bool(forColumnIndex: 0) {
                      // 데이터가 존재하면 UPDATE 수행
                      let updateQuery = "UPDATE T_Test SET name = ?, address = ?, phone = ?, email = ? WHERE name = ?"
                      try contactDB.executeUpdate(updateQuery, values: [name.text ?? "", address.text ?? "", phone.text ?? "", email.text ?? "", name.text ?? ""])
                  } else {
                      // 데이터가 존재하지 않으면 INSERT 수행
                      let insertQuery = "INSERT INTO T_Test (name, address, phone, email) VALUES (?, ?, ?, ?)"
                      try contactDB.executeUpdate(insertQuery, values: [name.text ?? "", address.text ?? "", phone.text ?? "", email.text ?? ""])
                  }
                  
              } catch {
                  status.text = "contact 추가 실패!!"
              }
              
              status.text = "Contact Added"
              name.text = ""
              address.text = ""
              phone.text = ""
              email.text = ""
              
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

                      //                    print("\(address ?? ""), \(phone ?? "")")
                      items.append(T_Test(name: name, address: address, phone: phone, email: email))
                  }
                  //                if results?.next() == true {
                  //                    address.text = results?.string(forColumn: "address")
                  //                    phone.text = results?.string(forColumn: "phone")
                  //                    status.text = "Record Found"
                  //                } else {
                  //                    status.text = "Record Not Found"
                  //                    address.text = ""
                  //                    phone.text = ""
                  //                }
                  
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
