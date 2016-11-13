//
//  Class_School.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/17.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit

class Class_School: NSObject,NSCoding {
    
    var userid:String!
    
    var i_id:String!
    
    var rolename:String!
    
    var dutyid:String!
    
    var roleid:String!
    
    var dutyname:String!
    
    var count:String!
    
    override init() {}
    
    init(userid:String,i_id:String,rolename:String,dutyid:String,roleid:String,dutyname:String,count:String) {
        self.userid=userid
        self.i_id=i_id
        self.rolename=rolename
        self.dutyid=dutyid
        self.roleid=roleid
        self.dutyname=dutyname
        self.count=count
    }
    
    required init!(coder aDecoder: NSCoder) {
        self.userid = aDecoder.decodeObject(forKey: "userid") as! String!
        self.i_id = aDecoder.decodeObject(forKey: "i_id") as! String!
        self.rolename = aDecoder.decodeObject(forKey: "rolename") as! String!
        self.dutyid = aDecoder.decodeObject(forKey: "dutyid") as! String!
        self.roleid = aDecoder.decodeObject(forKey: "roleid") as! String!
        self.dutyname = aDecoder.decodeObject(forKey: "dutyname") as! String!
        self.count = aDecoder.decodeObject(forKey: "count") as! String!
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.userid, forKey: "userid")
        aCoder.encode(self.i_id, forKey: "i_id")
        aCoder.encode(self.rolename, forKey: "rolename")
        aCoder.encode(self.dutyid, forKey: "dutyid")
        aCoder.encode(self.roleid, forKey: "roleid")
        aCoder.encode(self.dutyname, forKey: "dutyname")
        aCoder.encode(self.count, forKey: "count")
        
    }

}
