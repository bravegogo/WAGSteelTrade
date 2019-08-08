//
//  WAGRNBridgeRouter.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/5/17.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit

 typealias BridgeRouterBlock =  ( _ dic:Dictionary<String, Any>) -> Void
 typealias ResolverBlock =  ( _ para:Any) -> Void

@objc(WAGRNBridgeRouter)
class WAGRNBridgeRouter: NSObject {
    
    
    var routerDicList: Dictionary<String, Any>
    
   @objc
    class func shareRouter()->WAGRNBridgeRouter{
        
        struct  Singleton {
            static let shareLogicFacade = WAGRNBridgeRouter()
        }
        return Singleton.shareLogicFacade
    }
    
    private override init() {
       self.routerDicList = Dictionary.init()
        
    }
   @objc
    func setupRouter() -> Void {
        self.routerDicList["key/test"] = {
            (dic:Dictionary<String, Any>) in
 
            } as Any
    }
    @objc
    func regRouter(routeUrl:String , block:@escaping BridgeRouterBlock) -> Void {
        self.routerDicList[routeUrl] = block
    }
    
    @objc
    func open(routeUrl:String , params:Dictionary<String, Any> ) -> Void {
        
        let  routerBlock: BridgeRouterBlock! = self.routerDicList[routeUrl] as! BridgeRouterBlock
        
        if routerBlock != nil {
             DispatchQueue.main.async {
                routerBlock(params)
            }
        }
        
    }
    
    @objc
    func open(routeUrl:String , params:Dictionary<String, Any>, resolver:ResolverBlock,
              rejecter:( String, String, Error)->Void  ) -> Void {
 
    }
    
}
