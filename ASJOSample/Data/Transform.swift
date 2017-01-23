//
//  Transform.swift
//  Cyoo
//
//  Created by Ruslan Sokolov on 5/26/16.
//  Copyright © 2016 Ruslan Sokolov. All rights reserved.
//

import Foundation
import ObjectMapper

class Transform {
    
    // MARK: - Public
    
    static let toID = TransformOf<String, Int>(
        fromJSON: { String($0!) },
        toJSON: { $0.map { Int($0)! } })
    
    
    static let toBool = TransformOf<Bool, String>(
        fromJSON: { $0?.lowercaseString == "yes" ? true : false },
        toJSON: { $0 == true ? "yes" : "no" })
    
    static func toEnum<E: RawRepresentable where E.RawValue == String>() -> TransformOf<E, String> {
        return TransformOf<E, String>(
            fromJSON: {
                if let value = $0 {
                    return E(rawValue: value.lowercaseString)
                }
                return nil
            },
            toJSON: {
                if let value = $0 {
                    return value.rawValue
                }
                return nil
        })
    }
    
    static let toURL = TransformOf<NSURL, String>(
        fromJSON: {
            if let value = $0 {
                return NSURL(string:value)
            }
            return nil
        },
        toJSON: {
            if let value = $0 {
                return value.absoluteString
            }
            return nil
        }
    )
    
    
    static let toDate = TransformOf<NSDate, String>(
        fromJSON: {
            if let value = $0 {
                return dateFormatter.dateFromString(value)
            }
            return nil
        },
        toJSON: {
            if let value = $0 {
                return dateFormatter.stringFromDate(value)
            }
            return nil
        }
    )
    
    static let toEncodeString = TransformOf<String, String>(
        fromJSON: {
            if let value = $0 {
                let data = value.dataUsingEncoding(NSUTF8StringEncoding)
                return String(data: data!, encoding: NSNonLossyASCIIStringEncoding) ?? value
            }
            return nil
        },
        toJSON: {
            if let value = $0 {
                let data = value.dataUsingEncoding(NSNonLossyASCIIStringEncoding)
                return String(data: data!, encoding: NSUTF8StringEncoding) ?? value
            }
            return nil
        }
    )
    
    // MARK: - Private
    
    private static var dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        
        return formatter
    }()
}