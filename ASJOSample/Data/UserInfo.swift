//
//  UserInfo.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import Foundation

class UserInfo {
    
    var userId: String?
    var name: String?
    var address: String?
    var mail: String?
    
    init(jsonDic: [String: AnyObject]) {
        initWithJSON(jsonDic)
    }
    
    func initWithJSON(jsonDic: [String: AnyObject]) {
        
        if let userId = jsonDic[Constants.UserInfo.USER_ID] as? String {
            self.userId = userId
        }
        
        if let name = jsonDic[Constants.UserInfo.NAME] as? String {
            self.name = name
        }
        
        if let address = jsonDic[Constants.UserInfo.ADDRESS] as? String {
            self.address = address
        }
        
        if let mail = jsonDic[Constants.UserInfo.MAIL] as? String {
            self.mail = mail
        }
    }
    
}