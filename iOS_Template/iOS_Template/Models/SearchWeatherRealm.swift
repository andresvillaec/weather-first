//
//  SearchWeatherRealm.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/17/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import RealmSwift

class SearchWeatherRealm:Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var city:String = ""
    @objc dynamic var searchDate:Date = Date.init()
    @objc dynamic var weatherDescription:String = ""
    
    convenience init(currentWeather:CurrentWeather) {
        self.init()
        city = currentWeather.name ?? ""
        searchDate = Date.init()
        weatherDescription = currentWeather.description ?? ""
    }
    
    convenience init(city:String, weatherDescription:String) {
        self.init()
        self.city = city
        self.weatherDescription = weatherDescription
    }
}
