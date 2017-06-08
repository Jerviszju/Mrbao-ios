//
//  Glossary.swift
//  Mrbao
//
//  Created by Albert Ray on 2017/5/18.
//  Copyright © 2017年 金鹏. All rights reserved.
//

import UIKit

class Glossary {
    // MARK: 属性
    
    var title: String = ""
    var content: String = ""
    
    // MARK: 构造函数
    
    init() {
    }
    
    init?(title: String, content: String) {
        self.title = title
        self.content = content
    }
}
