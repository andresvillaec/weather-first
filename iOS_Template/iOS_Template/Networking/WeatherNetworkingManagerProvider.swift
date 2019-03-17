//
//  WeatherNetworkingManagerProvider.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/13/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import Moya

enum WeatherNetworkManagerProvider {
    case getCurrentWeather(lat:Double, lon:Double)
    case getForecastWeather(lat:Double, lon:Double)
}

extension WeatherNetworkManagerProvider: TargetType {
    var baseURL : URL {
        return URL(string: "https://api.openweathermap.org/data/2.5")!
    }
    
    var path : String {
        switch self {
        case .getCurrentWeather(_):
            return "/weather"
        case .getForecastWeather(_):
            return "/forecast"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCurrentWeather(_):
            return .get
        case .getForecastWeather(_):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCurrentWeather(let lat, let lon):
            return .requestParameters(parameters: ["APPID": "59f21163b28c9d8c47ec2e0f19ba2078", "units": "metric", "lon": lon, "lat": lat], encoding: URLEncoding.queryString)
        case .getForecastWeather(let lat, let lon):
            return .requestParameters(parameters: ["APPID": "59f21163b28c9d8c47ec2e0f19ba2078", "units": "metric", "lon": lon, "lat": lat], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return[:]
    }
}

