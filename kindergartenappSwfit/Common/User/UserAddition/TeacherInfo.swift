//
//  TeacherInfo.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/17.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit

class TeacherInfo: NSObject,NSCoding {
    
    var arr_class:[Class_School]!
    
    var dic_school:Class_School!
    
    init(arr_class:[Class_School],dic_school:Class_School)
    {
        self.arr_class=arr_class
        self.dic_school=dic_school
    }
    
    
    required init!(coder aDecoder: NSCoder) {
        self.arr_class=aDecoder.decodeObject(forKey: "classes") as! Array<Class_School>!
        self.dic_school=aDecoder.decodeObject(forKey: "school") as! Class_School!
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.arr_class, forKey: "classes")
        aCoder.encode(self.dic_school, forKey: "school")
    }

}
