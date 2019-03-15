//
//  CurrentLocationViewController.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/13/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import CoreLocation
import RxKingfisher

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate{
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var searchWeatherButton: UIButton!
    
    let currentWeatherVM = CurrentWeatherViewModel()
    let bag = DisposeBag()
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    
    func bindCurrentWeatherViewModel(lat:Double, lon:Double) {
        self.currentWeatherVM.getCurrentWeatherInfo(lat:lat, lon:lon)

        currentWeatherVM.cityName.bind(to: cityLabel.rx.text).disposed(by: bag)
        currentWeatherVM.temp.bind(to: temperatureLabel.rx.text).disposed(by: bag)
        currentWeatherVM.iconURL.bind(to: weatherImageView.kf.rx.image()).disposed(by: bag)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        bindCurrentWeatherViewModel(lat: userLocation.coordinate.latitude, lon: userLocation.coordinate.longitude)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}
