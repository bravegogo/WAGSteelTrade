//
//  WAGRouterManager.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/5/1.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit

let HomePagePath = "HomePagePath"
let WorkBenchPath = "WorkBenchPath"
let ChatPagePath = "ChatPagePath"
let LoginPagePath = "LoginPagePath"
let MinePagePath = "MinePagePath"


class WAGRouterManager {
//    var routerControllerPath :RouterControllerPath!
    var mainRouter: Router!

    init( )
    {
        self.mainRouter = Router.init()
        self.routabelConfigs()
    }
    
    func routabelConfigs( ){
      
        let  homePageRouterPath = RouterControllerPath.init(urlPath: HomePagePath, controller:WAGHomePageViewController.self , optParams:RouterParameter())
        self.mainRouter .map(routerPath: homePageRouterPath, key: homePageRouterPath.keyPath)
        
        
        let  minePagePathRouter =  RouterControllerPath.init(urlPath: MinePagePath, controller:WAGMineViewController.self , optParams:RouterParameter())
        self.mainRouter .map(routerPath: minePagePathRouter, key: minePagePathRouter.keyPath)
       
    }
}

class RouterControllerPath: RouterPathable {
    
     var any: AnyClass
    
    var params: RouterParameter?
    
    var keyPath :String!
    
    

    required init(urlPath: String?, controller: AnyClass) {
        self.any = controller
        self.keyPath = urlPath
    }
    
    required init(urlPath: String?, controller: AnyClass, optParams:RouterParameter) {
        self.any = controller
        self.keyPath = urlPath
        self.params = optParams
 
    }
   
    

    
}
