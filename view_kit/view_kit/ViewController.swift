//
//  ViewController.swift
//  view_kit
//
//  Created by admin1 on 27.06.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let label = UILabel()
    let buttonAction = UIButton()
    let switchUI = UISwitch()
    let picker = UIPickerView()
    let dataPicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //label
        self.label.frame = CGRect(x: 200, y: 70, width: 100, height: 50)
        self.label.text = "hello world"
        self.label.textAlignment = .center
        self.label.numberOfLines = 3
        self.label.textColor = .green
        self.view.addSubview(label)
        
        
        //button
        self.buttonAction.frame = CGRect(x: 10, y: 70, width: 100, height: 50)
        self.buttonAction.setTitle("klick", for: .normal)
        self.buttonAction.setTitleColor(.black, for: .normal)
        self.buttonAction.layer.cornerRadius = 20
        self.buttonAction.backgroundColor = .blue
        self.buttonAction.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        self.view.addSubview(buttonAction)
        
        //switch
        self.switchUI.frame = CGRect(x: 10, y: 130, width: 0, height: 0)
        self.view.addSubview(self.switchUI)
        self.switchUI.setOn(false, animated: true)
        self.switchUI.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
        //picker
        picker.frame = CGRect(x: self.view.center.x - 100, y: 170, width: 200, height: 120)
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = .purple
        self.view.addSubview(picker)
        
        
        //dataPicker
        dataPicker.frame = CGRect(x: self.view.center.x - 150, y: 300, width: 300, height: 150)
        self.view.addSubview(dataPicker)
        dataPicker.datePickerMode = .date
        dataPicker.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365*24*60*60
        
        let todayDate = Date()
        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
        let twoYearFromToday = todayDate.addingTimeInterval(oneYearTime * 2)
        
        dataPicker.maximumDate = twoYearFromToday
        dataPicker.minimumDate = oneYearFromToday
        
    }
    
    @objc func pressed(sender: UIButton!) {
        self.alert(title: "Vlad привет", message: "nenenne", style: .alert)
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) {(action) in
            let text = alertController.textFields?.first
            self.label.text? += (text?.text)!
        }
        alertController.addTextField{(textField) in textField.isSecureTextEntry = false}
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
                                
    @objc func isOn(target: UISwitch){
        if target.isOn{
            self.buttonAction.isEnabled = false
        }else{
            self.buttonAction.isEnabled = true
        }
    }
    
    @objc func datePickerChange(paramDatePicker: UIDatePicker){
        if paramDatePicker.isEqual(self.dataPicker){
            print("dataChange = ", paramDatePicker.date)
        }
    }
    
}

//MARK: UIpicker

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result  = "row = \(row) + \(component)"
        
        return result
    }
}


