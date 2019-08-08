//
//  WAGRCTBridgeModule.m
//  WAGDriver
//
//  Created by rui on 2016/12/15.
//  Copyright © 2016年 WuAGe. All rights reserved.
//

#import "WAGRCTBridgeModule.h"
#import <React/RCTLog.h>
//#import "WAGBridgeRouter.h"
#import "WAGSteelTrade-Swift.h"

@implementation WAGRCTBridgeModule

RCT_EXPORT_MODULE(WAGBridgeModule);

RCT_EXPORT_METHOD(callNative:(NSString *)serviceName method:(NSString *)method extra:(NSDictionary *)params)
{
    RCTLogInfo(@"callNative %@:%@ %@", serviceName, method, params);
//    [[WAGBridgeRouter sharedInstance] open:[NSString stringWithFormat:@"%@/%@",serviceName,method] withExtra:params];
    [[WAGRNBridgeRouter shareRouter] openWithRouteUrl:[NSString stringWithFormat:@"%@/%@",serviceName,method] params:params];
}

RCT_EXPORT_METHOD(callNativeWithPromise:(NSString *)serviceName method:(NSString *)method extra:(NSDictionary *)params resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    RCTLogInfo(@"callNative %@:%@ %@", serviceName, method, params);
//    [[WAGBridgeRouter sharedInstance] open:[NSString stringWithFormat:@"%@/%@",serviceName,method] withExtra:params resolver:resolve rejecter:reject];
    
    [[WAGRNBridgeRouter shareRouter] openWithRouteUrl:[NSString stringWithFormat:@"%@/%@",serviceName,method] params:params  resolver:resolve  rejecter:reject];
     
    
//      [[WAGBridgeRouter sharedInstance] open:[NSString stringWithFormat:@"%@/%@",serviceName,method] withExtra:params resolver:resolve rejecter:reject];
    
}
@end
