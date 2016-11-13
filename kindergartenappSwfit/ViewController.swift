//
//  ViewController.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/16.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit
import Alamofire

extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey: key)
        }
    }
}


class ViewController: UIViewController,UITextFieldDelegate , YLSearchDelegate {
    
    
    @IBOutlet weak var btn_Login: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var view_usr_bg: UIView!
    @IBOutlet weak var bg_Login: UIImageView!
    
    var usrNameVC:UsrNameVC!
    
    var str_reachable:String!
    
    var dataSource:Array<String>!
    
    var i_role:Int?
    
    var usrInfo:UserInfo!
    
    var usrAdditionInfo:Array<Dictionary<String,AnyObject>>?
    
    var str_count_classid:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var images=[UIImage]()
        let img_1=UIImage.init(named: "slide_image1")
        let img_2=UIImage.init(named: "slide_image2")
        let img_3=UIImage.init(named: "slide_image3")
        let img_4=UIImage.init(named: "slide_image4")
        images.append(img_1!)
        images.append(img_2!)
        images.append(img_3!)
        images.append(img_4!)
        
        self.navigationController?.navigationBar.isHidden=true
        
        let pageView:ZLCGuidePageView=ZLCGuidePageView.init(frame: self.view.frame, withImages: images)
        
        self.navigationController?.view.addSubview(pageView)
        
        dataSource=["P01","T01","Y01"]
        
        self.view.backgroundColor=UIColor.init(colorLiteralRed: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        btn_Login.layer.borderWidth=1
        
        btn_Login.layer.borderColor=UIColor.init(colorLiteralRed: 187/255, green: 187/255, blue: 187/255, alpha: 1).cgColor
        
        btn_Login.backgroundColor=UIColor.init(colorLiteralRed: 243/255, green: 131/255, blue: 45/255, alpha: 1)
        
        btn_Login.layer.cornerRadius=10
        
        btn_Login.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        txtPwd.borderStyle=UITextBorderStyle.none
        
        bgView.layer.cornerRadius=10
        
        
        txtPwd.delegate=self
        
        txtPwd.isSecureTextEntry = true
        
        self.usrNameVC = UsrNameVC.init()
        
        usrNameVC.delegate = self
        
        let bandArray = ["P01","T01","Y01"]
        
        self.usrNameVC.listData=bandArray
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let rect_frame = CGRect.init(x: bgView.frame.origin.x+txtPwd.frame.origin.x, y: bgView.frame.origin.y + 5, width: view_usr_bg.frame.size.width, height: view_usr_bg.frame.size.height)
      //  self.usrNameVC.Frame = CGRect.init(x: 100, y: 200, width: 100, height: 50)
        self.usrNameVC.Frame = rect_frame
        self.usrNameVC.x = rect_frame.minX
        self.usrNameVC.y = rect_frame.minY
        self.usrNameVC.width = rect_frame.width
        self.usrNameVC.height = rect_frame.height
        self.usrNameVC.view.frame = rect_frame
        self.usrNameVC.bgColor = self.bgView.backgroundColor
        
        
        self.view.addSubview(self.usrNameVC.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     
    @IBAction func btn_Login(_ sender: AnyObject) {
        let str_usrname=usrNameVC.txt_usr.text!
       // let str_usrname="T01"
        let str_pwd=txtPwd.text!
        
        let str_url="http://123.56.238.120:8080/Base/MobileAccessService"
        
        let param=["reqtype":"validate_logon","userid":str_usrname,"password":str_pwd]
        
        
        
        Alamofire.request(str_url, method: .post, parameters: param).responseJSON { response in
            switch response.result {
            case.success(let json):
                print("\(json)")                           //打印JSON数据
                print("\(type(of: json))")              //JSON的动态类型
                let dict = json as! Dictionary<String,AnyObject>
                self.usrInfo = self.CreateUserInfo(dic_usr: dict)
                let str_token=self.usrInfo.str_token
                let str_id=self.usrInfo.str_id
                let str_role=self.usrInfo.str_role
                let usr_param=["reqtype":"user_relation_info","userid":str_id,"role":str_role,"token":str_token]
                // let origin = dict["origin"] as! String
                self.i_role=Int(str_role!)
                self.AdvanceLogin(str_url:str_url,param:usr_param as! [String : String])

            case.failure(let error):
                print("\(error)")
            }
        }

    }
    
    
    func CreateUserInfo(dic_usr:Dictionary<String,AnyObject>) -> UserInfo {
        let str_token=dic_usr["token"] as! String
        let arr_menus=dic_usr["menus"] as! [Dictionary<String,AnyObject>]
        let dic_tmp_usr=dic_usr["user"] as! Dictionary<String,AnyObject>
        let i_id=dic_tmp_usr["id"] as! Int
        let str_name=dic_tmp_usr["name"] as! String
        let str_nickname=dic_tmp_usr["nickname"] as! String
        let str_account=dic_tmp_usr["account"] as! String
        let i_role=dic_tmp_usr["role"] as! Int
        let str_schoolcode=dic_tmp_usr["schoolid"] as! String
        let o_org=dic_tmp_usr["orgnization"] as AnyObject
        let str_phonenum=dic_tmp_usr["phonenumber"] as! String
        let str_id=String(i_id)
        let str_role=String(i_role)
        let str_org=String(describing: o_org)
        
        let usrInfo:UserInfo = UserInfo.init(arr_menus: arr_menus, str_token: str_token, str_account: str_account, str_id: str_id, str_name: str_name, nickname: str_nickname, str_org: str_org, str_phonenumber: str_phonenum, str_role: str_role, str_schoolcode: str_schoolcode)
        /*
        usrInfo.str_token=str_token
        usrInfo.arr_menus=arr_menus
        usrInfo.str_id=str_id
        usrInfo.str_name=str_name
        usrInfo.nickname=str_nickname
        usrInfo.str_account=str_account
        usrInfo.str_role=str_role
        usrInfo.str_schoolcode=str_schoolcode
        usrInfo.str_org=str_org
        usrInfo.str_phonenumber=str_phonenum
        */
        return usrInfo
    }
    
    func AdvanceLogin(str_url:String,param:[String:String]) -> Void {
        Alamofire.request(str_url, method: .post, parameters: param).responseJSON { response in
            switch response.result {
            case.success(let json):
               // print("\(json)")                           //打印JSON数据
                print("\(type(of: json))")              //JSON的动态类型
                let arr_dict = json as! Array<Dictionary<String,AnyObject>>
                self.usrAdditionInfo = arr_dict
                if self.i_role==0 {
                    self.saveParentAdditionInfo(arr_JSON: arr_dict)
                    self.MoveToNextPage(usrInfo:self.usrInfo)
                }
                else if self.i_role==2 {
                    self.GetClassCount(arr_JSON: arr_dict,url: str_url)
                    /*
                    for index in 0 ..< arr_dict.count {
                        var dic_class = arr_dict[index]
                        let str_roleid = dic_class["roleid"] as! String
                        let i_sub_roleid = Int(str_roleid)
                        if i_sub_roleid == 2 {
                            let str_classid = dic_class["dutyid"] as! String
                            self.str_count_classid=str_classid
                            let num_param = ["reqtype":"get_class_student_count","classid":str_classid]
                           // self.GetClassNum(url: str_url, param: num_param)
                            Alamofire.request(str_url, method: .post, parameters: num_param).responseJSON { response in
                                switch response.result {
                                case.success(let json):
                                    print("\(type(of: json))")              //JSON的动态类型
                                    let dict_count = json as! Dictionary<String,AnyObject>
                                    let dic_addition=self.usrAdditionInfo
                                    let str_classid = self.str_count_classid
                                    let dic_count_key = dict_count.keys.first!
                                    let dic_count_value = dict_count.values.first!
                                    for index in 0 ..< dict_count.count {
                                        var dic_add_addtion = dic_addition?[index]
                                        let str_sub_classid = dic_add_addtion?["dutyid"] as! String
                                        if str_sub_classid == str_classid {
                                            dic_add_addtion?[dic_count_key] = dic_count_value
                                        }
                                    }
                                    print("添加完成")
                                case.failure(let error):
                                    print("\(error)")
                                }
                            }

                        }
                    }
                    */
                    
                }
                
            case.failure(let error):
                print("\(error)")
            }
        }

    }
   
    
    func saveParentAdditionInfo(arr_JSON:Array<Dictionary<String,AnyObject>>) -> Void {
        let arr_babies = self.GenerateBabies(arr_JSON: arr_JSON)
        let parent = ParentInfo.init(arr_baby: arr_babies)
        let ParentAdditionPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("Parentadditon.data")
        NSKeyedArchiver.archiveRootObject(parent, toFile: ParentAdditionPath)
        print("家长数据保存成功")
    }
    
    func MoveToNextPage(usrInfo:UserInfo) -> Void {
        self.SaveUserInfo(usrInfo: usrInfo)
        let next = self.storyboard?.instantiateViewController(withIdentifier: "navMain")
        self.present(next!, animated: true, completion: nil)
    }
    

    func GenerateBabies(arr_JSON:Array<Dictionary<String,AnyObject>>) -> [Baby] {
        var arr_baby = [Baby]()
        for index in 0 ..< arr_JSON.count {
            let dic_baby_info = arr_JSON[index]
            let i_sex = dic_baby_info["sex"] as! Int
            let str_xuehao = dic_baby_info["xuehao"] as! String
            let str_address = dic_baby_info["address"] as! String
            let str_birthday = dic_baby_info["birthday"] as! String
            let str_classname = dic_baby_info["classname"] as! String
            let str_schoolcode = dic_baby_info["schoolid"] as! String
            let str_gradeid = dic_baby_info["gradeid"] as! String
            let str_xuejihao = dic_baby_info["xuejihao"] as! String
            let str_gradename = dic_baby_info["gradename"] as! String
            let str_name = dic_baby_info["name"] as! String
            let str_classid = dic_baby_info["classid"] as! String
            let str_schoolname = dic_baby_info["schoolname"] as! String
            let str_sex=String(i_sex)
            let baby = Baby.init(sex: str_sex, schoolname: str_schoolname, xuehao: str_xuehao, address: str_address, birthday: str_birthday, classname: str_classname, schoolcode: str_schoolcode, gradeid: str_gradeid, xuejihao: str_xuejihao, gradename: str_gradename, name: str_name, classid: str_classid)
         
            arr_baby.append(baby)
        }
        
        return arr_baby
    }
    
    func SaveUserInfo(usrInfo:UserInfo) -> Void {
        let UserInfoPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("UserInfo.data")
        NSKeyedArchiver.archiveRootObject(usrInfo, toFile: UserInfoPath)
        
    }
    
    
    func GetClassCount(arr_JSON:Array<Dictionary<String,AnyObject>>,url:String) -> Void {
        let arr_result = self.GenerateClass(arr_JSON: arr_JSON)
        var b_next_view = true
        for index in 0 ..< arr_result.count {
            let o_class = arr_result[index]
            let str_roleid = o_class.roleid
            let i_sub_roleid = Int(str_roleid!)
            if i_sub_roleid == 2 {
                let str_classid = o_class.dutyid
               // self.str_count_classid=str_classid
                let num_param:[String:String] = ["reqtype":"get_class_student_count","classid":str_classid!]
                // self.GetClassNum(url: str_url, param: num_param)
                Alamofire.request(url, method: .post, parameters: num_param).responseJSON { response in
                    switch response.result {
                    case.success(let json):
                        print("\(type(of: json))")              //JSON的动态类型
                        let dict_count = json as! Dictionary<String,AnyObject>
                        o_class.count = dict_count.values.first as! String!
                        print("添加班级人数完成")
                        for index in 0 ..< arr_result.count {
                            let o_sub_class = arr_result[index]
                            let str_sub_roleid = o_sub_class.roleid
                            let i_sub_roleid = Int(str_sub_roleid!)
                            if i_sub_roleid == 2 {
                                if o_sub_class.count == "0" {
                                    b_next_view = false
                                }
                            }
                        }
                        if (b_next_view == true) {
                            self.SaveTeacherAdditonInfo(arr_result: arr_result)
                            self.MoveToNextPage(usrInfo:self.usrInfo)
                        }
                    case.failure(let error):
                        print("\(error)")
                    }
                }
            }
        }

      
        
    }
    
    
    func  SaveTeacherAdditonInfo(arr_result:[Class_School]) -> Void  {
        var arr_class = [Class_School]()
        var dic_school = Class_School.init()
        for index in 0 ..< arr_result.count  {
            let tmp = arr_result[index]
            let str_roleid = tmp.roleid
            let i_roleid = Int(str_roleid!)
            if i_roleid == 2 {
                arr_class.append(tmp)
            }
            else if i_roleid == 3 {
                dic_school = tmp
            }
        }
        let teacher = TeacherInfo.init(arr_class: arr_class, dic_school: dic_school)
        let TeacherAdditionPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0].appending("Teacheradditon.data")
        NSKeyedArchiver.archiveRootObject(teacher, toFile: TeacherAdditionPath)
        print("家长数据保存成功")

    }
    
    func GenerateClass(arr_JSON:Array<Dictionary<String,AnyObject>>) -> [Class_School] {
        var arr_class=[Class_School]()
        for index in 0 ..< arr_JSON.count {
            let dic_class_info = arr_JSON[index]
            let str_usrid = dic_class_info["userid"] as! String
            let i_id = dic_class_info["id"] as! Int
            let str_rolename = dic_class_info["rolename"] as! String
            let str_dutyid = dic_class_info["dutyid"] as! String
            let str_roleid = dic_class_info["roleid"] as! String
            let str_dutyname = dic_class_info["dutyname"] as! String
            let str_i_id=String(i_id)
            
            let o_class = Class_School.init(userid: str_usrid, i_id: str_i_id, rolename: str_rolename, dutyid: str_dutyid, roleid: str_roleid, dutyname: str_dutyname, count: "0")
            arr_class.append(o_class)
        }
        
        return arr_class
    }
    
    func tableViewDidSelectRow(str_text: String) -> Void {
        usrNameVC.txt_usr.text = str_text
        txtPwd.text = "123456"
    }
    
    func searchTextDidChange(searchText: String) -> Void {
        
    }
    
    
    
    /*
    func GetClassNum(url:String,param:[String:String]) -> Void {
        Alamofire.request(url, method: .post, parameters: param).responseJSON { response in
            switch response.result {
            case.success(let json):
                print("\(type(of: json))")              //JSON的动态类型
                let dict_count = json as! Dictionary<String,AnyObject>
                let dic_count_key = dict_count.keys.first!
                let dic_count_value = dict_count.values.first!
                print("添加完成")
            case.failure(let error):
                print("\(error)")
            }
        }
    }
   */
    
    
}


