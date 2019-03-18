//
//  ForecastWeather.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/14/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import ObjectMapper

class Forecast: Mappable {
    var cod:Int?
    var message:String?
    var city:String?
    var days:[ForecastDay]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        cod <- map["cod"]
        message <- map["message"]
        city <- map["city.name"]
        days <- map["list"]
    }
}

class ForecastDay: Mappable {
    var temp:Double?
    var description:String?
    var icon:String?
    var date:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temp <- map["main.temp"]
        description <- map["weather.0.description"]
        icon <- map["weather.0.icon"]
        date <- map["dt_txt"]
    }
    
    func getTemperature() -> String{
        return String(format: "%.0f °", temp ?? 0)
    }
    
    func getIconURL() -> URL {
        return URL(string: "https://openweathermap.org/img/w/\(icon!).png")!
    }
}
