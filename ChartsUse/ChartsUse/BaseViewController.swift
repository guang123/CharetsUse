//
//  BaseViewController.swift
//  MyApp
//
//  Created by Yx on 15/6/25.
//  Copyright (c) 2015年 Yx. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    let IS_IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0;
    let IS_IOS8 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0;
    let ScreenWith = UIScreen.mainScreen().bounds.width;
    let Screenheight = UIScreen.mainScreen().bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fitIOS()
        var leftButton = UIButton(frame:CGRectMake(5, 39, 52, 28));
        leftButton.setTitle("返回", forState: UIControlState.Normal);
        leftButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        leftButton.setBackgroundImage(UIImage(named:"nonaml_btn"), forState: UIControlState.Normal);
        leftButton.addTarget(self, action:Selector("backAction:"), forControlEvents:UIControlEvents.TouchUpInside )
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton);
        
        var rightButton = UIButton(frame:CGRectMake(275, 39, 52, 28));
        rightButton.setTitle("保存", forState: UIControlState.Normal);
        rightButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        rightButton.setBackgroundImage(UIImage(named:"nonaml_btn"), forState: UIControlState.Normal);
        rightButton.addTarget(self, action:Selector("saveAction:"), forControlEvents:UIControlEvents.TouchUpInside )
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton);
        
        var barButtonItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        
        if IS_IOS7{
            barButtonItem.width = -10
        }else{
            barButtonItem.width = 0
        }
        self.navigationItem.setLeftBarButtonItems(([barButtonItem, self.navigationItem.leftBarButtonItem!] as [AnyObject]), animated: true)
        self.navigationItem.setRightBarButtonItems(([barButtonItem, self.navigationItem.rightBarButtonItem!] as [AnyObject]), animated: true)
    }
    
    //MARK:-适配IOS7
    func fitIOS()
    {
        if IS_IOS7
        {
            self.edgesForExtendedLayout = .None;
            self.extendedLayoutIncludesOpaqueBars = true;
        }
    }
    
    func backAction(button:UIButton){
        println(button.titleForState(.Normal));
        navigationController?.popViewControllerAnimated(true);
    }
    
    func savesaveAction(button:UIButton){
    
    }
    
    ///返回当前View X
    func viewFramX(view:UIView) ->CGFloat{
        return view.frame.origin.x
    }
    ///返回当前View Y
    func viewFramY(view:UIView) ->CGFloat{
        return view.frame.origin.y
    }
    ///返回当前View H
    func viewFramH(view:UIView) ->CGFloat{
        return view.frame.size.height
    }
    ///返回当前View W
    func viewFramW(view:UIView) ->CGFloat{
        return view.frame.size.width
    }
    ///设置色值
    func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)-> UIColor
    {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
