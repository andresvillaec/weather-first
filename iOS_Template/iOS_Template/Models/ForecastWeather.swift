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
    }
}

class ForecastDay: Mappable {
    var temp:Double?
    var description:String?
    var icon:String?
    var date:Date?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temp <- map["list.main.temp"]
        description <- map["list.weather.description"]
        icon <- map["list.weather.0.icon"]
        date <- map["list.dt_txt"]
    }
    
    func getTemperature() -> String{
        let celsius = (temp ?? 0 - 32.0) * (5/9)
        return String(format: "%.0f °", celsius)
    }
    
    func getIconURL() -> URL {
        return URL(string: "https://openweathermap.org/img/w/\(icon!).png")!
    }
}
