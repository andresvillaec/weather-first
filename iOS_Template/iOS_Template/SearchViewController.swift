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
    
    var delegate:AddCityDelegate?
    var cities = ["Quito", "Cuenca"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityPickerView.delegate = self
        cityPickerView.dataSource = self
        cityTextField.delegate = self
    }
    
    @IBAction func goButtonPressed(_ sender: Any) {
        
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
