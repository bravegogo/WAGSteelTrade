//
//  WAGLoginManager.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/21.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit

class WAGLoginManager: NSObject {

    func logout() -> Void {
        self.loginDataReq()
        self.loginDBSave()
        
        // 带参数
        let number = 10022
        let numberString = ("\(number)" as String)
        let dict = ["number":numberString];
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "user_logout"), object: dict)
        
    }
    
    func login() -> Void {
        
    }
}
