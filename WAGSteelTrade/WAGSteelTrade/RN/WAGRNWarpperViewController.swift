//
//  WAGRNWarpperViewController.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/5/18.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
import SnapKit

class WAGRNWarpperViewController: UIViewController {
   
     var rnWarpper : WAGRNWarpper!
     var bNativeNav : Bool?
     var  headCaption : String?
    
    func initWithParams(routerParams:Dictionary<String,Any>)  {
        let jsCodeLocation : URL = URL.init(string: "test/test/test.test")!
//        routerParams["componentName"]
        self.headCaption = routerParams["title"] as? String
        self.bNativeNav = routerParams["nativeNav"] as? Bool
 
        self.rnWarpper = WAGRNWarpper.init(url: jsCodeLocation, moduleName: routerParams["componentName"] as! String, properties: Optional.none!, options:  Optional.none!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view .addSubview(self.rnWarpper.rootView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.rnWarpper.rootBridge.eventDispatcher().sendDeviceEvent(withName: "EventReminder", body: ["name":"refresh"])
        if self.bNativeNav! {
            
        }else{
            self.navigationController?.setNavigationBarHidden(true, animated:animated )
        }
        
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
