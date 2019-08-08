//
//  WAGTabBarViewController.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/30.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
import CYLTabBarController


class WAGTabBarViewController: CYLTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 
        UITabBarItem.appearance().setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.blue], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.red], for: .selected)
        self.tabBarItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedStringKey: UIFont.systemFont(ofSize: 18)], for: .normal)
        
        
        let controllerName = ["WAGHomePageViewController","WAGWorkBenchViewController","WAGChatViewController","WAGMineViewController"]
        // titles of tabbar
        let titles = ["首页","工作台","消息","我的"]
        // selected images of tabbar
        let selectedImages =
            ["tabbar_icon_home_selected","tabbar_icon_workbench_selected", "tabbar_icon_message_selected","tabbar_icon_account_selected"]
        // unselected images of tabbar
        let images =
            ["tabbar_icon_home_default","tabbar_icon_workbench_default","tabbar_icon_message_default","tabbar_icon_account_default"]
 
        var tabBarItemsAttributes = [[AnyHashable: Any]]()
        var viewControllers = [UIViewController]()
        
        for i in 0 ..< titles.count
        {
            let dict: [AnyHashable: Any] = [
                CYLTabBarItemTitle: titles[i],
                CYLTabBarItemImage: images[i],
                CYLTabBarItemSelectedImage: selectedImages[i]
            ]
            
            let  controllerNameStr = controllerName[i]
            let cls:AnyClass!  = NSClassFromString(String("WAGSteelTrade." + controllerNameStr))
            
            let viewControllerCls = cls  as! UIViewController.Type
            
            let vc = viewControllerCls.init()
            
            let nav = WAGNavigatioViewController.init(rootViewController: vc)
 
            tabBarItemsAttributes.append(dict)
            
            viewControllers.append(nav)
        }
        
        self.tabBarItemsAttributes = tabBarItemsAttributes
        self.viewControllers = viewControllers
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
