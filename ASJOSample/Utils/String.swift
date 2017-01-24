//
//  String.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import Foundation


extension String
{
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return true
        }
    }
}