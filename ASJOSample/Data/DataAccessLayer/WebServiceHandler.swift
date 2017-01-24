//
//  WebServiceHandler.swift
//  music4Touch
//
//  Created by Shoeb Amin on 8/23/16.
//  Copyright © 2016 SiliconOrchard. All rights reserved.
//

import Foundation
import Alamofire

private let url =  "http://musicdev.despicableapps.com/api"

class WebServiceHandler: NSObject {
    
    static let sharedInstance = WebServiceHandler()
    override init() {
        //print("AAA");
    }
    
    struct UserRegInfo {
        var userID: String = ""
        var deviceID: String = ""
    }

    
    //API - 01
    func getUserInfo(completion: (result: Bool, returnDic: [String: AnyObject]) -> Void) {

        UserInfoHandler.sharedInstance.userId = "10"
        
        if let userId = UserInfoHandler.sharedInstance.userId {
            
            let parameters = ["func_id": "1",
                              "uid": Constants.uuid,
                              "user_id": userId]
            
            Alamofire.request(.POST, url, parameters: parameters)
                .responseJSON { response in
                    
                    switch response.result {
                    case .Success(let JSON):
                        print("Success with JSON: \(JSON)")
                        
                        let responseDic = JSON as! NSDictionary
                        var success = false
                        
                        if let resultVal = responseDic[Constants.RESULT_KEY] {
                            
                            success = (resultVal as! NSNumber).boolValue
                        }
                        
                        if success {
                            let userInfo = UserInfo(jsonDic: responseDic[Constants.USER_INFO_KEY] as! [String : AnyObject])
                            completion(result: true, returnDic:["message":userInfo])
                        }else{
                            let error_msg = responseDic[Constants.ERROR_MSG_KEY]!
                            completion(result: false, returnDic:["message": error_msg])
                        }
                        
                        
                    case .Failure(let error):
                        print("Request failed with error: \(error)")
                        completion(result: false, returnDic:["message": error.localizedDescription])
                        
                    }
                    
            }
        }
    }
    
}
