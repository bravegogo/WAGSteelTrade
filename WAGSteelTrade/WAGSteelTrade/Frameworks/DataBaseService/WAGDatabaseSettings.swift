//
//  WAGDatabaseSettings.swift
//  WAGSteelTrade
//
//  Created by yanjing on 2018/5/8.
//  Copyright © 2018年 yj. All rights reserved.
//

import UIKit
import GRDBCipher
import CryptoSwift

class WAGDatabaseService: NSObject {

    var dbConfiguration: Configuration!
    private var dbDirectoryPath: String!
    private var filename: String!
    private var dbQueue: FMDatabaseQueue!

    func makeDatabaseQueue(filename: String? = nil) throws{
        
        self.filename = filename
        let dbPoolDirectoryName = "GRDBTestCase-\(ProcessInfo.processInfo.globallyUniqueString)"
        dbDirectoryPath = (NSTemporaryDirectory() as NSString).appendingPathComponent(dbPoolDirectoryName)
        do {
            try FileManager.default.removeItem(atPath: dbDirectoryPath)
        } catch {   }
        
        dbConfiguration = Configuration()
        
        #if GRDBCIPHER_USE_ENCRYPTION
            dbConfiguration.passphrase =  self.creatDBKey()
        #endif
        
        try FileManager.default.createDirectory(atPath: dbDirectoryPath, withIntermediateDirectories: true, attributes: nil)
        let dbPath = (dbDirectoryPath as NSString).appendingPathComponent(filename ?? ProcessInfo.processInfo.globallyUniqueString)
        let dbQueue = try FMDatabaseQueue(path: dbPath, configuration: dbConfiguration)
        self.dbQueue = dbQueue
        
 
     }
 
    func creatDBKey( ) -> String {
        let tmpKey : String = dbDirectoryPath + filename
        
        let keyStr = tmpKey.md5()
        return keyStr
        
    }
    
    
    func checkDatabase( ) ->  Bool {
         var success : Bool = false
         self.dbQueue.inTransaction({
            (db, objRes) in
        
            do{
                let setRes :FMResultSet? = try db.executeQuery("PRAGMA quick_check", values: nil)
                if setRes == nil{
                    success = false
                 }else {
                     let rsStr = setRes!.string(columnName:"quick_check")
                     if rsStr == "ok"{
                        success = true
                     }else{
                        success = false
                    }
                 }
                
             }catch{
                success = false
            }
       })
      
        return success
    }
    
    func creatDBTable(dbSql:String, dbPath:String ,  error : inout NSError) ->  Bool {
        
        var success : Bool = false
        self.dbQueue.inTransaction({
            (db, objRes) in
            
                let res:Bool = db.executeUpdate(dbSql, argumentsInArray: nil)
                if res {
                    success = res
                }else{
                    success = res
                }
                error  = db.lastError
 
        })
        
        return success
     }
    
}
