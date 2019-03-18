//
//  SearchViewController.swift
//  iOS_Template
//
//  Created by Andres Villavicencio on 3/16/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import UIKit

protocol AddCityDelegate {
    func addCity(city:String)
}

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    var delegate:AddCityDelegate?
    var cities = ["Quito", "Cuenca"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityTextField.delegate = self
    }
    
    func bindViewModel() {
        
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
