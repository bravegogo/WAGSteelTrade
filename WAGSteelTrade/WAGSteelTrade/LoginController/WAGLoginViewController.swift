//
//  WAGLoginViewController.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/29.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
import SnapKit
//import RxSwift
//import RxCocoa

typealias LoginCallbackBlock =  () -> Void

class WAGLoginViewController: UIViewController {

    
    var loginCallbackBlock : LoginCallbackBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let btn: UIButton = UIButton.init(type:UIButtonType.custom)
        btn.setTitle("登录", for: UIControlState.normal)
        btn.backgroundColor = UIColor.brown
        btn.isEnabled = true
        btn.addTarget(self, action: #selector(loginBtnAction), for: UIControlEvents.touchUpInside)
        
//         let disposeBag = DisposeBag()
 
 
//        let rxUser: Observable  = btn.rx.tap.subscribe(onNext: { () in
//
//            WAGFacade.shareManager().loginManager.login()
//
//            if self.loginCallbackBlock != nil {
//                self.loginCallbackBlock!()
//            }
//        }, onError: { (Error) in
//
//        }, onCompleted: {
//            WAGFacade.shareManager().loginManager.login()
//
//            if self.loginCallbackBlock != nil {
//                self.loginCallbackBlock!()
//            }
//
//        })
        
        self.view .addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
            make.right.equalTo(self.view.snp.right ).offset(-30)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.height.equalTo(40)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func loginBtnAction(){
        
        WAGFacade.shareManager().loginManager.login()
        
        if self.loginCallbackBlock != nil {
            self.loginCallbackBlock!()
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
