//
//  BaseFunc.swift
//  kindergartenappSwfit
//
//  Created by zr-mac on 16/9/16.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit

class BaseFunc: NSObject {
    
    var refreshImage:Array<UIImage> {
        get {
            return self.refreshImage
        }
        set {
            for i in 0...6 {
                let str_img_name="refresh_"+String(i)
                let image=UIImage.init(named: str_img_name)
                self.refreshImage.append(image!)
            }
        }
        
    }
    
    func GetValueFromDic(dic_tmp:Dictionary<String,NSObject>,str_key:String) -> String {
        let obj_tmp=dic_tmp[str_key]
        let str_tmp=String(describing: obj_tmp)
        return str_tmp
    }
    
    func GetValueFromArray(arr_tmp:Array<NSObject>,i_index:Int) -> String {
        let obj_tmp=arr_tmp[i_index]
        let str_tmp=String(describing: obj_tmp)
        return str_tmp
    }
    
    func IndicatorAnimationView() -> UIImageView {
        let img_refresh=UIImageView.init(frame: CGRect.init(x: UIScreen.main.bounds.width/2-100, y: UIScreen.main.bounds.height/2-100, width: 200, height: 200))
        img_refresh.animationImages=self.refreshImage
        img_refresh.animationDuration=0.5
        img_refresh.animationRepeatCount=0
        return img_refresh
    }

}
