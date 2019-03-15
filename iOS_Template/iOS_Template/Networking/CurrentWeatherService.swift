//
//  CurrentWeatherService.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/13/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

typealias CurrentWeatherSequence = PrimitiveSequence<SingleTrait, CurrentWeather?>

class CurrentWeatherService {
    private let provider = MoyaProvider<WeatherNetworkManagerProvider>()
    
    func getCurrentWeather (lat:Double, lon:Double) -> CurrentWeatherSequence {
        return provider.rx.request(.getCurrentWeather(lat:lat, lon:lon))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .map { Mapper<CurrentWeather>().map(JSONObject: $0) }
    }
}
