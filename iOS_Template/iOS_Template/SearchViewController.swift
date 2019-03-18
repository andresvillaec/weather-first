//
//  SearchViewController.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/16/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxKingfisher
import RealmSwift

protocol AddCityDelegate {
    func addCity(city:String)
}

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherUIImageView: UIImageView!
    
    let currentWeatherVM = CurrentWeatherViewModel()
    let bag = DisposeBag()
    var currentWeather:CurrentWeather?
    
    var delegate:AddCityDelegate?
    var cities = ["Quito", "Cuenca"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityTextField.delegate = self
        
        bindViewModel()
    }
    
    func bindViewModel() {
        goButton.rx.tap.bind {
            self.currentWeatherVM.getCurrentWeatherByCity(city: self.cityTextField.text ?? "")
            
           
        }.disposed(by: bag)
        
        currentWeatherVM.temp.bind(to: tempLabel.rx.text).disposed(by: bag)
        currentWeatherVM.iconURL.bind(to: weatherUIImageView.kf.rx.image()).disposed(by: bag)
        
        let searchWeatherRealm = SearchWeatherRealm(city: "Quito", weatherDescription: "Muy frio")
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(searchWeatherRealm)
                
                NotificationCenter.default.post(name: NSNotification.Name("WeatherSearchNotification"), object: nil, userInfo: ["currentWeather": searchWeatherRealm])
            }
        } catch {}
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cityPickerView.isHidden = true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        cityPickerView.isHidden = false
        cityTextField.text = cities[cityPickerView.selectedRow(inComponent: 0)]
        return false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityTextField.text = cities[row]
        pickerView.isHidden = true
    }
}
