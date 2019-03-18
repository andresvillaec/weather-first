//
//  CurrentWeather.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/13/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import ObjectMapper

class CurrentWeather: Mappable {
    var id:Int?
    var name:String?
    var description:String?
    var icon:String?
    var temp:Double?
    var image:UIImage?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["weather.0.description"]
        icon <- map["weather.0.icon"]
        temp <- map["main.temp"]
    }
    
    func getTemperature() -> String{
        return String(format: "%.0f °", temp ?? 0)
    }
    
    func getIconURL() -> URL {
        return URL(string: "https://openweathermap.org/img/w/\(icon!).png")!
    }
}
