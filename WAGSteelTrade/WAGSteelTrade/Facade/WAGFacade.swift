//
//  WAGLogicFacade.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/21.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit

// static let _shareLogicFacade = WAGLogicFacade()

class WAGFacade: NSObject {

    lazy  var chatManager : WAGChatManager  = {
        () -> WAGChatManager in
        let   chatManagertmp = WAGChatManager()
        return chatManagertmp
    }()
    
    lazy  var mineManager : WAGMineManager  = {
        
      let  mineManagerTep = WAGMineManager()
      return mineManagerTep
    }()
    
    lazy  var sellerManager : WAGSellerManager = {
        () -> WAGSellerManager in
        let  managerTep = WAGSellerManager()
         return managerTep
    }()
    
    lazy  var loginManager : WAGLoginManager = {
        
        ()-> WAGLoginManager in
        let  managerTep = WAGLoginManager()
        return managerTep

    }()
    
    lazy  var routerManager :  WAGRouterManager = {
        ()-> WAGRouterManager in
        let  managerTep = WAGRouterManager()
        return managerTep

    }()
    
    lazy  var netService :  WAGNetService =  {
        ()-> WAGNetService in
        let  managerTep = WAGNetService()
        return managerTep
        
    }()
    
    lazy  var databaseService :  WAGDatabaseService =  {
        ()-> WAGDatabaseService in
        let  managerTep = WAGDatabaseService()
        return managerTep
        
    }()
    
    
    class func shareManager()->WAGFacade{
        
        struct  Singleton {
            static let shareLogicFacade = WAGFacade()
        }
        return Singleton.shareLogicFacade
    }
    
    private override init() {
//         chatManager = WAGChatManager()
//         mineManager = WAGMineManager()
//         sellerManager = WAGSellerManager()
//         loginManager = WAGLoginManager()
//         routerManager = WAGRouterManager.init()
     }
    
}
