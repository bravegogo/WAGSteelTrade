//
//  WAGMineViewController.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/30.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
typealias LogoutCallbackBlock =  () -> Void

class WAGMineViewController: UIViewController {

    public var logoutCallbackBlock: LogoutCallbackBlock?
    
    static func initWithParams(params: RouterParameter?) -> UIViewController {
        //        guard let demo = params?["demo"] as? Demo else {
        //            fatalError("params is wrong")
        //        }
        let rvc = WAGMineViewController()
        return rvc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
 
        let logoutbtn :UIButton = UIButton.init(type:.custom )
        logoutbtn.setTitle("退出", for: UIControlState.normal)
        logoutbtn.backgroundColor = UIColor.brown
        logoutbtn.addTarget(self, action: #selector(logoutBtnAction), for: UIControlEvents.touchUpInside)
        self.view .addSubview(logoutbtn)
        
        
        logoutbtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
            make.right.equalTo(self.view.snp.right ).offset(-30)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.height.equalTo(40)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @objc func logoutBtnAction(){
//        if self.loginCallbackBlock != nil {
//            self.loginCallbackBlock!()
//        }
        
        WAGFacade.shareManager().loginManager.logout()
        
        if self.logoutCallbackBlock != nil {
            self.logoutCallbackBlock!()
        }
        
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
