//
//  UserInfoHandler.swift
//  music4Touch
//
//  Created by Mehedi Hasan on 9/8/16.
//  Copyright © 2016 SiliconOrchard. All rights reserved.
//

import Foundation

class UserInfoHandler: NSObject {
    
    static let sharedInstance = UserInfoHandler()

    var userInfo: UserInfo?
    var userId: String?
}