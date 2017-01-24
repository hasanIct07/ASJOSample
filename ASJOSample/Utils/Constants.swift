//
//  Constants.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let uuid = UIDevice.currentDevice().identifierForVendor!.UUIDString
    
    static let MSG_KEY = "message"
    static let ARRAY_KEY = "array"

    static let RESULT_KEY = "result"
    static let ERR_MSG_KEY = "err_msg"
    static let ERROR_MSG_KEY = "error_msg"
    
    
    static let USER_INFO_KEY = "user_info"
    static let DEVICE_ID_KEY = "device_identifier"
    
    struct UserInfo {
        
        static let USER_ID = "user_id"
        static let ADDRESS = "address"
        static let NAME = "name"
        static let MAIL = "mail"
    }
}