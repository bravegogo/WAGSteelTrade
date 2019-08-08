//
//  WAGRNWarpper.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/5/18.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit

class WAGRNWarpper: NSObject {
    
    let rootView : RCTRootView
    let rootBridge : RCTBridge
    
    init(url:URL!, moduleName:String, properties: Dictionary<String, Any> ,options: Dictionary<String, Any>)
    {
        self.rootView = RCTRootView.init(bundleURL: url,   moduleName: moduleName,   initialProperties: properties, launchOptions: options)
        self.rootBridge = self.rootView.bridge
    }
    
    
}
