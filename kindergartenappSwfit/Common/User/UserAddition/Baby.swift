//
//  Baby.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/16.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit

class Baby: NSObject,NSCoding {

    var sex:String!
    
    var schoolname:String!
    
    var xuehao:String!
    
    var address:String!
    
    var birthday:String!
    
    var classname:String!
    
    var schoolcode:String!
    
    var gradeid:String!
    
    var xuejihao:String!
    
    var gradename:String!
    
    var name:String!
    
    var classid:String!
    
    init(sex:String,schoolname:String,xuehao:String,address:String,birthday:String,classname:String,schoolcode:String,gradeid:String,xuejihao:String,gradename:String,name:String,classid:String)
    {
        self.sex=sex
        self.schoolname=schoolname
        self.xuehao=xuehao
        self.address=address
        self.birthday=birthday
        self.classname=classname
        self.schoolcode=schoolcode
        self.gradeid=gradeid
        self.xuejihao=xuejihao
        self.gradename=gradename
        self.name=name
        self.classid=classid
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.sex, forKey: "sex")
        aCoder.encode(self.schoolname, forKey: "schoolname")
        aCoder.encode(self.xuehao, forKey: "xuehao")
        aCoder.encode(self.address, forKey: "address")
        aCoder.encode(self.birthday, forKey: "birthday")
        aCoder.encode(self.classname, forKey: "classname")
        aCoder.encode(self.schoolcode, forKey: "schoolcode")
        aCoder.encode(self.gradeid, forKey: "gradeid")
        aCoder.encode(self.xuejihao, forKey: "xuejihao")
        aCoder.encode(self.gradename, forKey: "gradename")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.classid, forKey: "calssid")
    }
    
    required init!(coder aDecoder: NSCoder) {
        self.sex = aDecoder.decodeObject(forKey: "sex" ) as! String!
        self.schoolname = aDecoder.decodeObject(forKey: "schoolname") as! String!
        self.xuehao = aDecoder.decodeObject(forKey: "xuehao") as! String!
        self.address = aDecoder.decodeObject(forKey: "address") as! String!
        self.birthday = aDecoder.decodeObject(forKey: "birthday") as! String!
        self.classname = aDecoder.decodeObject(forKey: "classname") as! String!
        self.schoolcode = aDecoder .decodeObject(forKey: "schoolcode") as! String!
        self.gradeid = aDecoder.decodeObject(forKey: "gradeid") as! String!
        self.xuejihao = aDecoder.decodeObject(forKey: "xuejihao") as! String!
        self.gradename = aDecoder.decodeObject(forKey: "gradename") as! String!
        self.name = aDecoder.decodeObject(forKey: "name") as! String!
        self.classid = aDecoder.decodeObject(forKey: "classid") as! String!
        
        super.init()
    }
    
}
