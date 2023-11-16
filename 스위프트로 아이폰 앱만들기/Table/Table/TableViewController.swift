//
//  TableViewController.swift
//  Table
//
//  Created by 김지훈 on 2023/11/16.
//

import UIKit
import SwiftUI

var items = ["수분 섭취","비타민 섭취","따듯한 샤워","백신 접종"]
var itemsImageFile = ["water.png","vitamin.png","shower.png","jusa.png","rest.png"]
class TableViewController: UITableViewController, UISearchBarDelegate {
    //검색시 담을 배열
    var filteredData: [String] = []
    //section
    let sections = ["Section"]
    //세 개의 뷰에 있는 오브젝트에 아웃렛 변수와 액션 함수 추가하기
    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        //edit버튼 위치
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    // 새 목록에 추가된 동작 reload 
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //테이블 내부 섹션
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #섹션당 열수
        return filteredData.count == 0 ? items.count : filteredData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
        
        return cell
    }
    

    
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//         Return false if you do not want the specified item to be editable.
//        return true
//    }
//    

    // 목록 삭제 동작
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    //delete 한글화
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // 목록 순서 바꾸기
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        //이동위치 저장
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        //이동할 아이템의 이미지 저장
        let itemImageToMave = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        //이동할 아이템을 삭제
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        //이동할 아이템 삭제후 인덱스 재정렬
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        //삭제된 아이템을 이동할 위치로 삽입 후 재정렬
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMave, at: (fromIndexPath as NSIndexPath).row)
    }
 

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[(indexPath! as NSIndexPath).row])
        }
    }
    
    // UISearchBarDelegate 메서드 구현
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 검색어가 변경될 때 호출되는 메서드
        // searchText를 사용하여 검색 결과를 업데이트합니다.
        filteredData = searchText.isEmpty ? items : items.filter { $0.lowercased().contains(searchText.lowercased()) }
        print(filteredData)
        tvListView.reloadData()
//        print(searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 키보드의 검색 버튼이 클릭되었을 때 호출되는 메서드
        // 여기에서 실제 검색을 수행하거나 필요한 동작을 수행합니다.
    }

    //섹션 헤더
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return sections[section]
      }
    

}
