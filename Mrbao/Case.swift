//
//  Case.swift
//  Mrbao
//
//  Created by Albert Ray on 2017/5/17.
//  Copyright © 2017年 金鹏. All rights reserved.
//

import UIKit

class Case {
    // MARK: 属性
    
    var icon: UIImage? = nil
    var title: String = ""
    var img: UIImage? = nil
    var readCount: Int = 0
    
    // MARK: 构造函数
    
    init() {
    }
    
    init?(icon: UIImage?, title: String, img: UIImage?, readCount: Int) {
        if readCount < 0 {
            return nil
        }
        
        self.icon = icon
        self.title = title
        self.img = img
        self.readCount = readCount
    }
}
