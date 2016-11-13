//
//  ParentInfo.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/16.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit

class ParentInfo: NSObject,NSCoding {

    var arr_baby:[Baby]!
    
    init(arr_baby:[Baby])
    {
        self.arr_baby=arr_baby
    }
    
    required init!(coder aDecoder: NSCoder) {
        self.arr_baby=aDecoder.decodeObject(forKey: "babies") as! [Baby]!
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.arr_baby, forKey: "babies")
    }
    
    
}
