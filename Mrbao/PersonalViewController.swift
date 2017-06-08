//
//  PersonalViewController.swift
//  Mrbao
//
//  Created by jinpeng on 2017/5/5.
//  Copyright © 2017年 金鹏. All rights reserved.
//

import UIKit


@IBDesignable class PersonalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var itemStringArr=["我的笔记","历史记录","我的收藏","我的案件","设置"]
    var itemIconArr=["icon17.png","icon19.png","icon05.png","icon01.png","icon09.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //生成背景
        createIconBackground()
        //生成头像
        createIcon()
        //生成菜单
        createTable()
        // Do any additional setup after loading the view.
    }

    func createIconBackground(){
        let iconBackground = UIImageView(frame: CGRect(x:0, y:0, width:kScreenWidth, height: 90))
        iconBackground.backgroundColor = #colorLiteral(red: 0.5578597188, green: 0.7274928689, blue: 1, alpha: 1)
        self.view.addSubview(iconBackground)
    }
    
    func createIcon(){
        let iconImageView = UIImageView(frame: CGRect(x: kScreenWidth/2 - 40, y: 60, width: 80, height: 80))
        iconImageView.backgroundColor = UIColor.red
        iconImageView.image = UIImage(named: "icon.jpeg")
        self.view.addSubview(iconImageView)
        let label = UILabel(frame: CGRect(x: kScreenWidth/2 - 80, y: 140, width: 160, height: 40))
        label.text = "头疼离婚的小包"
        label.textAlignment = .center
        self.view.addSubview(label)
        //用圆角设置头像为圆形
        let imageLayer: CALayer = iconImageView.layer
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = iconImageView.frame.size.height/2
        imageLayer.borderWidth = 2
        
    }
    
    
    func createTable(){
        let table = UITableView.init(frame: CGRect(x: 0.0, y: 200, width: kScreenWidth, height: 300), style:.plain)
        table.delegate = self
        table.dataSource = self
        //实现数据源
        //禁止滚动
        table.isScrollEnabled = false
        //不显示滚动条
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        self.view.addSubview(table)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        let iconImageView = UIImageView(frame: CGRect(x: 15, y: 15, width: 30, height: 30))
        iconImageView.image = UIImage(named: itemIconArr[indexPath.row])
        let label = UILabel(frame: CGRect(x: 60, y: 15, width: 160, height: 30))
        label.text = itemStringArr[indexPath.row]
        //iconImageView.image = UIImage(named: "\(indexPath.row).png")
        //iconImageView.backgroundColor = UIColor.blue
        cell.addSubview(iconImageView)
        cell.addSubview(label)
        //cell.textLabel?.text = itemStringArr[indexPath.row]
        //设置背景图片
        //cell.backgroundView = iconImageView
        //被选中的样式
        //cell.selectionStyle = .default
        
        //cell.accessoryType=UITableViewCellAccessoryType.disclosureIndicator
    return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
