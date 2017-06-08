//
//  GlossaryDetailViewController.swift
//  Mrbao
//
//  Created by Albert Ray on 2017/5/18.
//  Copyright © 2017年 金鹏. All rights reserved.
//

import UIKit

class GlossaryDetailViewController: UIViewController {

    var data: Glossary? = nil
    
    @IBOutlet weak var buttonBarLeft: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonBarLeft.title = "< " + (data?.title ?? "")
        textView.text = data?.content
    }
}
