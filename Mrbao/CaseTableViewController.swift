//
//  CaseTableViewController.swift
//  Mrbao
//
//  Created by Albert Ray on 2017/5/17.
//  Copyright © 2017年 金鹏. All rights reserved.
//

import UIKit

class CaseTableViewController: UITableViewController {
    // MARK: 属性
    
    var cases: Array<Case> = []
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: 生命周期

    // 载入时
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64)
        
        loadSampleCase()
    }
    
    private func loadSampleCase(){
        let icon1 = UIImage(named: "icon06")
        let title1 = "医患沟通纠纷案例分析"
        let img1 = UIImage(named: "case01")
        let readCount1 = 509
        let case1 = Case(icon: icon1, title: title1, img: img1, readCount: readCount1)
        cases.append(case1!)
        
        let icon2 = UIImage(named: "icon14")
        let title2 = "离婚房产权分配"
        let img2 = UIImage(named: "case02")
        let readCount2 = 619
        let case2 = Case(icon: icon2, title: title2, img: img2, readCount: readCount2)
        cases.append(case2!)
    }

    // MARK: 管理TableView
    
    // TableView中的Section数量
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Section中的Row数量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cases.count
    }

    // Row中的Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CaseTableViewCell", for: indexPath) as! CaseTableViewCell
        
        let myCase = cases[indexPath.row]
        cell.icon.image = myCase.icon
        cell.title.text = myCase.title
        cell.img.image = myCase.img
        cell.readCount.setTitle(String(myCase.readCount), for: UIControlState.normal)
        
        return cell
    }
    
    @IBAction func unwindToCaseList(sender: UIStoryboardSegue) {
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
