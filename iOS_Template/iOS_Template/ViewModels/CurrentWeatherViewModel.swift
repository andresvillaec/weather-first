//
//  CurrentWeatherViewModel.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/13/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

class CurrentWeatherViewModel {
    let service = CurrentWeatherService()
    var cityName = PublishSubject<String>()
    var temp = PublishSubject<Double>()
    var image = PublishSubject<UIImage>()
    let bag = DisposeBag()
    
    func getCurrentWeatherInfo(lat:Double, lon:Double) {
        service.getCurrentWeather(lat: Double(lat), lon: Double(lon)).subscribe { (event) in
            switch event {
            case .success(let weather):
                self.cityName.onNext(weather?.name ?? "")
                self.temp.onNext(weather?.getTemperature() ?? 0)
                self.image.onNext(weather?.image ?? UIImage())
                break
            case .error(let error):
                print(error)
                break
            }
        }.disposed(by: bag)
    }
}
