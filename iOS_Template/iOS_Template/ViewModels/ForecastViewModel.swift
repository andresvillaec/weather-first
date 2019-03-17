//
//  ForecastViewModel.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/15/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//


import Foundation
import RxSwift
import RxDataSources

class ForecastViewModel {
    let service = ForecastService()
    var city = PublishSubject<String>()
    let days:PublishSubject<[ForecastDay]> = PublishSubject<[ForecastDay]>()
    let bag = DisposeBag()
    
    func getForecast(lat:Double, lon:Double) {
        service.getForecastWeather(lat: Double(lat), lon: Double(lon)).subscribe { (event) in
            switch event {
            case .success(let forecast):
                self.city.onNext(forecast?.city ?? "")
                self.days.onNext(forecast?.days ?? [])
                break
            case .error(let error):
                print(error)
                break
            }
            }.disposed(by: bag)
    }
}
