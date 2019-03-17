//
//  ForecastService.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/15/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

typealias ForecastSequence = PrimitiveSequence<SingleTrait, Forecast?>

class ForecastService {
    private let provider = MoyaProvider<WeatherNetworkManagerProvider>()
    
    func getForecastWeather (lat:Double, lon:Double) -> ForecastSequence {
        return provider.rx.request(.getForecastWeather(lat:lat, lon:lon))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .map { Mapper<Forecast>().map(JSONObject: $0) }
    }
}
