//
//  GlossaryViewController.swift
//  Mrbao
//
//  Created by Albert Ray on 2017/5/18.
//  Copyright © 2017年 金鹏. All rights reserved.
//

import UIKit

class GlossaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var barButtonLeftText: String = ""
    @IBOutlet weak var barButtonLeft: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var glossarys: Array<Glossary> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        barButtonLeft.title = "< " + barButtonLeftText
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadSampleGlossary()
    }
    
    private func loadSampleGlossary(){
        let title1 = "离婚条件"
        let content1 = "《婚姻法》第32条规定，如感情已破裂，调解无效应准予离婚。因此，法院判决离婚的条件就是ABCDEFGABCDEFG"
        let glossary1 = Glossary(title: title1, content: content1)
        glossarys.append(glossary1!)
        
        let title2 = "离婚案件处理子女抚养"
        let content2 = "人民法院审理离婚案件，对子女抚养问题，应当依照《中华人民共和国婚姻法》第二十九条ABCDEFGABCDEFG"
        let glossary2 = Glossary(title: title2, content: content2)
        glossarys.append(glossary2!)
    }
    
    // TableView中的Section数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return glossarys.count
    }
    
    // Section中的Row数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Row中的Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlossaryTableViewCell", for: indexPath) as! GlossaryTableViewCell
        
        let glossary = glossarys[indexPath.section]
        cell.title.text = glossary.title
        cell.content.text = glossary.content
        cell.content.textContainer.maximumNumberOfLines = 2
        cell.content.textContainer.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16.0
    }
    
    @IBAction func unwindToCGlossaryList(sender: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier ?? "" == "OpenGlossaryDetail" {
            guard let glossaryTableViewCell = sender as? GlossaryTableViewCell else {
                fatalError("Unexpected: 1")
            }
            
            guard let glossaryDetailView = segue.destination as? GlossaryDetailViewController else {
                fatalError("Unexpected: 2")
            }
            
            guard let indexPath = tableView.indexPath(for: glossaryTableViewCell) else {
                fatalError("Unexpected: 3")
            }
            
            glossaryDetailView.data = glossarys[indexPath.section]
        }
    }
}
