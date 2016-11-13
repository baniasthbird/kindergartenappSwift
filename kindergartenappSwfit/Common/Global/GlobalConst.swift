//
//  GlobalConst.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/19.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import Foundation
import UIKit

let TeacherAdditionPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("Teacheradditon.data")


let UserInfoPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("UserInfo.data")

let ParentAdditionPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("Parentadditon.data")

let BabyNowPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("Babynow.data")

let userTeacherPath =  NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("UserTeacher.data")

let Width = UIScreen.main.bounds.width

let Height = UIScreen.main.bounds.height

let version = UIDevice.current.systemVersion

let iPhone4_4s = (Width == 320 && Height == 480 ? true : false)

let iPhone5_5s = (Width == 320 && Height == 568 ? true : false)

let iPhone6 = (Width == 375 && Height == 667 ? true : false)

let iPhone6_plus = (Width == 414 && Height == 736 ? true : false)

let iPad = (Width == 768 && Height == 1024 ? true : false)
