//
//  WAGNetService.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/4/21.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
import Alamofire

class WAGNetService: NSObject {

    func loadRequest(URLStr:String ,params:Dictionary<String, Any>?, method:String ,  callback:@escaping (Any) -> Void) ->  DataRequest {
//        func loadRequest(URLStr:String ,params:Dictionary<String, Any>?, method:String , successCallback:(Any) -> Void , failCallback:(Any) -> Void ) ->  DataRequest {
        var reqParams :Dictionary = Dictionary<String, Any>()
        if params != nil {
            reqParams = params!
        }else{
            
            
        }
        reqParams["key"] = "value"
        
        let dataReq : DataRequest  = Alamofire.request(URLStr, parameters: reqParams)
            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
              
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                callback(response)
        }
         return dataReq
    }
    
}
