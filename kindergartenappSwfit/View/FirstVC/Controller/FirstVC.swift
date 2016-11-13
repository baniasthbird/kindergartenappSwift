//
//  FirstVC.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/19.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit
import MBProgressHUD

class FirstVC: UIViewController {

    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var lbl_age: UILabel!
    
    @IBOutlet weak var img_Header: UIImageView!
    
    @IBOutlet weak var view_Describe: UIView!
    
    @IBOutlet weak var lbl_topic: UILabel!
    
    @IBOutlet weak var view_summary: UIView!
    
    @IBOutlet weak var lbl_label1: UILabel!
    
    @IBOutlet weak var lbl_label2: UILabel!
    
    @IBOutlet weak var img_Logo: UIImageView!
    @IBOutlet weak var view_Content: UIView!
    @IBOutlet weak var lbl_num: UILabel!
    var usrInfo:UserInfo!
    
    var i_role:Int!
    
    var teacher:TeacherInfo?
    
    var parentinfo:ParentInfo?
    
    var bgView1:UIView!
    
    var bgView2:UIView!
    
    var bgView3:UIView!
    
    var baseFunc:BaseFunc!
    
    var baby:Baby!
    
    var class_school:Class_School!
    
    var rightButton:UIButton!
    
    var hud:MBProgressHUD!
    
    var cycleView:CycleScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if usrInfo==nil {
            print("从归档处提取")
            usrInfo = NSKeyedUnarchiver.unarchiveObject(withFile: UserInfoPath) as! UserInfo!
        }
        
        let str_role = usrInfo.str_role
        i_role = Int(str_role!)
        
        if i_role==0 {
            print("提取家长数据")
            parentinfo = NSKeyedUnarchiver.unarchiveObject(withFile: ParentAdditionPath) as? ParentInfo
        }
        else if (i_role == 2) {
            print("提取教师数据")
            teacher = NSKeyedUnarchiver.unarchiveObject(withFile: TeacherAdditionPath) as? TeacherInfo
        }
        
        baseFunc=BaseFunc.init()
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.isUserInteractionEnabled=false
      //  hud.dimBackground=true
      
        
        hud.mode=MBProgressHUDMode.customView
        
        let i_image = UIImage.gif(name: "loading")
        let i_result_img =  self.resizeImage(image: i_image!, targetSize: CGSize.init(width: 0.2*Width, height: 0.2*Width))
        let imageview=UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 0.1*Width, height: 0.1*Width))
        imageview.image=i_result_img
        hud.customView=imageview
        //hud.customView!.frame=CGRect.init(x: 0, y: 0, width: 0.1*Width, height: 0.1*Width)
       // let imageview=UIImageView.init(image: image)
      //  hud.customView!.addSubview(imageview)
        hud.bezelView.color=UIColor.clear
        hud.bezelView.frame=CGRect.init(x: 0, y: 0, width: 0.1*Width, height: 0.1*Width)
        
        self.view.addSubview(hud)
        
        hud.show(animated: true)
        
        let tmp_item:UITabBarItem!=self.tabBarController?.tabBar.items![1]
        let img1:UIImage = UIImage.init(named: "second")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tmp_item.image=img1
        
        let img_0:UIImage=(UIImage.init(named: "first")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))!
        let img_selected:UIImage = (UIImage.init(named: "first_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))!
        self.tabBarItem.image=img_0
        self.tabBarItem.selectedImage=img_selected
        
        self.navigationController?.navigationBar.topItem?.title="新马良幼儿园"
        
        cycleView = CycleScrollView.init(frame: CGRect.init(x: 0, y: img_Header.frame.origin.y, width: Width, height: 0.23*Height), animationDuration: 3)
        cycleView.backgroundColor = UIColor.gray
        
        
        var str_banner_img1:String!
        var str_banner_img2:String!
        var str_banner_img3:String!
        var str_banner_img4:String!
        var imageViewArray:Array<UIImageView>!
        
        if i_role==0 {
            if (parentinfo?.arr_baby.count)!>1 {
                rightButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
                rightButton.setImage(UIImage.init(named: "switch"), for: UIControlState.normal)
                rightButton.addTarget(self, action: #selector(self.Switch(btn:)), for: UIControlEvents.touchUpInside)
                self.tabBarController?.navigationItem.rightBarButtonItem=UIBarButtonItem.init(customView: rightButton)
            }
            let baby_now = NSKeyedUnarchiver.unarchiveObject(withFile: BabyNowPath) as? Baby
            if baby_now===nil {
                baby = parentinfo?.arr_baby[0]
            }
            else {
                 baby=baby_now!
            }
            str_banner_img1="img_P_Header1"
            str_banner_img2="img_P_Header2"
            str_banner_img3="img_P_Header3"
            str_banner_img4="img_P_Header4"
            let img1=UIImage.init(named: str_banner_img1)
            let img_view1=UIImageView.init(image: img1)
            let img2=UIImage.init(named: str_banner_img2)
            let img_view2=UIImageView.init(image: img2)
            let img3=UIImage.init(named: str_banner_img3)
            let img_view3=UIImageView.init(image: img3)
            let img4=UIImage.init(named: str_banner_img4)
            let img_view4=UIImageView.init(image: img4)
            img_view1.frame=CGRect.init(x: 0, y: 0, width: Width, height: 0.23*Height)
            img_view2.frame=CGRect.init(x: 0, y: 0, width: Width, height: 0.23*Height)
            img_view3.frame=CGRect.init(x: 0, y: 0, width: Width, height: 0.23*Height)
            img_view4.frame=CGRect.init(x: 0, y: 0, width: Width, height: 0.23*Height)
            
            imageViewArray=[UIImageView]()
            imageViewArray.append(img_view1)
            imageViewArray.append(img_view2)
            imageViewArray.append(img_view3)
            imageViewArray.append(img_view4)
            
            cycleView.fetchContentViewAtIndex = {(pageIndex: NSInteger) in
                return (imageViewArray[pageIndex] as UIView)
            }
            let dataArray=[str_banner_img1,str_banner_img2,str_banner_img3,str_banner_img4]
            cycleView.imageURLArray = dataArray as! Array<String>
            //传入相应的count
            cycleView.totalPageCount = imageViewArray.count
            //设置pageContol的count
            cycleView.pageControl?.numberOfPages = imageViewArray.count
            //点击的闭包
            cycleView.tapActionBlock = { (pageIndex: NSInteger) in
                print(pageIndex)
            }


            self.view.addSubview(cycleView)
            self.view.sendSubview(toBack: cycleView)
            
            lbl_age.isHidden=false
            lbl_age.text=self.CalcAge()
            self.AddButton(role: i_role)

        }
        else if i_role==2 {
           // let teacher = NSKeyedUnarchiver.unarchiveObject(withFile: userTeacherPath) as? TeacherInfo
            lbl_label2.text = teacher?.dic_school.dutyname
            if (teacher?.arr_class.count)! > 1 {
                rightButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
                rightButton.setImage(UIImage.init(named: "switch"), for: UIControlState.normal)
                self.tabBarController?.navigationItem.rightBarButtonItem=UIBarButtonItem.init(customView: rightButton)
            }
            else {
                class_school=teacher?.arr_class[0]
                lbl_label1.text=class_school.dutyname
                lbl_num.text=class_school.count
            }
            lbl_age.isHidden=true
            lbl_topic.text="热点话题"
        }
        else if i_role==3 {
            lbl_age.isHidden=true
            lbl_topic.text="热点话题"
        }
        
        
        //hud.hide(true, afterDelay: 2)
        hud.hide(animated: true, afterDelay: 2)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Switch(btn:UIButton) -> Void {
        
    }

    func CalcAge() -> String {
        let str_birthday=baby.birthday
        let dateformatter = DateFormatter.init()
        dateformatter.dateFormat="yyyy-MM-dd"
        let dateresult = dateformatter.date(from: str_birthday!)
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let result = gregorian?.components(NSCalendar.Unit.month, from: dateresult!, to: NSDate() as Date, options: NSCalendar.Options.init(rawValue: 0))
        
        var temp_year=result?.year
        var temp_month = result?.month
        
        //let str_result:String = String(describing: temp_year) + "岁" + String(describing: temp_month) + "个月"
        temp_year = temp_month! / 12
        temp_month = temp_month! - 12*temp_year!
        
        let str_result = String(temp_year!) + "年" + String(temp_month!) + "个月"
        
        return str_result
    }
    
    
    func resizeImage(image:UIImage,targetSize:CGSize) -> UIImage {
        let size=image.size
        
        let widthRatio = targetSize.width / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        var newSize: CGSize
        if widthRatio>heightRatio {
            newSize = CGSize.init(width: size.width*heightRatio, height: size.height*heightRatio)
        }
        else {
            newSize = CGSize.init(width: size.width*widthRatio, height: size.height*widthRatio)
        }
        
        let rect = CGRect.init(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
    func AddButton(role:Int) -> Void {
        let btn_1=UIButton.init()
        let btn_2=UIButton.init()
        let btn_3=UIButton.init()
        let btn_4=UIButton.init()
        let btn_5=UIButton.init()
        let btn_6=UIButton.init()
        
        var i_fontsize:CGFloat=16
        var i_center_height1:CGFloat=0
        var i_center_height2:CGFloat=0
        let btn_w:CGFloat=0.185*Width
        if iPhone5_5s {
            i_fontsize = 14
            i_center_height1=view_Content.frame.size.height*0.3
            i_center_height2=view_Content.frame.size.height*0.7
        }
        else if iPhone6 {
            i_center_height1=view_Content.frame.size.height*0.4
            i_center_height2=view_Content.frame.size.height*0.8
        }
        else if iPhone6_plus {
            i_center_height1=view_Content.frame.size.height*0.45
            i_center_height2=view_Content.frame.size.height*0.9
        }
        
        btn_1.frame=CGRect.init(x: 0.0644*Width, y: 0.0317*Height, width: btn_w, height: btn_w)
        btn_1.titleLabel?.font=UIFont.init(name: "FZSEJW--GB1-0", size: i_fontsize)
        btn_1.titleEdgeInsets=UIEdgeInsets.init(top: 80, left: 0, bottom: 0, right: 0)
        
        btn_2.frame=CGRect.init(x: 0.412224*Width, y: 0.0317*Height, width: btn_w, height: btn_w)
        btn_2.titleLabel?.font=UIFont.init(name: "FZSEJW--GB1-0", size: i_fontsize)
        btn_2.titleEdgeInsets=UIEdgeInsets.init(top: 80, left: 0, bottom: 0, right: 0)
        
        btn_3.frame=CGRect.init(x: 0.76168*Width, y: 0.0317*Height, width: btn_w, height: btn_w)
        btn_3.titleLabel?.font=UIFont.init(name: "FZSEJW--GB1-0", size: i_fontsize)
        btn_3.titleEdgeInsets=UIEdgeInsets.init(top: 80, left: 0, bottom: 0, right: 0)
        
        btn_4.frame=CGRect.init(x: 0.0644*Width, y: 0.2192*Height, width: btn_w, height: btn_w)
        btn_4.titleLabel?.font=UIFont.init(name: "FZSEJW--GB1-0", size: i_fontsize)
        btn_4.titleEdgeInsets=UIEdgeInsets.init(top: 80, left: 0, bottom: 0, right: 0)
        
        btn_5.frame=CGRect.init(x: 0.412224*Width, y: 0.2192*Height, width: btn_w, height: btn_w)
        btn_5.titleLabel?.font=UIFont.init(name: "FZSEJW--GB1-0", size: i_fontsize)
        btn_5.titleEdgeInsets=UIEdgeInsets.init(top: 80, left: 0, bottom: 0, right: 0)
        
        //家长
        if role==0 {
            btn_1.center=CGPoint.init(x: 0.18*Width, y: i_center_height1)
            btn_1.setBackgroundImage(UIImage.init(named: "p_btn1"), for: UIControlState.normal)
            btn_1.setTitle("今日活动", for: UIControlState.normal)
            btn_1.setTitleColor(UIColor.init(red: 240/255, green: 92/255, blue: 122/255, alpha: 1), for: UIControlState.normal)
            btn_1.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_2.center=CGPoint.init(x: 0.5*Width, y: i_center_height1)
            btn_2.setBackgroundImage(UIImage.init(named: "p_btn2"), for: UIControlState.normal)
            btn_2.setTitle("今日食谱", for: UIControlState.normal)
            btn_2.setTitleColor(UIColor.init(red: 91/255, green: 176/255, blue: 85/255, alpha: 1), for: UIControlState.normal)
            btn_2.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_3.center=CGPoint.init(x: 0.82*Width, y: i_center_height1)
            btn_3.setBackgroundImage(UIImage.init(named: "p_btn3"), for: UIControlState.normal)
            btn_3.setTitle("家园互动", for: UIControlState.normal)
            btn_3.setTitleColor(UIColor.init(red: 124/255, green: 162/255, blue: 232/255, alpha: 1), for: UIControlState.normal)
            btn_3.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_4.center=CGPoint.init(x: 0.18*Width, y: i_center_height2)
            btn_4.setBackgroundImage(UIImage.init(named: "p_btn4"), for: UIControlState.normal)
            btn_4.setTitle("体智发展", for: UIControlState.normal)
            btn_4.setTitleColor(UIColor.init(red: 255/255, green: 181/255, blue: 30/255, alpha: 1), for: UIControlState.normal)
            btn_4.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_5.center=CGPoint.init(x: 0.5*Width, y: i_center_height2)
            btn_5.setBackgroundImage(UIImage.init(named: "p_btn5"), for: UIControlState.normal)
            btn_5.setTitle("相册", for: UIControlState.normal)
            btn_5.setTitleColor(UIColor.init(red: 216/255, green: 142/255, blue: 198/255, alpha: 1), for: UIControlState.normal)
            btn_5.tag=5
            btn_5.addTarget(self, action: #selector(self.Albumn(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_6.frame=CGRect.init(x: 0.76168*Width, y:0.2192*Height , width: btn_w, height: btn_w)
            btn_6.center=CGPoint.init(x: 0.82*Width, y: i_center_height2)
            btn_6.setBackgroundImage(UIImage.init(named: "p_btn6"), for: UIControlState.normal)
            btn_6.tag=6
            btn_6.setTitle("视频", for: UIControlState.normal)
            btn_6.setTitleColor(UIColor.init(red: 250/255, green: 208/255, blue: 52/255, alpha: 1), for: UIControlState.normal)
            btn_6.titleLabel!.font=UIFont.init(name: "FZSEJW--GB1-0", size: i_fontsize)
            btn_6.titleEdgeInsets=UIEdgeInsets.init(top: 80, left: 0, bottom: 0, right: 0)
            btn_6.addTarget(self, action: #selector(self.Albumn(btn:)), for: UIControlEvents.touchUpInside)
            
            view_Content.addSubview(btn_1)
            view_Content.addSubview(btn_2)
            view_Content.addSubview(btn_3)
            view_Content.addSubview(btn_4)
            view_Content.addSubview(btn_5)
            view_Content.addSubview(btn_6)
        }
        //老师
        else if role==2 {
            btn_1.center=CGPoint.init(x: 0.18*Width, y: 0.4*view_Content.frame.size.height)
            btn_1.setBackgroundImage(UIImage.init(named: "t_btn1"), for: UIControlState.normal)
            btn_1.setTitle("发通知", for: UIControlState.normal)
            btn_1.setTitleColor(UIColor.init(red: 238/255, green: 104/255, blue: 72/255, alpha: 1), for: UIControlState.normal)
            btn_1.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_2.center=CGPoint.init(x: 0.5*Width, y: 0.4*view_Content.frame.size.height)
            btn_2.setBackgroundImage(UIImage.init(named: "t_btn2"), for: UIControlState.normal)
            btn_2.setTitle("发照片", for: UIControlState.normal)
            btn_2.setTitleColor(UIColor.init(red: 221/255, green: 143/255, blue: 196/255, alpha: 1), for: UIControlState.normal)
            
            btn_3.center=CGPoint.init(x: 0.82*Width, y: view_Content.frame.size.height*0.4)
            btn_3.setBackgroundImage(UIImage.init(named: "t_btn3"), for: UIControlState.normal)
            btn_3.setTitle("发视频", for: UIControlState.normal)
            btn_3.setTitleColor(UIColor.init(red: 255/255, green: 181/255, blue: 56/255, alpha: 1), for: UIControlState.normal)
            btn_3.tag=6
            btn_3.addTarget(self, action: #selector(self.Albumn(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_4.center=CGPoint.init(x: 0.18*Width, y: 0.8*view_Content.frame.size.height)
            btn_4.setBackgroundImage(UIImage.init(named: "t_btn4"), for: UIControlState.normal)
            btn_4.setTitle("家园互动", for: UIControlState.normal)
            btn_4.setTitleColor(UIColor.init(red: 116/255, green: 163/255, blue: 229/255, alpha:1), for: UIControlState.normal)
            btn_4.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_5.center=CGPoint.init(x: 0.5*Width, y: view_Content.frame.size.height*0.8)
            btn_5.setBackgroundImage(UIImage.init(named: "t_btn5"), for: UIControlState.normal)
            btn_5.setTitle("班级空间", for: UIControlState.normal)
            btn_5.setTitleColor(UIColor.init(red: 216/255, green: 193/255, blue: 116/255, alpha: 1), for: UIControlState.normal)
            btn_5.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            view_Content.addSubview(btn_1)
            view_Content.addSubview(btn_2)
            view_Content.addSubview(btn_3)
            view_Content.addSubview(btn_4)
            view_Content.addSubview(btn_5)
        }
        else if role==3 {
            btn_1.center=CGPoint.init(x: 0.18*Width, y: 0.4*view_Content.frame.size.height)
            btn_1.setBackgroundImage(UIImage.init(named: "h_btn1"), for: UIControlState.normal)
            btn_1.setTitle("发通知", for: UIControlState.normal)
            btn_1.setTitleColor(UIColor.init(red: 238/255, green: 104/255, blue: 72/255, alpha: 1), for: UIControlState.normal)
            btn_1.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_2.center=CGPoint.init(x: 0.5*Width, y: view_Content.frame.size.height*0.4)
            btn_2.setBackgroundImage(UIImage.init(named: "h_btn2"), for: UIControlState.normal)
            btn_2.setTitle("相册", for: UIControlState.normal)
            btn_2.setTitleColor(UIColor.init(red: 221/255, green: 143/255, blue: 196/255, alpha: 1), for: UIControlState.normal)
            btn_2.tag=5
            btn_2.addTarget(self, action: #selector(self.Albumn(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_3.center=CGPoint.init(x: 0.82*Width, y: view_Content.frame.size.height*0.4)
            btn_3.setBackgroundImage(UIImage.init(named: "h_btn3"), for: UIControlState.normal)
            btn_3.setTitleColor(UIColor.init(red: 255/255, green: 181/255, blue: 56/255, alpha: 1), for: UIControlState.normal)
            
            btn_4.center=CGPoint.init(x: 0.18*Width, y: view_Content.frame.size.height*0.8)
            btn_4.setBackgroundImage(UIImage.init(named: "h_btn4"), for: UIControlState.normal)
            btn_4.setTitle("学校空间", for: UIControlState.normal)
            btn_4.setTitleColor(UIColor.init(red: 116/255, green: 163/255, blue: 229/255, alpha: 1 ), for: UIControlState.normal)
            btn_4.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            btn_5.center=CGPoint.init(x: 0.5*Width, y: view_Content.frame.size.height*0.8)
            btn_5.setBackgroundImage(UIImage.init(named: "h_btn5"), for: UIControlState.normal)
            btn_5.setTitle("家园互动", for: UIControlState.normal)
            btn_5.setTitleColor(UIColor.init(red: 216/255, green: 193/255, blue: 115/255, alpha: 1), for: UIControlState.normal)
            btn_5.addTarget(self, action: #selector(self.btn_Click(btn:)), for: UIControlEvents.touchUpInside)
            
            view_Content.addSubview(btn_1)
            view_Content.addSubview(btn_2)
            view_Content.addSubview(btn_3)
            view_Content.addSubview(btn_4)
            view_Content.addSubview(btn_5)
            
            
        }
        
    }
    
    
    func btn_Click(btn:UIButton) -> Void {
        let vc_staytune=self.storyboard?.instantiateViewController(withIdentifier: "view_staytune")
        self.navigationController?.pushViewController(vc_staytune!, animated: true)
    }
    
    func Albumn(btn:UIButton) -> Void {
        var str_category:String = ""
        if btn.tag==5 {
            str_category="相册"
        }
        else if btn.tag==6 {
            str_category="视频"
        }
        let webbrowser:WebBrowserTest!=self.storyboard?.instantiateViewController(withIdentifier: "WebBrowser") as! WebBrowserTest
        webbrowser.str_storyboard=str_category
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // self.AddButton(role: i_role)
    }
    /*
    override func viewDidAppear(_ animated: Bool) {
        cycleView.frame=CGRect.init(x: 0, y: img_Header.frame.origin.y, width: Width, height: 0.23*Height)
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
