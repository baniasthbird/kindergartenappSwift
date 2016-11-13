//
//  UserInfo.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/16.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit

class UserInfo: NSObject,NSCoding {
    
    var arr_menus:[Dictionary<String,AnyObject>]!
    
    var str_token:String!
    
    var str_account:String!
    
    var str_id:String!
    
    var str_name:String!
    
    var nickname:String!
    
    var str_org:String?
    
    var str_phonenumber:String!
    
    var str_role:String!
    
    var str_schoolcode:String!
    
    init (arr_menus:[Dictionary<String,AnyObject>],str_token:String,str_account:String,str_id:String,str_name:String,nickname:String,str_org:String,str_phonenumber:String,str_role:String,str_schoolcode:String)
    {
        self.arr_menus=arr_menus
        self.str_token=str_token
        self.str_account=str_account
        self.str_id=str_id
        self.str_name=str_name
        self.nickname=nickname
        self.str_org=str_org
        self.str_phonenumber=str_phonenumber
        self.str_role=str_role
        self.str_schoolcode=str_schoolcode
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.arr_menus, forKey: "menus")
        aCoder.encode(self.str_token, forKey: "token")
        aCoder.encode(self.str_name, forKey: "name")
        aCoder.encode(self.nickname, forKey: "nickname")
        aCoder.encode(self.str_org, forKey: "orgnization")
        aCoder.encode(self.str_id, forKey: "id")
        aCoder.encode(self.str_role, forKey: "role")
        aCoder.encode(self.str_schoolcode, forKey: "schoolcode")
        aCoder.encode(self.str_account, forKey: "account")
        aCoder.encode(self.str_phonenumber, forKey: "phonenumber")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.str_name = aDecoder.decodeObject(forKey: "name") as! String!
        self.str_phonenumber = aDecoder.decodeObject(forKey: "phonenumber") as! String!
        self.str_token = aDecoder.decodeObject(forKey: "token") as! String!
        self.str_account = aDecoder.decodeObject(forKey: "account") as! String!
        self.nickname = aDecoder.decodeObject(forKey: "nickname") as! String!
        self.str_schoolcode = aDecoder.decodeObject(forKey: "schoolcode") as! String!
        self.str_role = aDecoder.decodeObject(forKey: "role") as! String!
        self.str_id = aDecoder.decodeObject(forKey: "id") as! String!
        self.str_org = aDecoder.decodeObject(forKey: "orgnization") as! String!
        self.arr_menus =  aDecoder.decodeObject(forKey: "menus") as! Array!
        
        super.init()

    }

}
