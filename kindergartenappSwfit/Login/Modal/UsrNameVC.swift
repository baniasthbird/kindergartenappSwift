//
//  UsrNameVC.swift
//  kindergartenappSwfit
//
//  Created by hnsi-03 on 16/9/20.
//  Copyright © 2016年 zr-mac. All rights reserved.
//

import UIKit

protocol YLSearchDelegate {
    func tableViewDidSelectRow(str_text:String) -> Void
    func searchTextDidChange(searchText:String) -> Void
}

class UsrNameVC: UIViewController , UITextFieldDelegate , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var txt_usr: UITextField!
    
    @IBOutlet weak var tb_usr: UITableView!
    
    var bgColor:UIColor!
    
    var listData:[String]!
    
    var Frame:CGRect!
    
    var x:CGFloat!
    
    var y:CGFloat!
    
    var width:CGFloat!
    
    var height:CGFloat!
    
    var delegate:YLSearchDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_usr.delegate = self
        tb_usr.delegate = self
        tb_usr.dataSource = self
        tb_usr.isHidden = true
        
        self.tb_usr.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnShow(_ sender: AnyObject) {
        if tb_usr.isHidden == true {
            tb_usr.frame = CGRect.init(x: txt_usr.frame.minX, y: txt_usr.frame.maxY + 2 , width: txt_usr.frame.width , height: CGFloat(listData.count * 40))
            self.view.frame = CGRect.init(x: x, y: y, width: width , height: tb_usr.frame.height + 40)
            
            tb_usr.isHidden = false
        }
        else {
            self.view.frame = CGRect.init(x: x, y: y, width: width, height: txt_usr.frame.height)
            tb_usr.isHidden = true
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = self.tb_usr.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        cell.textLabel?.text=self.listData[indexPath.row]
        cell.tag=indexPath.row
        let btn:UIButton = UIButton.init(frame: CGRect.init(x: width-60, y: 10, width: 60, height: 30))
        btn.setTitle("删除", for: UIControlState.normal)
        btn.setTitleColor(UIColor.black, for: UIControlState.normal)
        btn.addTarget(self, action:#selector(self.cellDelete(btn:)), for: UIControlEvents.touchUpInside)
        btn.tag=indexPath.row
        cell.contentView.addSubview(btn)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:UITableViewCell! = self.tb_usr.cellForRow(at: indexPath)
        let str_usrname=cell.textLabel?.text
        delegate.tableViewDidSelectRow(str_text: str_usrname!)
        self.view.frame = CGRect.init(x: x, y: y, width: width, height: txt_usr.frame.height)
        tb_usr.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField .resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func cellDelete(btn:UIButton) -> Void {
        let row = btn.tag
        listData.remove(at: row)
        let indexPath = NSIndexPath.init(row: row, section: 0)
        let arr_indexPath:[NSIndexPath] = [indexPath]
        tb_usr.deleteRows(at: arr_indexPath as [IndexPath], with: UITableViewRowAnimation.none)
    }

}
