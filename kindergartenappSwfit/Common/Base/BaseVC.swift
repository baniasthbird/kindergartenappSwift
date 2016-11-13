//
//  BaseVC.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/16.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    var str_title:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title=str_title
        
        self.navigationController?.navigationBar.titleTextAttributes=[NSForegroundColorAttributeName:[UIColor.white]]
        
        let btn_back=UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 50))
        btn_back.setTitle("返回", for: UIControlState.normal)
        btn_back.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn_back.tintColor=UIColor.white
        btn_back.setImage(UIImage.init(named: "returnlogo"), for: UIControlState.normal)
        btn_back.titleEdgeInsets=UIEdgeInsetsMake(0, 20, 0, 0)
        btn_back.addTarget(self, action:#selector(BackToCenter) , for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem=UIBarButtonItem.init(customView: btn_back)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func BackToCenter() -> Void {
        self.navigationController!.popViewController(animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
