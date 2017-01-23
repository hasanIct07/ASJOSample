//
//  Response.swift
//  ASJOSample
//
//  Created by Mehedi Hasan on 1/23/17.
//  Copyright © 2017 BUET. All rights reserved.
//

import Foundation
import ObjectMapper

class Response: Mappable {

    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
    }
}

extension Response {
    
    class Object: Response {
        var foo: String?
        var url: NSURL?
        
        override func mapping(map: Map) {
            foo <- map["args.foo"]
            url <- (map["url"], Transform.toURL)
        }
    }
    
    
    class WeatherResponse: Response {
        var location: String?
        var threeDayForecast: [Forecast]?
        
        
        override func mapping(map: Map) {
            location <- map["location"]
            threeDayForecast <- map["three_day_forecast"]
        }
    }
    
    class Forecast: Response {
        var day: String?
        var temperature: Int?
        var conditions: String?

        override func mapping(map: Map) {
            day <- map["day"]
            temperature <- map["temperature"]
            conditions <- map["conditions"]
        }
    }
}