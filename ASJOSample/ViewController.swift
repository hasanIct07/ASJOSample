//
//  ViewController.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/22/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //webCall()
        //callObjectMapper()
        callSwiftyJSON()
    }
    
    
    
    func webCall(){
        
        let urlString = "http://httpbin.org/get"
        let params: [String: AnyObject] = ["foo": "bar"]
        
        
        Alamofire.request(.GET, urlString, parameters: params)
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
        }
        
        Alamofire.request(.GET, urlString, parameters: ["foo": "bar"]).response { request, response, data, error in
            
            if let json = self.nsdataToJSON(data!) {
                print(json)
            }
            
            if let data = data, let utf8Text = String(data: data, encoding: NSUTF8StringEncoding) {
                print("Data: \(utf8Text)")
            }
            
        }
        
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
        }
        
    }
    
    func callObjectMapper() {
        
        let urlString = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        
        Alamofire.request(.GET, urlString)
            .responseJSON { response in
                //debugPrint(response)
                
                if let JSON = response.result.value {
                    
                    let weatherResponse = Mapper<Response.WeatherResponse>().map(JSON)
                    
                    print(weatherResponse?.location)
                    
                    if let threeDayForecast = weatherResponse?.threeDayForecast {
                        for forecast in threeDayForecast {
                            print(forecast.day)
                            print(forecast.temperature)
                        }
                    }
                }
        }
        
    }
    
    func callSwiftyJSON() {
        
        let urlString = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        
        Alamofire.request(.GET, urlString).response { request, response, data, error in
            
            let json = JSON(data: data!)
            
            let condition = json["three_day_forecast"][1]["conditions"].string
            let day = json["three_day_forecast"][1]["day"].string
            let temp = json["three_day_forecast"][1]["temperature"].int
    
            print(condition)
            print(day)
            print(temp)
        }
    }
    
    
    //MARK:- Convert NSData to JSON

    func nsdataToJSON(data: NSData) -> AnyObject? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }

    func jsonToNSData(json: AnyObject) -> NSData?{
        do {
            return try NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions.PrettyPrinted)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }
    
}

