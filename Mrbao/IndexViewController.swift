//
//  SearchViewController.swift
//  Mrbao
//
//  Created by jinpeng on 2017/5/5.
//  Copyright © 2017年 金鹏. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var remen: UIButton!
    @IBOutlet weak var xinfa: UIButton!
    @IBOutlet weak var xinwen: UIButton!
    @IBAction func xinwenac(_ sender: UIButton) {
        let space:CGFloat = 2
        xinwen.setNeedsLayout()
        xinwen.layoutIfNeeded()
        
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x:0,y:(xinwen.titleLabel?.frame.size.height)!+space,width:(xinwen.titleLabel?.frame.size.width)!,height:1)
        xinwen.titleLabel?.layer.addSublayer(border)
        if (remen.titleLabel?.layer.sublayers?.count)! > 1{
            remen.titleLabel?.layer.sublayers?.remove(at: (remen.titleLabel?.layer.sublayers?.count)! - 1)
        }
        
        if (xinfa.titleLabel?.layer.sublayers?.count)! > 1{
            xinfa.titleLabel?.layer.sublayers?.remove(at: (xinfa.titleLabel?.layer.sublayers?.count)! - 1)
        }

        
    }
    @IBAction func xinfaac(_ sender: UIButton) {
        let space:CGFloat = 2
        xinfa.setNeedsLayout()
        xinfa.layoutIfNeeded()
        
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x:0,y:(xinfa.titleLabel?.frame.size.height)!+space,width:(xinfa.titleLabel?.frame.size.width)!,height:1)
        xinfa.titleLabel?.layer.addSublayer(border)
        
        if (remen.titleLabel?.layer.sublayers?.count)! > 1{
            remen.titleLabel?.layer.sublayers?.remove(at: (remen.titleLabel?.layer.sublayers?.count)! - 1)
        }
        if (xinwen.titleLabel?.layer.sublayers?.count)! > 1{
            xinwen.titleLabel?.layer.sublayers?.remove(at: (xinwen.titleLabel?.layer.sublayers?.count)! - 1)
        }
    }
    @IBAction func remenac(_ sender: UIButton) {
        let space:CGFloat = 2
        remen.setNeedsLayout()
        remen.layoutIfNeeded()
        
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x:0,y:(remen.titleLabel?.frame.size.height)!+space,width:(remen.titleLabel?.frame.size.width)!,height:1)
        remen.titleLabel?.layer.addSublayer(border)
        if (xinwen.titleLabel?.layer.sublayers?.count)! > 1{
            xinwen.titleLabel?.layer.sublayers?.remove(at: (xinwen.titleLabel?.layer.sublayers?.count)! - 1)
        }

        if (xinfa.titleLabel?.layer.sublayers?.count)! > 1{
            xinfa.titleLabel?.layer.sublayers?.remove(at: (xinfa.titleLabel?.layer.sublayers?.count)! - 1)
        }
    }
    //所有搜索结果
    let array = ["beijing", "shanghai","guangzhou","shenzhen" ,"changsha","wuhan","tianjing","hangzhou"]
    //当前搜索结果
    var result = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubview(toFront: tableView)
        // 搜索内容为空时，显示全部内容
        self.result = self.array
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //显示搜索栏默认文字
        self.searchBar.placeholder = "搜索"
        //初始状态下
        tableView.isHidden = true
        //显示取消按钮
        self.searchBar.showsCancelButton = true
        
        //右侧显示一本小书，可用于显示历史记录，暂且不用
        //self.searchBar.showsBookmarkButton = true
        
        // 注册tableviewCell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //self.view.backgroundColor = UIColor.clear
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("[ViewController searchBar] searchText: \(searchText)")
        //开始搜索时显示table
        tableView.isHidden = false
        // 没有搜索内容时显示全部内容
        if searchText == "" {
            self.result = self.array
            tableView.isHidden = true
            
        } else {
            
            // 匹配用户输入的前缀，不区分大小写
            self.result = []
            
            for arr in self.array {
                
                if arr.lowercased().hasPrefix(searchText.lowercased()) {
                    self.result.append(arr)
                }
            }
        }
        
        // 刷新tableView 数据显示
        self.tableView.reloadData()
    }
    
    // 搜索触发事件，点击虚拟键盘上的搜索按钮时触发此方法
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //隐藏键盘
        searchBar.resignFirstResponder()
    }
    
    // 书签按钮触发事件，暂时不用
//    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
//        
//        print("搜索历史")
//    }
    
    
    // 取消按钮触发事件
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // 搜索内容置空
        searchBar.text = ""
        self.result = self.array
        self.tableView.reloadData()
        self.tableView.isHidden = true
        //隐藏键盘
        searchBar.resignFirstResponder()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify: String = "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = self.result[indexPath.row]
        
        return cell
    }
    
    func searchBarSearchButtonClicked() {
        print("7 searchBarSearchButtonClicked")
        
        searchBar.endEditing(true)
    }
    
    
    @IBAction func unwindToSearchView(sender: UIStoryboardSegue) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier ?? "" == "OpenGlossaryList" {
            guard let button = sender as? UIButton else {
                fatalError("Unexpected: 1")
            }
            
            guard let glossaryView = segue.destination as? GlossaryViewController else {
                fatalError("Unexpected: 2")
            }
            
            glossaryView.barButtonLeftText = (button.titleLabel?.text)!
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
