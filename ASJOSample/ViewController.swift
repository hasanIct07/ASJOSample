//
//  ViewController.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webCall()
    }
    
    
    
    func webCall(){
        
        let urlString = "http://httpbin.org/get"
        let parameters: [String: AnyObject] = ["foo": "bar"]
        
        /*
        Alamofire.request(.GET, urlString, parameters: ["foo": "bar"])
            .responseJSON { response in
                debugPrint(response)     // prints detailed description of all response properties
                
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    
                    let foo = (JSON["args"] as? [String: AnyObject])?["foo"] as? String
                    print(foo)
                }
        }*/
        
        
        Alamofire.request(.GET, urlString, parameters: ["foo": "bar"]).response { request, response, data, error in
//            print(request)
//            print(response)
//            print(data)
//            print(error)
            
            if let json = self.nsdataToJSON(data!) {
                print(json)
            }
            
            if let data = data, let utf8Text = String(data: data, encoding: NSUTF8StringEncoding) {
                print("Data: \(utf8Text)")
            }

        }
        /*
        Alamofire.request(.GET, urlString, parameters: ["foo": "bar"], encoding: .URL).responseJSON { response in
                debugPrint(response)
        }
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: nil).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }*/
        
    }
    
    
    
    // Convert from NSData to json object
    func nsdataToJSON(data: NSData) -> AnyObject? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
    // Convert from JSON to nsdata
    func jsonToNSData(json: AnyObject) -> NSData?{
        do {
            return try NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions.PrettyPrinted)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }
    
}

