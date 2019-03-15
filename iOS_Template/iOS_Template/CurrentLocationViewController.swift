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
        
        bindViewModel()
    }
    
    func bindViewModel() {
        searchWeatherButton.rx.tap.bind {
            self.currentWeatherVM.getCurrentWeatherInfo(lat:37.785834, lon:-122.406417)
        }.disposed(by: bag)
        
        currentWeatherVM.cityName.bind(to: cityLabel.rx.text).disposed(by: bag)
        currentWeatherVM.temp.map { String($0) }.bind(to: temperatureLabel.rx.text).disposed(by: bag)
        currentWeatherVM.image.bind(to: weatherImageView.rx.image).disposed(by: bag)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        print("geo = \(userLocation.coordinate)")
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
    
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
                print(placemark.locality!)
                print(placemark.administrativeArea!)
                print(placemark.country!)
                
//                self.labelAdd.text = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
            }
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}
